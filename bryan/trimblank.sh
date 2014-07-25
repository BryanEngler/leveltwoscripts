#usage trimblank [FILE]

temptrimblank="C:/Users/liferay/Desktop/Bryan/commands/tmp/temptrimblankfile.txt"

sed -e :a -e '/^\n*$/{$d;N;};/\n$/ba' $1 > $temptrimblank
cat $temptrimblank > $1
rm $temptrimblank