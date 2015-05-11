
#
# codebase funcion takes a file that lists hotfixes in the order you want them merged
# and merges those fixes into your current branch. the file should contain lines like:
# 
# 	hotfix-####-####
# 	e.g. hotfix-1234-6120
#
# if merging fix-tags:
#
#	fix-#####
#	e.g. fix-12345
#
# it will create a branch for each hotfix, checkout that branch and then
# the fix-pack-* files. It keeps track of fixed-issues, includes, excludes,
# and resolved conflicts. Next the script iterates over the patches if finds,
# merging them into your current branch. After that is populates the fix-pack-* 
# files with what it parsed from the brnaches during the checkout phase.
#
# depends on "grab" script to create fix branches

BASE_DIR=$HOME

if [ -z "$1" ]; then
	echo "please specify a patching-tool.info file"
	return
fi

echo "#"
echo "# This Script Assumes latest Core for specified branch and Will Resolve All Conflicts By Taking *thiers*"
echo "#"

branch=$(git symbolic-ref HEAD --short)
finished=false
patchOrder=()
index=(0)

echo "" > $BASE_DIR/fixedIssues.txt
echo "" > $BASE_DIR/fixIncludes.txt
echo "" > $BASE_DIR/fixExcludes.txt
echo "" > $BASE_DIR/resolvedConflicts.txt

echo "# Building Patch Dependency List"
echo "#"

git reset head --hard
git clean -df

base=6120

if [ -z "$2" ]; then
	base=$2
fi

until $finished; do
	read line || finished=true

	if [ -z $line ]; then
		continue
	fi

	patch=$(echo $line | cut -d' ' -f 1)
	
	iscore5=$(echo $patch | grep core)

	if [ "" != "$iscore5" ]; then
		patch="core-$2"
	fi

	haslocal=$(git branch | grep $patch)

	if [ "" == "$haslocal" ]; then	
		printf "\n creating branch $patch \n"
		grab $patch $base
	fi

	git checkout $patch

	if [[ $? != 0 ]]; then
		echo "#"
		echo "# Continue With Next Patch"
		echo "# $patch could not be checked out"
		echo "#"
		continue
	fi

	isincluded=false

	for string in ${patchOrder[@]}
	do
		if [[ "$string" == "$patch" ]]; then
			isincluded=true
		fi
	done

	if [[ "$isincluded" == "false" ]]; then
		if [[ "$patch" == *"hotfix"* ]]; then
			if [ -f fix-pack-fixed-issues.txt ]; then
				echo "," >> ~/Desktop/fixedIssues.txt
				cat fix-pack-fixed-issues.txt >> ~/Desktop/fixedIssues.txt 
			else
				git checkout $branch
				echo "# Skipping patch $patch"
				echo "# fixed-issues File Not Found In Branch $patch" 
				continue
			fi

			if [ -f fix-pack-requirements.txt ]; then
				requirements=($(cat fix-pack-requirements.txt | grep -o ",[^\!][^,]*" | grep -v "fix for" | cut -d',' -f 2))

				for i in ${requirements[*]}
				do
					iscore5=$(echo $i | grep core)

					if [ "" != "$iscore5" ]; then
						i="core-6120"
					else
						i+=-6120
					fi

					echo "#"
					echo "# $i is a Requirment of $patch"
					echo "#"
				done
			fi

			if [ -f fix-pack-includes.txt ]; then
				echo "" >> ~/Desktop/fixIncludes.txt
				cat fix-pack-includes.txt >> ~/Desktop/fixIncludes.txt
				echo "adding includes"
			fi

			if [ -f fix-pack-excludes.txt ]; then
				echo "" >> ~/Desktop/fixExcludes.txt
				cat fix-pack-excludes.txt >> ~/Desktop/fixExcludes.txt
				echo "adding excludes"
			fi

			if [ -f fix-pack-resolved-conflicts.txt ]; then
				echo "" >> ~/Desktop/resolvedConflicts.txt
				cat fix-pack-resolved-conflicts.txt >> ~/Desktop/resolvedConflicts.txt
				echo "adding resolved conflicts"
			fi

			patchOrder[$index]=$patch
			let "index=index+1"
		else
			patchOrder[$index]=$patch
			let "index=index+1"
		fi
	fi
done < $1

git checkout $branch

echo "#"
echo "# Merging Branches"
echo "#"

for patch in ${patchOrder[*]}
do
	if [ "" != "$patch" ]; then	
		git merge $patch -X theirs --no-edit

		if [[ $? != 0 ]]; then
			echo "# Failed To Merge $patch"
			return 3
		fi
	fi
done

echo "#"
echo "# Updating Fixed Issues"
echo "#"

cat ~/Desktop/fixedIssues.txt | tr ',' '\n' | sort | uniq | tr '\n' ',' > fix-pack-fixed-issues.txt
fixedIssues=$(cat fix-pack-fixed-issues.txt)
fixedIssues=${fixedIssues%,}
fixedIssues=${fixedIssues#,}

if [[ "$patch" == *"hotfix"* ]]; then
	echo $fixedIssues > fix-pack-fixed-issues.txt
	echo > fix-pack-requirements.txt
	git add .
fi

if [ -f ~/Desktop/fixIncludes.txt ]; then
	cat ~/Desktop/fixIncludes.txt | sort | uniq > fix-pack-includes.txt
fi

if [ -f ~/Desktop/fixExcludes.txt ]; then
	cat ~/Desktop/fixExcludes.txt | sort | uniq > fix-pack-excludes.txt
fi

if [ -f ~/Desktop/resolvedConflicts.txt ]; then
	cat ~/Desktop/resolvedConflicts.txt | sort | uniq > fix-pack-resolved-conflicts.txt
fi

echo "#"
echo "# Code Base Build Complete"
echo "# Please Verify And Commit fix-pack- Documentation"
echo "#"

rm $BASE_DIR/fixedIssues.txt
rm $BASE_DIR/fixIncludes.txt
rm $BASE_DIR/fixExcludes.txt
rm $BASE_DIR/resolvedConflicts.txt
