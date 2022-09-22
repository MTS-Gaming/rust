FROM ghcr.io/mts-gaming/docker-steamcmd-base:latest

# Labels
LABEL org.opencontainers.image.authors="andrew_stclair@hotmail.com"
LABEL description="Rust Dedicated Server"
LABEL version="v1.0.0"

# Setting all the Environment Variables
ARG LANGUAGE=en_US.UTF-8
ARG PORT=28015
ARG RCON_PORT=28016

ENV LANG=${LANGUAGE} \
    PORT=${PORT} \
    RCON_PORT=${RCON_PORT} \
    RCON_WEB=1 \
    RCON_PASS="password" \
    SERVERNAME="My Rust Server" \
    SEED=12345 \
    TICK=10 \
    SAVEINT=600 \
    MAXPLAYERS=10 \
    WORLDSIZE=4000 \
    LD_LIBRARY_PATH=./RustDedicated_Data/Plugins:./RustDedicated_Data/Plugins/x86_64

# Download Rust Dedicated Server via SteamCMD
RUN ["/steamcmd/steamcmd.sh", \
    "+force_install_dir", "/rust", \
    "+login", "anonymous", \
    "+app_info_update", "1", \
    "+app_update", "258550", "validate", \
    "+quit"]

WORKDIR /rust

ENTRYPOINT [ "./RustDedicated", \
    "+rcon.web", "1", \
    "+rcon.password", "$RCON_PASS", \
    "+rcon.port", "$RCON_PORT", \
    "+server.port", "$PORT", \
    "+server.hostname", "$SERVERNAME", \
    "+server.seed", "$SEED", \
    "+server.tickrate", "$TICK", \
    "+server.saveinterval", "$SAVEINT", \
    "+server.maxplayers", "$MAXPLAYERS", \
    "+server.worldsize", "$WORLDSIZE", \
    "+nav_disable" ]

EXPOSE ${PORT}/udp
EXPOSE ${PORT}/tcp
EXPOSE ${RCON_PORT}/tcp

# Save data location
VOLUME [ "/rust/server" ]
