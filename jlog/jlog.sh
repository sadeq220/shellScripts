#!/bin/bash

pids=($(pgrep -f .jar$))
declare -i i=0
if [[ ${#pids[@]} -ne 0 ]]; then
for pid in "${pids[@]}";do
printf '%d---%s\n' "$i" "$(ps -o cmd= "$pid" |grep -oE "/[a-zA-Z0-9.-]*\.jar")"
((i = i + 1))
done
read -r -p "inter your choice(type integer):" choice
PID=${pids["$choice"]}
less +G /proc/"${PID}"/fd/1
fi