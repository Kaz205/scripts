declare -a list=("vivaldi" "/usr/bin/gnome-shell")

function find_and_set
{
	for proc in "${list[@]}"
	do
		pid=$(ps aux | rg $proc | rg -v "rg $proc" | awk '{print $2}')
		if [[ -n "$pid" ]]; then
			#echo process exists
			renice -n -20 $pid
		fi
	done
}

while true
do
	find_and_set
	sleep 10
done
