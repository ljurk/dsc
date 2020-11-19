#!/bin/sh
cat <<EOF | docker exec -u 33 --interactive nextcloud2_app_1 sh

./occ app:install user_ldap; \
./occ app:install ldap_contacts_backend; \
./occ app:enable user_ldap; \
./occ app:enable ldap_contacts_backend; \
./occ ldap:create-empty-config; \
./occ ldap:set-config s01 ldapAgentName cn=admin,dc=303v,dc=cf; \
./occ ldap:set-config s01 ldapAgentPassword change_me; \
./occ ldap:set-config s01 ldapBase dc=303v,dc=cf; \
./occ ldap:set-config s01 ldapBaseGroups dc=303v,dc=cf; \
./occ ldap:set-config s01 ldapBaseUsers dc=303v,dc=cf; \
./occ ldap:set-config s01 ldapCacheTTL 600; \
./occ ldap:set-config s01 ldapConfigurationActive 1; \
./occ ldap:set-config s01 ldapEmailAttribute mail; \
./occ ldap:set-config s01 ldapExperiencedAdmin 0; \
./occ ldap:set-config s01 ldapExpertUsernameAttr uid; \
./occ ldap:set-config s01 ldapGidNumber gidNumber; \
./occ ldap:set-config s01 ldapGroupDisplayName cn; \
./occ ldap:set-config s01 ldapGroupFilter "(&((objectclass=posixGroup)))"; \
./occ ldap:set-config s01 ldapGroupFilterMode 0; \
./occ ldap:set-config s01 ldapGroupFilterObjectclass posixGroup; \
./occ ldap:set-config s01 ldapGroupMemberAssocAttr gidNumber; \
./occ ldap:set-config s01 ldapHost openldap; \
./occ ldap:set-config s01 ldapLoginFilter "(&((objectclass=posixAccount))(uid=%uid))"; \
./occ ldap:set-config s01 ldapLoginFilterEmail 0; \
./occ ldap:set-config s01 ldapLoginFilterMode 0; \
./occ ldap:set-config s01 ldapLoginFilterUsername 1; \
./occ ldap:set-config s01 ldapMatchingRuleInChainState unknown; \
./occ ldap:set-config s01 ldapNestedGroups 0; \
./occ ldap:set-config s01 ldapPagingSize 500; \
./occ ldap:set-config s01 ldapPort 389; \
./occ ldap:set-config s01 ldapTLS 0; \
./occ ldap:set-config s01 ldapUserAvatarRule default; \
./occ ldap:set-config s01 ldapUserDisplayName cn; \
./occ ldap:set-config s01 ldapUserFilter "((objectclass=posixAccount))"; \
./occ ldap:set-config s01 ldapUserFilterMode 0; \
./occ ldap:set-config s01 ldapUserFilterObjectclass posixAccount; \
./occ ldap:set-config s01 ldapUuidGroupAttribute auto; \
./occ ldap:set-config s01 ldapUuidUserAttribute auto; \
./occ ldap:set-config s01 turnOffCertCheck 1; \
./occ ldap:set-config s01 turnOnPasswordChange 0; \
./occ ldap:set-config s01 useMemberOfToDetectMembership 1; \
./occ ldap:test-config s01
EOF
