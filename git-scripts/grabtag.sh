
git show-ref --quiet --verify -- "refs/heads/$1"

if [[ $? != 0 ]]; then
	tag=$(git ls-remote --tags upstream | grep "fix-pack-$1" | cut -d$'\t' -f1)
	
	if [ -z "$tag" ]; then
		echo "# Tag fix-pack-$1 does not exist"
		return
	fi

	git fetch upstream refs/tags/fix-pack-"$1"

	if [[ $? != 0 ]]; then
		echo "# Could not find Tag fix-pack-$1 in upstream"
		return
	fi

	base=$(git describe --tags --abbrev=0 --candidates=1 --match=fix-pack-base-* "$tag")

	if [[ "$base" == *"$2"* ]]; then
		git checkout -b "$1" "fix-pack-base-$2"
		git pull upstream "fix-pack-$1"
	else
		echo "#"
		echo "# fix-pack-base for $1 does not match $2"
		echo "# expected $2, found $base"
		echo "#"
	fi
else
	echo "$1 branch already exists"
fi

