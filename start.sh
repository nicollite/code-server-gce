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
codeServerPid=$(get-port-pid 8000)
if [ -n "$codeServerPid" ]; then
  printf "killing old code server pid: $codeServerPid \n\n"
  sudo kill $codeServerPid
else
  printf "no code server pid found!\n\n"
fi

# Start a new code server
printf "starting new code server on port 8000!\n\n"
sudo -E nohup code-server --config ./config.yaml > "code-server.log" 2>&1 &

# Print the used configurations
codeServerConfigPath=$(ls "`pwd`/config.yaml")
printf "code-server config path `ls $codeServerConfigPath`\n$(cat $codeServerConfigPath) \n\n"

# Sleep for 2 seconds and get the new 

# pid for the code server
sleep 2s
newCodeServerPid=$(get-port-pid 8000)
codeServerPortMsg="code server running on port: $newCodeServerPid"
echo $codeServerPortMsg >> code-server.log
echo $codeServerPortMsg

# Get the VM external ip address
vmIp=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip)
echo "You can access the vscode terminal in http://$vmIp"