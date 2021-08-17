# Fix Bluetooth Connectivity on Ubuntu 21 (Intel)
To help you fix issues with bluetooth on Ubuntu after intel's Feb-21 firmware update

## How to?
```
source <(curl -s https://raw.githubusercontent.com/ByteBaker/ubuntu21-btfix/main/bluetooth_fix.sh)
```



## What it does?
Nothing fancy, just automating the boring process of copying Intel's firmware files for Linux in the right place.

## A little background
A past firmware update for Linux by Intel messed up its bluetooth connectivity. Though they released a patch soon enough, and other distros have included it (e.g. Fedora), Ubuntu is yet to do it. [Refer to this AskUbuntu post](https://askubuntu.com/questions/1342148/bluetooth-audio-problems-on-21-04)

One could manually fix this issue by [downloading the firmware](https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git) manually and patching it, but it was a lot of pain just to fix bluetooth. Note that the whole thing was **>700 MB**.

After repackaging only the files for bluetooth (also within this repo), the required download is just 11 MB.
