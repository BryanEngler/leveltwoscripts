
echo -ne "\e]0;Check if Blacklisted\007"
echo "Check The Blacklist"
echo
		
repeat='r'

while [ $repeat == "r" ];
	do
		read -p "Enter Version:" Version
		read -p "Enter Hotfix Number:" Hotfix
		cd 'D:/Liferay/Dev Tool/cache/'
		echo

		grep hotfix-$Hotfix-$Version blacklist.txt

		if [ $? == 0 ]
			then
				echo
				echo The hotfix is blacklisted

			else
				echo The hotfix is not blacklisted
		fi

		echo
		read -p "Press 'R' to run again, or 'Enter' to exit:" repeat;
		echo

	done
