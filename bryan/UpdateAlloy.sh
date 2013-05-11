cd D:/Repos/alloy-ui
echo -e "\n""\e[1;33m  Updating alloy-ui...\e[0m"

echo -e "\n"" -Fetching from upstream""\n"
git fetch upstream


echo -e "\n"" -Checking out 1.5.x branch""\n"
git checkout 1.5.x

echo -e "\n"" -Merging upstream 1.5.x into local repo""\n"
git merge upstream/1.5.x

echo -e "\n"" -Pushing local 1.5.x to origin repo""\n"
git push origin 1.5.x


echo -e "\n"" -Checking out 2.0.x branch""\n"
git checkout 2.0.x

echo -e "\n"" -Merging upstream 2.0.x into local repo""\n"
git merge upstream/2.0.x

echo -e "\n"" -Pushing local 2.0.x to origin repo""\n"
git push origin 2.0.x


echo -e "\n"" -Checking out master branch""\n"
git checkout master

echo -e "\n"" -Merging upstream master into local repo""\n"
git merge upstream/master

echo -e "\n"" -Pushing local master to origin repo""\n"
git push origin master


echo -e "\n""\e[1;34m   alloy-ui Update COMPLETE \e[0m""\n"