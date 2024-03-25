declare -a list=("gcc" "clang" "lld" "rustc")

function find_and_set
{
	let proc_exists=false

	for proc in "${list[@]}"
	do
		#echo Searching for $proc
		if ps aux | rg $proc | rg -v "rg $proc"; then
			#echo process exists
			proc_exists=true
			break
		fi
	done

	if [ "$proc_exists" = "true" ]; then
		echo 1 > /sys/devices/system/cpu/amd_pstate/cpb_boost
	else
		echo 0 > /sys/devices/system/cpu/amd_pstate/cpb_boost
	fi
}

while true
do
	find_and_set
	sleep 10
done
