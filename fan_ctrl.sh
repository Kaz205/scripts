function increase_rpm ()
{
	# Enable manual fan control
	echo 1 | tee /sys/class/hwmon/hwmon6/pwm*_enable
	# Increase fan speed
	echo 120 | tee /sys/class/hwmon/hwmon6/pwm1
	echo 230 | tee /sys/class/hwmon/hwmon6/pwm3
	echo 230 | tee /sys/class/hwmon/hwmon6/pwm4
	echo 230 | tee /sys/class/hwmon/hwmon6/pwm5
}

function decrease_rpm ()
{
	# Disable manual fan control
	echo 99 | tee /sys/class/hwmon/hwmon6/pwm*_enable
}

while true;
do
	# Check Intel GPU voltage
	volt=$(cat /sys/class/hwmon/hwmon2/in0_input)
	if [ $volt -ge 600 ]
	then
		increase_rpm
	else
		decrease_rpm
	fi

	sleep 10
done
