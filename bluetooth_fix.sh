sudo -v

if [ $? -eq 1 ]
then
	echo -e "\nSuperuser is required to run the script."
	read -rsn1 "Press any key to exit..."
	exit 1
fi


echo -e "\nHi Folks! Love from ByteBaker!\n"

echo "This script will download bluetooth firmware files sourced from Intel's latest firmware update. The original files can be found at:"
echo "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/snapshot/linux-firmware-20210716.tar.gz"
echo -e "\nHowever, since the whole firmware is large in size, only bluetooth related files are repackaged."
echo "Press any key to continue (or Ctrl+C to exit)..."
read -p ""

FW_URL="https://raw.githubusercontent.com/ByteBaker/ubuntu21-btfix/main/intel-bt-fw-20210716.tar.gz?raw=true"
OUTFILE="firmware.tar.gz"
EXTR_DIR="ibt"

TMP_PATH=$(mktemp -d -t)
OUT_PATH="$TMP_PATH/$OUTFILE"

# Downloads the file
wget $FW_URL -O $OUT_PATH

# Extracts it
tar xfz $OUT_PATH -C $TMP_PATH

sudo cp -rf $TMP_PATH/$EXTR_DIR/ibt-* /lib/firmware/intel/

if [ $? -eq 0 ]
then
	echo -e "\nPatch successful"
	
	# cleanup
	sudo rm -rf $TMP_PATH

	echo -e "\nYour computer will reboot now. Save any open work.\nPress any key to reboot..."
	read -rsn1 ""
	sudo reboot
else
	echo -e "Sorry! But it didn't work out! Maybe try StackOverflow\n"
	exit 1
fi

