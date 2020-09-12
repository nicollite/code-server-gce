# This file is used to start or restart code server on background
source utils.sh

codeServerPidFile="code-server-pid.txt"

# Kill old code-server
bash stop.sh

# Remove code server pid file if it's exists
if [ -f $codeServerPidFile ]; then rm -f $codeServerPidFile; fi

# Start a new code server
printf "starting new code server on port 8000!\n\n"
sudo -E nohup code-server --config ./config.yaml > "code-server.log" 2>&1 &

# Print the used configurations
codeServerConfigPath=$(ls "`pwd`/config.yaml")
printf "code-server config path `ls $codeServerConfigPath`\n$(cat $codeServerConfigPath) \n\n"

# Sleep for 2 seconds and get the new pid for the code server
sleep 2s
newCodeServerPid=$(get-port-pid 8000)
# Set the pid in the code-server-pid.txt file
echo $newCodeServerPid > $codeServerPidFile

codeServerPortMsg="code server running on port: $newCodeServerPid"
echo $codeServerPortMsg >> code-server.log
echo $codeServerPortMsg

# Get the VM external ip address
vmIp=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip)
echo "You can access the vscode terminal in http://$vmIp"