info=${1:-passwd}
if [ -d /acfs01/dbaas_acfs/$ORACLE_UNQNAME/db_wallet ]
then
  dir=/acfs01/dbaas_acfs/$ORACLE_UNQNAME/db_wallet
elif [ -d /acfs01/dbaas_acfs/$ORACLE_SID/db_wallet ]
then
  dir=/acfs01/dbaas_acfs/$ORACLE_SID/db_wallet
elif [ -d /acfs01/dbaas_acfs/$(echo $ORACLE_SID|sed -e "s;.$;;")/db_wallet ]
then
  dir=/acfs01/dbaas_acfs/$(echo $ORACLE_SID|sed -e "s;.$;;")/db_wallet
else
  echo DB_WALLET Introuvable
  exit 1
fi
echo
echo "==================================="
echo
mkstore -wrl $dir -list
echo
echo "==================================="
echo
mkstore -wrl $dir -viewEntry $info
echo
echo "==================================="
echo
