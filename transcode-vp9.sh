function_transcode () {
	filename=$(basename $1)
	fps=$(ffprobe -v error -select_streams v -show_entries stream=r_frame_rate -of default=noprint_wrappers=1:nokey=1 $1)
	seek_time=$(echo "$fps * 10" | bc)

	ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -noautorotate -i $1 -map_metadata 0 -movflags faststart+use_metadata_tags -c:v libvpx-vp9 -b:v 0 -crf 30 -cpu-used 0 -fps_mode vfr -arnr-maxframes 7 -arnr-strength 4 -auto-alt-ref 1 -tile-columns 0 -tile-rows 0 -enable-tpl 1 -aq-mode 0 -lag-in-frames 25 -deadline good -row-mt 1 -threads 16 -pass 1 -an -f null /dev/null && \
	ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -noautorotate -i $1 -map_metadata 0 -movflags faststart+use_metadata_tags -c:v libvpx-vp9 -b:v 0 -crf 30 -cpu-used 0 -fps_mode vfr -arnr-maxframes 7 -arnr-strength 4 -auto-alt-ref 1 -tile-columns 0 -tile-rows 0 -enable-tpl 1 -aq-mode 0 -lag-in-frames 25 -deadline good -row-mt 1 -threads 16 -pass 2 -c:a libopus -ar 48000 -ab 192k -f mp4 /home/kazuki/transcode/$filename
}

for file in $1; do function_transcode $file; done

trap "killall background" SIGHUP SIGINT SIGTERM EXIT
