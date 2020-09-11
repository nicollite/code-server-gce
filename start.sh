# This file is used to start code server on backgroud

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

# If a code server pid exists kill it
codeServerPid=$(get-port-pid $CODE_SERVER_PORT)
if [ -n "$codeServerPid" ]; then
  printf "killing old code server pid: $codeServerPid \n\n"
  sudo kill $codeServerPid
else
  printf "no code server pid found!\n\n"
fi

# Start a new code server
printf "starting new code server on port $CODE_SERVER_PORT!\n\n"
sudo -E nohup code-server --config ~/code-server/config.yaml > "code-server.log" 2>&1 &

# Print the used configurations
printf "code-server config path ~/code-server/config.yaml\n$(cat ~/code-server/config.yaml) \n\n"

# Sleep for 2 seconds and get the new 

pid for the code server
sleep 2s
newCodeServerPid=$(get-port-pid $CODE_SERVER_PORT)
msg="code server running on port: $newCodeServerPid"
echo $msg >> code-server.log
echo $msg
