cd D:/Repos/liferay-plugins
echo -e "\n""\e[1;33m  Updating liferay-plugins...\e[0m"

echo -e "\n"" -Fetching from upstream""\n"
git fetch upstream


echo -e "\n"" -Checking out ee-6.0.x branch""\n"
git checkout ee-6.0.x

echo -e "\n"" -Merging upstream ee-6.0.x into local repo""\n"
git merge upstream/ee-6.0.x

echo -e "\n"" -Pushing local ee-6.0.x to origin repo""\n"
git push origin ee-6.0.x


echo -e "\n"" -Checking out ee-6.1.x branch""\n"
git checkout ee-6.1.x

echo -e "\n"" -Merging upstream ee-6.1.x into local repo""\n"
git merge upstream/ee-6.1.x

echo -e "\n"" -Pushing local ee-6.1.x to origin repo""\n"
git push origin ee-6.1.x


echo -e "\n"" -Checking out master branch""\n"
git checkout master

echo -e "\n"" -Merging upstream master into local repo""\n"
git merge upstream/master

echo -e "\n"" -Pushing local master to origin repo""\n"
git push origin master


echo -e "\n""\e[1;34m   liferay-plugins Update COMPLETE \e[0m""\n"