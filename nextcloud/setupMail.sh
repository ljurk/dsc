#!/bin/sh
echo "variable [default]"
read -p "host[mail.303v.cf]: " host
host=${host:-mail.303v.cf}
read -p "port[25]: " port
port=${port:-25}
read -p "domain[303v.cf]: " domain
domain=${domain:-303v.cf}
read -p "user[nextcloud]: " user
user=${user:-nextcloud}
read -p "password[esisment13]: " password
password=${password:-esisment13}

echo "\nset netcloud config:"

cat <<EOF | docker exec -u 33 --interactive nextcloud_app_1 sh

./occ config:system:set mail_smtpmode --value='smtp';
./occ config:system:set mail_sendmailmode --value='smtp';
./occ config:system:set mail_smtpauthtype --value='LOGIN';
./occ config:system:set mail_smtpauth --value=1;
./occ config:system:set mail_smtphost --value=$host;
./occ config:system:set mail_smtpport --value=$port;
./occ config:system:set mail_domain --value=$domain;
./occ config:system:set mail_smtpname --value=$user;
./occ config:system:set mail_smtppassword --value=$password;
EOF
