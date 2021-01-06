#!/bin/sh
echo "variable [default]"
read -p "host[mail.303v.cf]: " host
host=${host:-mail.303v.cf}
read -p "clientId[]: " clientId
read -p "token[]: " token

cat <<EOF | docker exec -u 33 --interactive nextcloud_app_1 sh

./occ app:install sociallogin; \
./occ config:list sociallogin;
./occ config:app:set sociallogin enabled --value=yes;
./occ config:app:set sociallogin custom_providers --value="{\"custom_oauth2\":[{\"name\":\"Mailcow\",\"title\":\"Mailcow\",\"apiBaseUrl\":\"https:\\\/\\\/$host\",\"authorizeUrl\":\"https:\\\/\\\/$host\\\/oauth\\\/authorize\",\"tokenUrl\":\"https:\\\/\\\/$host\\\/oauth\\\/token\",\"profileUrl\":\"https:\\\/\\\/$host\\\/oauth\\\/profile\",\"logoutUrl\":\"\",\"clientId\":\"$clientId\",\"clientSecret\":\"$token\",\"scope\":\"\",\"profileFields\":\"\",\"groupsClaim\":\"\",\"style\":\"\",\"defaultGroup\":\"\"}]}";
./occ config:app:set sociallogin prevent_create_email_exists --value=1;
./occ config:app:set sociallogin update_profile_on_login --value=1;
./occ config:app:set sociallogin disable_notify_admins --value=1;
./occ config:app:set sociallogin auto_create_groups --value=1;
./occ config:system:set social_login_auto_redirect --value=true;

EOF
