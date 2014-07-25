
echo -ne "\e]0;LPP's / Customers\007"
echo "Show LPP's And Customers With This Hotfix"
echo
		
repeat='r'

while [ $repeat == "r" ];
	do
		read -p "Enter Version:" Version
		read -p "Enter Hotfix Number:" Number
		cd 'D:/Liferay/Dev Tool/cache/'
		echo

		grep hotfix-$Number-$Version hotfix-list.txt

		echo
		read -p "Press 'R' to run again, or 'Enter' to exit:" repeat;
		echo

	done
