1. add oauth provider in mailcow for url https://docker.303v.cf
2. setup custom oauth provider in portainer with the following data

| Field             | Value                                |
| -----             | -----                                |
| ClientId          | ClientId from mailcow                |
| ClientSecret      | ClientSecret from mailcow            |
| Authorization URL | https://mail.303v.cf/oauth/authorize |
| Access Token URL  | https://mail.303v.cf/oauth/token     |
| Resource URL      | https://mail.303v.cf/oauth/profile   |
| Redirect URL      | https://docker.303v.cf               |
| User Identifier   | email                                |
| Scopes            | profile                              |
