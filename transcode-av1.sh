function_transcode () {
	filename=$(basename $1)
	creation_time=2020-09-14T21:42:51.000000Z
	fps=$(ffprobe -v error -select_streams v -show_entries stream=r_frame_rate -of default=noprint_wrappers=1:nokey=1 $1)
	seek_time=$(echo "$fps * 0.3" | bc)

	ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i $1 -metadata creation_time=$creation_time -movflags faststart -c:v libaom-av1 -b:v 0 -cpu-used 4 -crf 30 -fps_mode vfr -arnr-max-frames 3 -arnr-strength 1 -aq-mode 0 -lag-in-frames 48 -aom-params sb-size=64:enable-qm=1:quant-b-adapt=1 -auto-alt-ref 1 -keyint_min 12 -g $seek_time -threads 16 -row-mt 1 -pass 1 -an -f null /dev/null && \
	ffmpeg -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i $1 -metadata creation_time=$creation_time -movflags faststart -c:v libaom-av1 -b:v 0 -cpu-used 4 -crf 30 -fps_mode vfr -arnr-max-frames 3 -arnr-strength 1 -aq-mode 0 -lag-in-frames 48 -aom-params sb-size=64:enable-qm=1:quant-b-adapt=1 -auto-alt-ref 1 -keyint_min 12 -g $seek_time -threads 16 -row-mt 1 -pass 2 -c:a libopus -ar 48000 -ab 192k -f mp4 /home/kazuki/transcode/av1$filename
}

for file in $1; do function_transcode $file; done

trap "killall background" SIGHUP SIGINT SIGTERM EXIT
