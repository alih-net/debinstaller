sudo apt install ufw fail2ban openssh-client openssh-server apache2 php php-mysql mariadb-client mariadb-server network-manager-openvpn network-manager-openvpn-gnome curl wget aria2 lynx irssi remmina lm-sensors hdparm testdisk cryptsetup dosfstools usbutils ntfs-3g smartmontools gparted cpulimit zsh tmux vim geany zip unzip rar unrar p7zip htop jcal rename tree lsof progress pydf exa lolcat tldr cowsay screenfetch asciinema rsync whois mlocate vlc mpv obs-studio kodi ffmpeg imagemagick eyed3 libreoffice octave gimp inkscape blender goldendict snapd virt-manager adb android-tools-adb git sqlitebrowser zeal composer nodejs npm make gcc g++ autoconf default-jdk default-jre python3-pip python3-virtualenv python-pip python-virtualenv arduino audacity openshot chromium cups cups-browsed printer-driver-splix tor obfs4proxy obfsproxy privoxy resolvconf vnstat hping3 httpie httrack macchanger netcat net-tools nmap tcpdump traceroute rkhunter wireshark texlive-full gummi
#gns3-gui dynamips opencl tidy gaupol poedit calibre ecryptfs-utils

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
vim /etc/apt/sources.list.d/google-chrome.list

sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb https://download.docker.com/linux/debian buster stable"
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io

wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
sudo add-apt-repository "deb http://deb.anydesk.com/ all main"
sudo apt update
sudo apt install anydesk

sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
hash -r

sudo snap install --classic code
sudo snap install postman

chsh maddak -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo ufw enable
sudo ufw allow 80
sudo ufw allow 22

gnome extensions
	argos@pew.worldwidemann.com
	caffeine@patapon.info
	clipboard-indicator@tudmotu.com
	dash-to-dock@micxgx.gmail.com
	disconnect-wifi@kgshank.net
	gsconnect@andyholmes.github.io
	openweather-extension@jenslody.de
	PersianCalendar@oxygenws.com
	pomodoro@arun.codito.in
	refresh-wifi@kgshank.net
	update-extensions@franglais125.gmail.com

dd if=/dev/urandom of=KEYPATH_KEY_NAME bs=1KB count=4
sudo cryptsetup --cipher=aes-xts-plain64 --key-size 512 --hash sha512 --iter-time=10000 --use-random --key-file KEYPATH_KEY_NAME luksFormat /dev/sdb1
sudo cryptsetup luksOpen /dev/sdb1 storage --key-file KEYPATH_KEY_NAME
sudo mkfs.ext2 /dev/mapper/storage
sudo mount /dev/mapper/storage ~/storage
sudo chown maddak:maddak ~/storage/

firefox
	about:config
		browser.ctrlTab.recentlyUsedOrder;false

	cutomize
		hide title bar

	about:preferences
		Show search suggestions in address bar results
		disable topsites
		disabble highlights
		Use hardware acceleration when available: 8
