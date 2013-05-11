echo
grep -i $1 hotfix-list.txt | sed 's: .*::' | while read LINE; do grep $LINE blacklist.txt; if [ $? == 1 ]; then echo $LINE; fi; done | while read LINE; do grep -v Added; echo $LINE; done | sed 's:hotfix-.*-.* .*::' | sed '/^$/d' | while read LINE; do grep -i $LINE.*$1 hotfix-list.txt; done | sed 's: :     :'
echo
