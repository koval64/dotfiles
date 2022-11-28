#!/usr/bin/bash

get_hex_xids()
{
xprop -root -notype _NET_CLIENT_LIST | \
     awk 'BEGIN{printf "ibase=16"}\
     {gsub(/,/," ");for(i=1;i<=NF;i++) \
     if ($i~/0x/) printf ";%s",substr(toupper($i),3)   }'  
}

convert_hex2dec()
{
  HEXIDS=$(get_hex_xids)
  echo $HEXIDS | bc
}

print_header()
{
  printf "%s\t%s\t%s\n" "XID" "TYPE" "TITLE"
  printf "%s\n" "--------------------------------"
}

list_info()
{
  convert_hex2dec | while read line;
  do
  # TYPE=$( xprop -id $line _NET_WM_WINDOW_TYPE | awk -F '=' '{print $2}'   )
  # if [ $TYPE != "_NET_WM_WINDOW_TYPE_NORMAL"   ]; then
  #    continue
  # fi
  CLASS=$(xprop -id $line WM_CLASS | awk -F '=' '{print $2}' )
  NAME=$( xprop -id $line _NET_WM_NAME | awk -F '=' '{print $2}'   )
  printf "\n%s|%s|%s\n" "$line" "$CLASS" "$NAME"
  done
}

list_short_info()
{
  convert_hex2dec | while read line;
  do
  CLASS=$(xprop -id $line WM_CLASS | awk -F '=' '{print $2}' )
  # CLASS=$(xprop -id $line WM_CLASS | awk -F '= "' '{print $2}' | awk -F '", "' '{print $1}' )
  # printf "%s\n" "$CLASS"
  NAME=$( xprop -id $line _NET_WM_NAME | awk -F '=' '{print $2}'   )
  printf "\n%s|%s|%s\n" "$line" "$CLASS" "$NAME"
  done
}

# print_header
# list_info

echo -e "$ X apps running: "
list_short_info




