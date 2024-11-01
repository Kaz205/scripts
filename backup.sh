sudo tar --use-compress-program=lz4 -cvf /mnt/data/backup-$(date +%F-%H%M).tar.lz4 \
    --exclude=/dev \
    --exclude=/mnt \
    --exclude=/proc \
    --exclude=/sys \
    --exclude=/tmp \
    --exclude=/media \
    --exclude=/lost+found \
    --exclude=/run \
    --exclude=/home/kazuki/roms \
    /
