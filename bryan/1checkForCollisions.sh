
echo -ne "\e]0;Check for Collisions\007"
echo "Check For Collisions"
echo
		
repeat='p'

while [ $repeat == "p" ];
	do
		read -p "Checking An Existing Hotfix? (Y or N):" Existing
		read -p "Enter Version:" Version

		if [ $Existing == 'y' ]
			then 
				read -p "Enter Hotfix Number:" Number
		fi

		read -p "Enter Customer Name:" Customer
		echo
		cd 'D:/Liferay/Dev Tool'

		if [ $Existing == 'y' ]
			then 
				java -jar lib/fp-dev.jar $Version check hotfix-$Number $Customer
			else
				java -jar lib/fp-dev.jar $Version $Customer
		fi 

		echo
		read -p "Press 'R' to run again, 'P' for new parameters, or 'Enter' to exit:" repeat;
		echo

		while [ $repeat == 'r' ]
			do
				if [ $Existing == 'y' ]
					then 
						java -jar lib/fp-dev.jar $Version check hotfix-$Number $Customer
					else
						java -jar lib/fp-dev.jar $Version $Customer
				fi 
			
				echo
				read -p "Press 'R' to run again, 'P' for new parameters, or 'Enter' to exit:" repeat;
				echo

			done

	done

echo
