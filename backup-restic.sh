if [[ $(hostname) == "azusa" ]]; then
    repodir="sftp:kazuki@192.168.11.229:/mnt/data/restic-repo/"
elif [[ $(hostname) == "hifumi" ]]; then
    repodir="/mnt/data/restic-repo/"
fi

/home/kazuki/restic --exclude={/dev,/media,/mnt,/proc,/run,/sys,/tmp,/var/tmp} --exclude="/home/kazuki/roms" --exclude="/home/kazuki/.cache" --exclude="/home/kazuki/.local/share/Trash" -r $repodir backup / --verbose
