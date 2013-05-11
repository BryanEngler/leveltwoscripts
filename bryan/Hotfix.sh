
# Usage- Hotfix.sh [version] [lpp] [lpe] 

echo -e "\n""Creating Hotfix Branch""\n"

git checkout -b LPP-$2-$1 fix-pack-base-$1

if [ $? == 0 ]; then echo LPE-$3 > fix-pack-fixed-issues.txt; fi; 

