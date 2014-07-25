
echo -ne "\e]0;Existing hotfixes LPE\007"
echo "Find Existing Hotfixes For An LPE"
echo
		
repeat='r'

while [ $repeat == "r" ];
	do
		read -p "Enter Version:" Version
		read -p "Enter LPE Number:" Number
		cd 'D:/Liferay/Dev Tool/cache/'
		cd $Version

		grep LPE-$Number *.xml | 
		grep fixed-issues | 
		sed 's:fix-pack-::' | 
		sed 's:.xml.*::' | 
		grep ^hotfix | 

		while read LINE
			do
				grep $LINE ../blacklist.txt
				
				if [ $? == 1 ]
					then 
						echo $LINE
				fi
			done |

		grep -v Added | 
		sed 's:hotfix-.*-.* .*::' | 
		sed '/^$/d' | 

		while read LINE
			do
				grep $LINE ../hotfix-list.txt
			done | 

		sed 's: :    :'

		echo
		read -p "Press 'R' to run again, or 'Enter' to exit:" repeat;
		echo

	done
