
echo -ne "\e]0;Customer Fixed Issues\007"
echo "Show The Customer's Fixed Issues"
echo

tmpLPElist="C:/Users/liferay/Desktop/Bryan/commands/tmp/lpelist.txt"
tmpLPElistshort="C:/Users/liferay/Desktop/Bryan/commands/tmp/lpelistshort.txt"
tmpLPElistlong="C:/Users/liferay/Desktop/Bryan/commands/tmp/lpelistlong.txt"
tmpLPElistordered="C:/Users/liferay/Desktop/Bryan/commands/tmp/lpelistordered.txt"
tmpLPElistcsv="C:/Users/liferay/Desktop/Bryan/commands/tmp/lpelistcsv.txt"
		
repeat='r'

while [ $repeat == "r" ];
	do
		read -p "Enter Version:" Version
		read -p "Enter Customer Name:" Customer
		cd 'D:/Liferay/Dev Tool/cache/'

		grep -i $Customer- hotfix-list.txt |

		sed 's: .*::' |

		while read LINE 
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

		sort | 
		uniq |
		grep $Version |

		while read HF
			do 
				echo
				echo $HF fixes:
				cd 'D:/Liferay/Dev Tool/cache/'$Version
				grep "<fixed-issues>" fix-pack-$HF.xml |
				sed 's:<fixed-issues>::' |
				sed 's:</fixed-issues>::' |
				tee -a $tmpLPElist
			done

		cat $tmpLPElist | grep LPE | sed 's:  ::' > $tmpLPElist
		cat $tmpLPElist | sed 's:,:\n:g' | sort | uniq > $tmpLPElist
		cat $tmpLPElist | grep LPE-[0-9][0-9][0-9][0-9]$ > $tmpLPElistshort
		cat $tmpLPElist | grep LPE-[0-9][0-9][0-9][0-9][0-9] > $tmpLPElistlong
		cat $tmpLPElistshort $tmpLPElistlong > $tmpLPElistordered
		cat $tmpLPElistordered | tr '\n' ',' > $tmpLPElistcsv
		cat $tmpLPElistcsv | sed 's:\(.*\),:\1:' > $tmpLPElist

		echo
		echo All issues fixed:

		cat $tmpLPElist

		echo

		rm $tmpLPElist
		rm $tmpLPElistcsv
		rm $tmpLPElistshort
		rm $tmpLPElistlong
		rm $tmpLPElistordered

		echo
		read -p "Press 'R' to run again, or 'Enter' to exit:" repeat;
		echo

	done
