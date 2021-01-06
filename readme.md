# todo

- docs
    - how to login?
    - login with username@303v.cf
    - create script to setup all containers
    - where to change hostnames and stuff?
    - document with screenshots
- technically
    - selfserviceportal
    - ldaps
    - connect mailcow to ldap
    - create script to add user
- selfservice portal?
- document which passwords to set

# installation

1. run all.sh to start all containers
```
./all.sh
```
2. nextcloud takes a minute to setup, you will notice an error(`Nextcloud is not installed...`) in the following scripts if its not finished yet
3. run `./nextcloud/setupMail.sh` to setup mail inside nextcloud
4. run `./nextcloud/setupOauth.sh` and follow these instructions to setup Oauth with mailcow https://mailcow.github.io/mailcow-dockerized-docs/third_party-nextcloud/

setup custom links
https://docs.nextcloud.com/server/latest/admin_manual/configuration_server/external_sites.html
