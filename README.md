# windup-keycloak-theme

Keycloak theme for the Windup project

## Development

### Requisites

- Install xmlstarlet:

```shell
sudo dnf install xmlstarlet
```

### Init dev environment

Setup your dev environment executing:

```shell
./setup-dev-env.sh
```

The script above will download Keycloak and configure files. Now you can init Keycloak:

```shell
./workspace/keycloak-15.1.1/bin/standalone.sh
```

- Open your browser using http://localhost:8080/auth and create your admin user.
- Select the new theme in the Keycloak console
