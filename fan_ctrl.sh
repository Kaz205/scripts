function increase_rpm ()
{
	# Enable manual fan control
	echo 1 | tee /sys/class/hwmon/hwmon$1/pwm*_enable
	# Increase fan speed
	echo 120 | tee /sys/class/hwmon/hwmon$1/pwm1
	echo 230 | tee /sys/class/hwmon/hwmon$1/pwm3
	echo 230 | tee /sys/class/hwmon/hwmon$1/pwm4
	echo 230 | tee /sys/class/hwmon/hwmon$1/pwm5
}

function decrease_rpm ()
{
	# Disable manual fan control
	echo 99 | tee /sys/class/hwmon/hwmon$1/pwm*_enable
}

arc_hwmon=$(for d in /sys/class/hwmon/*; do echo "$d: $(cat "$d/name")"; done | grep i915)
arc_hwmon_num=$(echo $arc_hwmon | awk -F'[^0-9]+' '{ print $2 }')
mobo_hwmon=$(for d in /sys/class/hwmon/*; do echo "$d: $(cat "$d/name")"; done | grep nct6687)
mobo_hwmon_num=$(echo $mobo_hwmon | awk -F'[^0-9]+' '{ print $2 }')

while true;
do
	# Check Intel GPU voltage
	volt=$(cat /sys/class/hwmon/hwmon$arc_hwmon_num/in0_input)
	if [ $volt -ge 800 ]
	then
		increase_rpm $mobo_hwmon_num
	else
		decrease_rpm $mobo_hwmon_num
	fi

	sleep 10
done
