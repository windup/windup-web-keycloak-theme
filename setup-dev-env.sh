
#!/usr/bin/env bash

KcVersion=15.1.1
wget https://github.com/keycloak/keycloak/releases/download/$KcVersion/keycloak-$KcVersion.tar.gz -P workspace/
tar xvzf workspace/keycloak-*.tar.gz -C workspace/

xmlstarlet ed \
-L \
-N s=urn:jboss:domain:16.0 \
-N su=urn:jboss:domain:keycloak-server:1.1 \
-u '/s:server/s:profile/su:subsystem/su:theme/su:staticMaxAge' -v "-1" \
-u '/s:server/s:profile/su:subsystem/su:theme/su:cacheThemes' -v "false" \
-u '/s:server/s:profile/su:subsystem/su:theme/su:cacheTemplates' -v "false" \
-u '/s:server/s:profile/su:subsystem/su:theme/su:dir' -v "$(pwd)/src/main/resources/theme" \
workspace/keycloak-*/standalone/configuration/standalone.xml

cp -r workspace/keycloak-*/themes/* src/main/resources/theme/

cp src/main/resources/theme/windup/login/login_required.theme.properties src/main/resources/theme/windup/login/theme.properties
cp src/main/resources/theme/mta/login/login_required.theme.properties src/main/resources/theme/mta/login/theme.properties
cp src/main/resources/theme/tackle/login/login_required.theme.properties src/main/resources/theme/tackle/login/theme.properties
cp src/main/resources/theme/mtr/login/login_required.theme.properties src/main/resources/theme/mtr/login/theme.properties

echo "You can start the server using ./workspace/keycloak-$KcVersion/bin/standalone.sh"