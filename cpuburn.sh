#!/bin/bash

trap 'echo auto > /sys/class/power_supply/macsmc-battery/charge_behaviour && exit 0' INT

wait_until_discharged_capacity () {
    echo "discharging"
    stress-ng --cpu 8 --vm 100 &
    while [ $(cat /sys/class/power_supply/macsmc-battery/capacity) -gt $1 ]
    do
        sleep 100
    done
}

wait_until_charged_capacity () {
    echo "charging"
    pkill -P $$
    while [ $(cat /sys/class/power_supply/macsmc-battery/capacity) -lt $1 ]
    do
        sleep 100
    done
}

while true
do
    echo force-discharge > /sys/class/power_supply/macsmc-battery/charge_behaviour
    wait_until_discharged_capacity 7

    echo auto > /sys/class/power_supply/macsmc-battery/charge_behaviour
    wait_until_charged_capacity 90
done
