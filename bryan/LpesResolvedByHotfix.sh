echo
cd $2 
grep "<fixed-issues>" fix-pack-hotfix-$1-$2.xml  | sed 's:<fixed-issues>::' | sed 's:</fixed-issues>::' 
echo