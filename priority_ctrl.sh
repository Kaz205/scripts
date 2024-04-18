declare -a high=("vivaldi" "/usr/bin/gnome-shell")
declare -a low=("ffmpeg")

function find_and_set
{
	for proc in "${high[@]}"
	do
		pid=$(ps aux | rg $proc | rg -v "rg $proc" | awk '{print $2}')
		if [[ -n "$pid" ]]; then
			#echo process exists
			renice -n -20 $pid
		fi
	done

	for proc in "${low[@]}"
	do
		pid=$(ps aux | rg $proc | rg -v "rg $proc" | awk '{print $2}')
		if [[ -n "$pid" ]]; then
			#echo process exists
			renice -n 19 $pid
		fi
	done
}

while true
do
	find_and_set
	sleep 10
done
