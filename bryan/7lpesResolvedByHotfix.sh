
echo -ne "\e]0;LPE's fixed by hotfix\007"
echo "Find LPE's Fixed By A Hotfix"
echo
		
repeat='r'

while [ $repeat == "r" ];
	do
		read -p "Enter Version:" Version
		read -p "Enter Hotfix Number:" Number
		echo
		cd 'D:/Liferay/Dev Tool/cache/'$Version

		grep "<fixed-issues>" fix-pack-hotfix-$Number-$Version.xml |
		sed 's:<fixed-issues>::' |
		sed 's:</fixed-issues>::' 

		echo
		read -p "Press 'R' to run again, or 'Enter' to exit:" repeat;
		echo

	done
