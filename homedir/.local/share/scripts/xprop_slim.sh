#!/usr/bin/bash

#
# Print runnin xfree86/xwindows applications
#

list_xapps()
{
  xapps_list=$(xprop -root -notype _NET_CLIENT_LIST | awk -F "# " '{print $2}' | sed "s/, / /g")
  xapps_list=($xapps_list)      # redefine from string to list
  # echo ${xapps_list[@]}
  # echo "Numbe of x applications:   ${#xapps_list[@]}" 
  for element in "${xapps_list[@]}"
  do
      echo "$element"
  done
}

get_pid()
{
  xprop -id $1 _NET_WM_PID | grep -o '[0-9]*'
  # ps -f --pid $(xprop -id "$1" _NET_WM_PID | grep -o '[0-9]*')
}

list_info()
{
  list_xapps | while read line;
  do
    CLASS=$(xprop -id $line WM_CLASS | awk -F '=' '{print $2}' )
    NAME=$( xprop -id $line _NET_WM_NAME | awk -F '=' '{print $2}'   )
    PID=$(get_pid "$line")
    printf "\n%s | %s | %s | %s" "$PID" "$line" "$CLASS" "$NAME"
    echo ""
  done
}

list_info
echo ""


