TAG="LA.UM.9.14.r1-21600-LAHAINA.QSSI14.0"
MERGE=0

if [ $MERGE != 1 ]
then
git subtree add --prefix=techpack/audio https://git.codelinaro.org/clo/la/platform/vendor/opensource/audio-kernel $TAG
git subtree add --prefix=techpack/camera https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel $TAG
git subtree add --prefix=techpack/dataipa https://git.codelinaro.org/clo/la/platform/vendor/opensource/dataipa $TAG
git subtree add --prefix=techpack/datarmnet https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/datarmnet $TAG
#git subtree add --prefix=techpack/datarmnet-ext https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/datarmnet-ext $TAG
git subtree add --prefix=techpack/display https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers $TAG
git subtree add --prefix=techpack/video https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver $TAG
git subtree add --prefix=drivers/staging/fw-api https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/fw-api $TAG
git subtree add --prefix=drivers/staging/qca-wifi-host-cmn https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn $TAG
git subtree add --prefix=drivers/staging/qcacld-3.0 https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qcacld-3.0 $TAG
git subtree add --prefix=arch/arm64/boot/dts/vendor https://github.com/Kaz205/renoir devicetree-rebase
git subtree add --prefix=arch/arm64/boot/dts/vendor https://github.com/MotorolaMobilityLLC/kernel-devicetree f79fd4b12e59ada5840c29ff0b7d477e766273b6
git subtree add --prefix=arch/arm64/boot/dts/vendor/qcom/camera https://github.com/MotorolaMobilityLLC/kernel-camera-devicetree f1917cf225900921b9ce93e4f8f6edd0bf66d721
git subtree add --prefix=arch/arm64/boot/dts/vendor/qcom/display https://github.com/MotorolaMobilityLLC/kernel-display-devicetree e97468a89f4603787fe161195be14174b425b5f9
else
git subtree pull --prefix=techpack/audio https://git.codelinaro.org/clo/la/platform/vendor/opensource/audio-kernel $TAG
git subtree pull --prefix=techpack/camera https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel $TAG
git subtree pull --prefix=techpack/dataipa https://git.codelinaro.org/clo/la/platform/vendor/opensource/dataipa $TAG
git subtree pull --prefix=techpack/datarmnet https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/datarmnet $TAG
#git subtree pull --prefix=techpack/datarmnet-ext https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/datarmnet-ext $TAG
git subtree pull --prefix=techpack/display https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers $TAG
git subtree pull --prefix=techpack/video https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver $TAG
git subtree pull --prefix=drivers/staging/fw-api https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/fw-api $TAG
git subtree pull --prefix=drivers/staging/qca-wifi-host-cmn https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn $TAG
git subtree pull --prefix=drivers/staging/qcacld-3.0 https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qcacld-3.0 $TAG
fi
