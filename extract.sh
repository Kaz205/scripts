cd ~/payload/alioth_V14.0.8.0/ && ../mount.sh
cd ~/payload/pipa_V14.0.9.0/ && ../mount.sh
cd ~/statix/device/xiaomi/pipa
./extract-files.sh ~/payload/alioth_V14.0.8.0/system --only-common
./extract-files.sh ~/payload/pipa_V14.0.9.0/system --only-target
cd ~/payload/alioth_V14.0.8.0/ && sudo umount -R system 
cd ~/payload/pipa_V14.0.9.0/ && sudo umount -R system 
