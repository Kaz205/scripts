#!/bin/sh

# Usecase:
# items[n]="'irq_name' 'CPU(s) affinity list'"

items[0]="23510c000.spi 1"
items[1]="206408000.mbox-recv 3"
items[2]="206408000.mbox-send 2"
items[3]="231c08000.mbox-recv 1"
items[4]="231c08000.mbox-send 0"
items[5]="nvme-apple 3"
items[6]="brcmf_pcie_intr 1"

# Don't allow non-root users to execute this
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

for item in "${items[@]}"
do
	# Get last text
	AFFINITY_NUM=$(echo "$item" | awk '{print $NF}')
	# Get $item and remove the last text (AFFINITY_NUM) and remove all whitespace (xargs)
	IRQ_NAME=$(echo "$item" | sed 's/\(.*\)'"$AFFINITY_NUM"'/\1/' | xargs)
	# Get text until first occurance of colon and remove all whitespace (xargs)
	IRQ_NUM=$(cat /proc/interrupts | grep '$IRQ_NAME' | cut -d: -f1 | xargs)
	echo $AFFINITY_NUM > /proc/irq/$IRQ_NUM/smp_affinity_list
	if [ $? -eq 0 ]; then
		echo "Affined $IRQ_NAME to CPU$AFFINITY_NUM"
	else
		echo "Failed to affine $IRQ_NAME to CPU$AFFINITY_NUM"
	fi
done

