## these packages are only needs by installation by pip.
default[:lw1_agenti][:depends_packages] = %w{
build-essential
python-pip
python-dev
python-lxml
libffi-dev
libssl-dev
libjpeg-dev
libpng-dev
uuid-dev
python-dbus
}

default[:lw1_agenti][:ajenti_packages] = %w{
ajenti
ajenti-v
ajenti-v-ftp-pureftpd
ajenti-v-mail
ajenti-v-mysql
ajenti-v-nginx
ajenti-v-nodejs
ajenti-v-php-fpm
ajenti-v-python-gunicorn
ajenti-v-ruby-puma
}

## dups
# ajenti-v-ftp-vsftpd.noarch
# ajenti-v-ruby-unicorn.noarch
