if [ "$1" == "" ] then;
	echo "Select a tag"
	exit 1
fi

git fetch https://android.googlesource.com/device/google/shusky/ $1
cd /home/kazuki/device_google_shusky
git rebase FETCH_HEAD
git push -f

git fetch https://android.googlesource.com/device/google/zuma/ $1
cd /home/kazuki/device_google_zuma
git rebase FETCH_HEAD
git push -f

git fetch https://android.googlesource.com/platform/frameworks/base/ $1
cd /home/kazuki/platform_frameworks_base_hentai
git rebase FETCH_HEAD
git push -f

git fetch https://android.googlesource.com/platform/packages/apps/Settings/ $1
cd /home/kazuki/platform_packages_apps_Settings_hentai
git rebase FETCH_HEAD
git push -f

git fetch https://github.com/hentaiOS/platform_manifest $1
cd /home/kazuki/platform_manifest_hentai
git rebase FETCH_HEAD
git push -f

git fetch https://github.com/hentaiOS/platform_system_core $1
cd /home/kazuki/system_core_hentai
git rebase FETCH_HEAD
git push -f

git fetch https://android.googlesource.com/platform/bionic/ $1
cd /home/kazuki/bionic_hentai
git rebase FETCH_HEAD
git push -f

git fetch https://android.googlesource.com/platform/hardware/google/graphics/common/ $1
cd /home/kazuki/hardware_google_graphics_common
git rebase FETCH_HEAD
git push -f
