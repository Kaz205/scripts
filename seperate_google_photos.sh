mkdir -p DCIM/Camera
mkdir Screenshots
mkdir Screenrecord
rm -rf *.json

for dir in Photos*/ ; do
	echo $dir
	rm -rf "$dir"*.json
	mv "$dir"Screenshot* Screenshots/
	mv "$dir"screen* Screenrecord/
	mv "$dir"Screenrecorder* Screenrecord/
	mv "$dir"* DCIM/Camera/
done
