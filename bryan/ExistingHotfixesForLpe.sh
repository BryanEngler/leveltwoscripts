echo

cd 6012
grep LPE-$1 *.xml | grep fixed-issues | sed 's:fix-pack-::' | sed 's:.xml.*::' | grep ^hotfix | while read LINE; do grep $LINE ../blacklist.txt; if [ $? == 1 ]; then echo $LINE; fi; done | grep -v Added | sed 's:hotfix-.*-.* .*::' | sed '/^$/d' | while read LINE; do grep $LINE ../hotfix-list.txt; done | sed 's: :    :'
cd ../6110
grep LPE-$1 *.xml | grep fixed-issues | sed 's:fix-pack-::' | sed 's:.xml.*::' | grep ^hotfix | while read LINE; do grep $LINE ../blacklist.txt; if [ $? == 1 ]; then echo $LINE; fi; done | grep -v Added | sed 's:hotfix-.*-.* .*::' | sed '/^$/d' | while read LINE; do grep $LINE ../hotfix-list.txt; done | sed 's: :    :'
cd ../6120
grep LPE-$1 *.xml | grep fixed-issues | sed 's:fix-pack-::' | sed 's:.xml.*::' | grep ^hotfix | while read LINE; do grep $LINE ../blacklist.txt; if [ $? == 1 ]; then echo $LINE; fi; done | grep -v Added | sed 's:hotfix-.*-.* .*::' | sed '/^$/d' | while read LINE; do grep $LINE ../hotfix-list.txt; done | sed 's: :    :'
cd ..

echo