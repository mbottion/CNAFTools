usage() {
 echo "Usage :
 $SCRIPT [-?] [-s start-date YYYY-MM-DD HH:MI] [-n hours]
   -s startDate : Start date of the analysis (Default 18:00 today or yesterday)
   -n Hours     : Number of hours to analyze (default 14)
   -?           : Help
   scriptParams : Parameters of the script (try HELP)

   Send files o the exchange bucket
  "
  exit
}
die()
{
  [ "$1" != "" ] && echo -e "$SCRIPT : Error \n$*"
  exit 1
}

SCRIPT=OPAMapsPerHour.sh

if [ $(date +%H) -gt 18 ]
then
  START_DATE="$(date "+%Y-%m-%d") 1800"
else
  START_DATE="$(date -d yesterday "+%Y-%m-%d") 1800"
fi
NB_HOURS=14

while getopts ":s:n:h?" opt
do
  case $opt in
    s) START_DATE=$OPTARG ;;
    n) NB_HOURS=$OPTARG   ;;
    ?|h) shift ; usage ;;
  esac
done

i=0
while [ $i -lt $NB_HOURS ]
do
  start=$(date -d "$START_DATE + $i hours" "+%d/%m/%Y %H:%M:%S")
  end=$(date -d "$START_DATE + $(($i + 1)) hours" "+%d/%m/%Y %H:%M:%S")
  echo "==================================================================="
  echo " From : $start To : $end ($i)"
  echo "===+===+==========================================================="
if true ; then
  $HOME/mbo/runScript.sh -i -s heatMapOPAGlobalTime.sql "$start" "$end"      | sed -e "s;^;   |   | ;"
  echo "   |   +==========================================================="
  echo "   |"
  $HOME/mbo/runScript.sh -i -s heatMapOPAProcessingTime.sql "$start" "$end"  | sed -e "s;^;   |   | ;"
  echo "   |   +==========================================================="
  echo "   |"
  $HOME/mbo/runScript.sh -i -s heatMapOPASizeIn.sql "$start" "$end"          | sed -e "s;^;   |   | ;"
  echo "   |   +==========================================================="
  echo
fi
  i=$(($i + 1))
done 
