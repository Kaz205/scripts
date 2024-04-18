ffmpeg -r 24 -i '/home/kazuki/Downloads/PXL_20240413_094234531.mp4' \
    -r 24 -i '/home/kazuki/transcode/PXL_20240413_094234531.mp4' \
    -lavfi "[0:v]setpts=PTS-STARTPTS[reference]; \
            [1:v]setpts=PTS-STARTPTS[distorted]; \
            [distorted][reference]libvmaf=log_fmt=xml:log_path=/dev/stdout:n_threads=8" \
    -f null -
