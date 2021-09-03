#! @bash@/bin/sh -e

shopt -s nullglob

export PATH=/empty
for i in @path@; do PATH=$PATH:$i/bin; done

BASE_BOOT="/boot";

KERNEL_ADDR="0x14000000"
INITRD_ADDR="0x15000000"
DTB_ADDR="0x11800000"

KERNEL_PARAMS=$(cat $1/kernel-params)

cat > $BASE_BOOT"/boot.ini.input" <<EOF
setenv condev "console=ttyS0,115200n8"
setenv bootargs "systemConfig=$1 init=$1/init $KERNEL_PARAMS"
setenv boot_start bootm $KERNEL_ADDR $INITRD_ADDR $DTB_ADDR

EOF

craft_boot_device() {
  local device="$1"

  cat >> $BASE_BOOT"/boot.ini.input" <<EOF
if fatload $device $KERNEL_ADDR /uImage; then
  if fatload $device $INITRD_ADDR /uInitrd; then
    if fatload $device $DTB_ADDR /meson8b-odroidc1.dtb; then
      run boot_start
    fi
  fi
fi
EOF
}

craft_boot_device "usb 0"
craft_boot_device "mmc 0"
craft_boot_device "mmc 1:4"

mkimage -A arm -O linux -T kernel -C none -a 0x00208000 -e 0x00208000 -n "Linux kernel" -d $1/kernel $BASE_BOOT/uImage
mkimage -A arm -O linux -T ramdisk -C none -a 0 -e 0 -n uInitrd -d $1/initrd $BASE_BOOT/uInitrd

mkimage -A arm -O linux -T script -C none -d $BASE_BOOT"/boot.ini.input" $BASE_BOOT"/boot.ini"

cp $1/dtbs/meson8b-odroidc1.dtb $BASE_BOOT"/meson8b-odroidc1.dtb"
