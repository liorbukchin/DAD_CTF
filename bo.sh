# nano CUT(del) line: "CTRL+K"    `Kut`
# nano paste line: "CTRL+U"       `Unkut`
# nano UNDO: "Alt+U" / REDO: "Alt+E"

nl="\n"
SUB="Not Found"

printf "************ START ******************************"
date

if [ "$1" == "" ] || [ "$2" == "" ] ; then
  printf "You forgot a range"$nl
  exit 0
fi

for (( i=$1; i<=$2; i++ )); do                 #for (( c=1; c<=100000; c++ )); do       #for i  in {1..100000}
   curl_o=$(curl -s http://challenges.cyber.org.il/bo/$i.html)

   if [[ "$curl_o" == *"$SUB"* ]]; then        # check if sub-string included in string
     :                                         # do nothing
   else 
     printf "i=""$i""$nl$curl_o$nl"
     date
     printf $nl$nl
   fi
done

date
printf "********* END ******************************"

