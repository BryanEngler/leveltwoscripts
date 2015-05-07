
# 
# The grab function provides a fast way to create patch branches
# it will create a new branch based on the patch name of the 
# given liferay version:
#
#	grab $patch $base
#
# you can pass in the fully qualified hotfix name:
#
#	e.g. grab hotfix-1234-6120 6120
#
# or you can pass in the last part of a patcher portal tag:
#
# 	e.g. grab fix-12345 6130
#
# the only requirement is that the $patch does not already exist as
# a branch in your repository
#
# depends on grabhotfix and grabtag

if [ -z "$1" ]; then
	echo "#"
	echo "# Please specify a hotfix/tag"
	echo "#"
	return
fi

if [ -z "$2" ]; then
	echo "#"
	echo "# Please specify a fix pack base"
	echo "#"
	return
fi

base=$(git show-ref --tags | grep fix-pack-base-"$2")

if [ -z "$base" ];then
	echo "#"
	echo "# fix-pack-base-"$2" does not exist"
	echo "#"
fi

hotfixlist=(6012 6110 6120)

hotfix=false

for string in ${hotfixlist[@]}
do
	if [[ "$string" == "$2"  ]]; then
		hotfix=true
	fi
done

if [[ "$hotfix" == "true" ]]; then
	grabhotfix "$1" "$2"
else
	grabtag "$1" "$2"
fi