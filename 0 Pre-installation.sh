################################################
#
#	sda	(GPT)
#		500		ext2		/boot
#		500		ESP, vfat	/boot/efi
#		249000		luks, LVM
#			30000	ext4		/
#			100%	ext4		/home
#
#	sdb	(GPT)
#		480000		luks, ext2	~/storage
#		20000		crypt		swap
#
################################################

apt install debootstrap cryptsetup lvm2 git
git clone https://github.com/glacion/genfstab

cryptsetup --cipher=aes-xts-plain64 --key-size 512 --hash sha512 --iter-time=10000 --use-random luksFormat /dev/sda3
cryptsetup luksOpen /dev/sda3 encrypted

pvcreate /dev/mapper/encrypted
vgcreate encrypted /dev/mapper/encrypted
lvcreate -L 30000MB -n root encrypted
lvcreate -l 100%FREE -n home encrypted

mkfs.ext2 /dev/sda1
mkfs.vfat -n EFI -I /dev/sda2
mkfs.ext4 /dev/mapper/encrypted-root
mkfs.ext4 /dev/mapper/encrypted-home

mkdir -v /installation
mount /dev/mapper/encrypted-root /installation
mkdir -v /installation/{boot,home}
mount /dev/sda1 /installation/boot
mkdir -v /installation/boot/efi
mount /dev/sda2 /installation/boot/efi
mount /dev/mapper/encrypted-home /installation/home

debootstrap --variant=minbase --arch amd64 stable /installation http://deb.debian.org/debian/

for i in /dev /dev/pts /proc /sys /run /sys/firmware/efi/efivars; do sudo mount -B $i /installation$i; done

genfstab -U /installation >> /installation/etc/fstab
	# /dev/sdb2
	/dev/mapper/encrypted-swap 			none		swap 		sw		0 0

cp -vrf configurations/* /installation/etc

chroot /installation /bin/bash
