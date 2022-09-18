apt update

apt install linux-image-amd64 linux-headers-amd64 firmware-linux firmware-linux-free firmware-linux-nonfree firmware-realtek firmware-iwlwifi grub2 cryptsetup lvm2 initramfs-tools locales sudo dialog tasksel

update-initramfs -k all -u -v

dpkg-reconfigure tzdata
dpkg-reconfigure locales

useradd -m -G sudo -s /bin/bash alih
passwd alih
passwd

tasksel

grub-install --target=i386-pc --debug --force --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
