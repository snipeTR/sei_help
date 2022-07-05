#!/bin/bash

#Sender wallet address input check
#*******************************
read -r -p $'Please write your installed address in NODE.: ' saddress
seid query bank balances $saddress> /dev/null 2>&1
until [ $? -eq 0 ]
  do
    read -r -p $'Your ADDRESS is \e[1m\e[31mincorrect\e[0m. check and re-enter.: ' saddress
    seid query bank balances $saddress> /dev/null 2>&1
  done
echo -e "from:\e[1m\e[32m$saddress\e[0m"
#*******************************



#Receiver wallet address input check
#*******************************
read -r -p $'Enter the address to which you will bulk send..: ' raddress
seid query bank balances $saddress> /dev/null 2>&1
until [ $? -eq 0 ]
  do
    read -r -p $'Your ADDRESS is \e[1m\e[31mincorrect\e[0m. check and re-enter.: ' raddress
    seid query bank balances $saddress> /dev/null 2>&1
  done
echo -e "to:\e[1m\e[32m$raddress\e[0m"
#*******************************



#Accept the number between "wallet balance" and "minimum send coin".
#*******************************
#balance=$(seid query bank balances sei1yakd4kq7cnftpuy3psyrmep0vggax0pc909cvt -o│json | jq -r .balances[0].amount)
balance=$(seid query bank balances $saddress -o│json | jq -r .balances[0].amount)
minsendsei=2000
minbalance=100
until [ ! $minbalance -le $minsendsei ]
  do
    read -r -p $'amount of \e[1m\e[32musei\e[0m to test? (one sei=1000000\e[1m\e[32musei\e[0m \e[1m\e[31mone million\e[0m) Max=$balance: ' minbalance
    if [ ! $minbalance -le $balance ]; then echo -e "\e[1m\e[31minsufficient balance\e[0m. amount in wallet $balance\e[1m\e[32musei\e[0m"; fi
    if [ $minbalance -le $minsendsei ]; then echo -e "The value you enter cannot be less than $minsendsei."; fi
  done
#*******************************



#Wallet name input
#*******************************
echo "Please enter your Wallet name."
read -r -p $'Type "what" if you dont know your wallet name.: ' wname
if [ $wname == "what" ]; then
  wname=$(seid keys list --output json | jq -r .[0].name )
fi
echo -e "You are wallet name \e[1m\e[31m$wname\e[0m"
#*******************************
        

#The maximum number of loops is determined by dividing the address balance by the minimum shipping fee.

#sample data
#minbalance=1000000usei (1 sei)
#minsendsei=2000usei (0.002 sei)

#sample data calculation
#maxfor=$(($(($(1000000)/2000)) | bc)) ansver 500 loop

maxfor=$(($(($($minbalance)/$minsendsei)) | bc))

echo -e 'You has '$balance'usei in his wallet. You will TOTAL send the '$minbalance'usei part as 2000usei to the $raddress address, $maxfor times.'
read -r -p $'Type "what" if you dont know your wallet name.: ' answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
  read -r -p $'please write $wname password: ' unsecurepass  
else
  echo "Your answer:No"
  echo "exiting the script."
  sleep 3
exit 13
fi



for ((i=1; i <= maxfor ; i++)) do
#seid tx bank send wallet sei1vcd8d4k9fmyuwkc8cnfyhgxdva4j8ex07a6n7a 2000usei -y -note "'count:X date:Tue Jul  5 11:04:15 UTC 2022'"
#  echo 'password not secure' | seid tx bank send wallet sei1vcd8d4k9fmyuwkc8cnfyhgxdva4j8ex07a6n7a 2000usei --yes
echo '$unsecurepass' | seid tx bank send $wname $raddress ${minsendsei}usei -y -note "'$i = $(date)'"
done