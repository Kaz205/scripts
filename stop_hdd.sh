declare -A sleep_time=()

function spin_down_disks()
{
	# Sleep if 10 minutes has passed since last idling
	if [ $(($(date +%s) - sleep_time[$1])) -gt 600 ]; then
		echo "Spinning down $1"
		hdparm -y /dev/$1
		sleep_time[$1]=$(date +%s)
	fi
}


while true
do
	diskstats=$(cat /proc/diskstats)

	if [ "$diskstats" == "$diskstats_old" ]; then
		comm=$(comm <(echo "$diskstats" ) <(echo "$diskstats_old"))
		disk_to_sleep=$(echo $comm | grep -o 'sd[a-z]')

		for disk in ${disk_to_sleep[@]}; do
			spin_down_disks $disk
		done
	fi

	diskstats_old=$diskstats

	sleep 60
done
