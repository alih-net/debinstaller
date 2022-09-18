# debinstaller
Debian installation via debootstrap + GPT, LUKS, LVM, etc.

# TODOs
- [ ] fix reboot loop (system reset/reboot) before grub loading on EFI
- [ ] refactor: 2 Post-installation

## EFI bootloader
apt install linux-image-amd64 linux-headers-amd64 firmware-linux firmware-linux-free firmware-linux-nonfree firmware-realtek firmware-iwlwifi grub-efi grub-efi-amd64 cryptsetup lvm2 initramfs-tools locales sudo dialog tasksel

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=debian --recheck --no-nvram --removable #/dev/sda
update-grub
