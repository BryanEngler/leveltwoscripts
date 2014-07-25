
echo -ne "\e]0;Customer's Hotfixes\007"
echo "Show The Customer's Hotfixes"
echo
		
repeat='r'

while [ $repeat == "r" ];
	do
		read -p "Enter Version:" Version
		read -p "Enter Customer Name:" Customer
		cd 'D:/Liferay/Dev Tool/cache/'
		echo

		grep -i $Customer- hotfix-list.txt |
		sed 's: .*::' |

		while read LINE;
			do 
				grep $LINE blacklist.txt
				
				if [ $? == 1 ]
					then 
						echo $LINE
				fi
			done |

		while read LINE
			do
				grep -v Added
				echo $LINE
			done |

		sed 's:hotfix-.*-.* .*::' | 
		sed '/^$/d' |

		while read LINE
			do 
				grep -i $LINE.*$Customer- hotfix-list.txt
			done |

		sed 's: :     :' | 
		grep $Version

		echo
		read -p "Press 'R' to run again, or 'Enter' to exit:" repeat;
		echo

	done
