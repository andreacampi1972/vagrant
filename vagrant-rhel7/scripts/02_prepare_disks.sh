function prepare_disk {
  MOUNT_POINT=$1
  DISK_DEVICE=$2
  if  [ ! -z "$DISK_DEVICE" ]
  then
    echo "******************************************************************************"
    echo "Prepare ${MOUNT_POINT} disk." `date`
    echo "******************************************************************************"
    # New partition for the whole disk.
    echo -e "n\np\n1\n\n\nw" | fdisk ${DISK_DEVICE}

    # Add file system.
    mkfs.xfs -f ${DISK_DEVICE}1

    # Mount it.
    UUID=`blkid -o export ${DISK_DEVICE}1 | grep UUID | grep -v PARTUUID`
    mkdir ${MOUNT_POINT}
    echo "${UUID}  ${MOUNT_POINT}    xfs    defaults 1 2" >> /etc/fstab
    mount ${MOUNT_POINT}
  fi
}

# Load Variables
. /etc/profile.d/vagrantstartup.sh


prepare_disk  ${var_disk1_mountpoint} ${var_disk1_device}

prepare_disk  ${var_disk2_mountpoint} ${var_disk2_device}

prepare_disk  ${var_disk3_mountpoint} ${var_disk3_device}

prepare_disk  ${var_disk4_mountpoint} ${var_disk4_device}
findmnt --types xfs
