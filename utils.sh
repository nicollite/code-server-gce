# File with shell util functions

# Get a pid from a process with a running port
function get-port-pid(){
  port="$1"
  processName="$2"
  if [ -z "$1" ]; then exit ;fi
  echo $(get-pid $(sudo lsof -n -i:$port -P | grep -E "$processName(.)*LISTEN\)"))
}

# Get teh pid from the second argument of the lsof command
function get-pid(){
  echo $2
}