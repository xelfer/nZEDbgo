#!/bin/bash

echo "You'll be prompted to create a password for your MariaDB install. Remember this password for later during the install as you'll have to enter it again" 

read -t 5 -p 'Hit ENTER or wait 5 seconds to continue'; echo

echo "Installing packages via apt"
apt-get update -y ; apt-get upgrade -y ; apt-get dist-upgrade -y ; apt-get install -y screen software-properties-common python-software-properties ; add-apt-repository -y ppa:ondrej/php5 ; apt-get update ; apt-get install -y php5 php5-dev php5-json php-pear php5-gd php5-mysqlnd php5-curl ; update-rc.d apparmor disable ; sudo apt-get install -y mariadb-server mariadb-client libmysqlclient-dev apache2 lame libav-tools git

echo "Installing custom packages - if the URL's dont work, edit the script"
wget http://www.rarlab.com/rar/rarlinux-x64-5.1.0.tar.gz; tar zxf rarlinux*.tar.gz ; mv rar/unrar /usr/bin/unrar; chmod 755 /usr/bin/unrar ; rm -rf rar rarlinux*.tar.gz
git clone https://github.com/kevinlekiller/simple_php_yenc_decode ; cd simple_php_yenc_decode ; sh ubuntu.sh ; cd .. ; rm -rf simple_php_yenc_decode

## If the following URL's are gone you can use this website to find the correct links: 
## http://mediaarea.net/en/MediaInfo/Download/Ubuntu 
wget http://mediaarea.net/download/binary/mediainfo/0.7.69/mediainfo_0.7.69-1_amd64.Debian_7.0.deb ; wget http://mediaarea.net/download/binary/libmediainfo0/0.7.69/libmediainfo0_0.7.69-1_amd64.xUbuntu_14.04.deb ; wget http://mediaarea.net/download/binary/libzen0/0.4.29/libzen0_0.4.29-1_amd64.xUbuntu_14.04.deb ; dpkg -i *.deb ; rm -rf *.deb

echo "Configuring..."
echo "group_concat_max_len = 8192" > /etc/mysql/conf.d/nZEDb.conf; service mysql restart

read pw -p  "Enter the MariaDB (MySQL) password you configured earlier: "
mysql -u root -p$pw -Bse "GRANT ALL ON *.* TO 'nzedb'@'localhost';flush privileges;"

cat >>/etc/apache2/sites-available/nZEDb.conf << EOF
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName localhost 
    DocumentRoot "/var/www/nZEDb/www"
    LogLevel warn
    ServerSignature Off
    ErrorLog /var/log/apache2/error.log
    <Directory "/var/www/nZEDb/www">
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    Alias /covers /var/www/nZEDb/resources/covers
</VirtualHost>
EOF


a2dissite 000-default ; a2ensite nZEDb.conf ; a2enmod rewrite   

echo "Changing some apache and php settings.."
vim /etc/apache2/apache2.conf -c :165,167s/None/All/g -c :wq\! 
vim /etc/php5/cli/php.ini -c :%s/max_execution_time\ \=\ 30/max_execution_time\ \=\ 120/g -c :wq\!
vim /etc/php5/cli/php.ini -c :%s/memory_limit\ \=\ -1/memory_limit\ \=\ 1024M/g -c :wq\!
vim /etc/php5/apache2/php.ini -c :%s/max_execution_time\ \=\ 30/max_execution_time\ \=\ 120/g -c :wq\!
vim /etc/php5/apache2/php.ini -c :%s/memory_limit\ \=\ 128M/memory_limit\ \=\ 1024M/g -c :wq\!

echo "Installing nZEDb from git"
cd /var/www/ ; git clone https://github.com/nZEDb/nZEDb.git ; chmod -R 777 nZEDb ; cd

echo "Restarting apache"
service apache2 restart

echo "Done! Visit your site on http://ip/ to complete the install"
