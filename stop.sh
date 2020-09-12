# This file is to kill the code server process

source utils.sh

# If a code server pid exists kill it
codeServerPid=$(get-port-pid 8000)
if [ -n "$codeServerPid" ]; then
  printf "killing code server pid: $codeServerPid \n\n"
  sudo kill $codeServerPid
else
  printf "No code server pid found!\n\n"
fi