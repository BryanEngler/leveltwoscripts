
git show-ref --quiet --verify -- "refs/heads/$1"

if [[ $? != 0 ]]; then
	if [[ "$1" == *"$2"* ]]; then
		git checkout -b $1 fix-pack-base-$2
		git pull git@github.com:zsoltbalogh/liferay-portal-ee.git fix-pack-$1
	else
		echo "#"
		echo "# fix-pack-base for $1 does not match $2"
		echo "#"
	fi
else
	echo "$1 branch already exists"
fi
