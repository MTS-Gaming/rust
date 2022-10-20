# Rust Dedicated Server
The Rust dedicated server in a container

## Usage

```sh
docker run \
    -e PORT=28015 \
    -e RCON_PORT=28016 \
    -e RCON_WEB=1 \
    -e RCON_PASS="password" \
    -e SERVERNAME="My Rust Server" \
    -e SEED=12345 \
    -e TICK=10 \
    -e SAVEINT=600 \
    -e MAXPLAYERS=10 \
    -e WORLDSIZE=4000 \
    -v rust:/rust/server \
    -p 28015:28015/udp \
    -p 28015:28015/tcp \
    -p 28016:28016/tcp \
    ghcr.io/MTS-Gaming/rust
```

## Environment Variables

| Environment Variable | Description                         |
|----------------------|-------------------------------------|
| `SERVERNAME`         | Server Name in the Server Browser   |
| `PORT`               | Server Port                         |
| `RCON_PORT`          | Remote Console Port                 |
| `RCON_WEB`           | Enable Remote Console Webserver     |
| `SEED`               | Seed to use when generating the map |
| `TICK`               | Tick rate to run at                 |
| `SAVEINT`            | Save interval in seconds            |
| `MAXPLAYERS`         | Maximum number of players           |
| `WORLDSIZE`          | Size of the generated world         |

## Volumes

| Path                                 | Description                                                                         |
|--------------------------------------|-------------------------------------------------------------------------------------|
| `/rust/server`            | Where the rust server save data lives                                               |
