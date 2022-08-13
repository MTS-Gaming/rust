FROM ghcr.io/mts-gaming/docker-steamcmd-base

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
    WORLDSIZE=4000

# Download Rust Dedicated Server via SteamCMD
RUN ["/home/steam/steamcmd/steamcmd.sh", \
    "+login", "anonymous", \
    "+force_install_dir", "/home/steam/rust", \
    "+app_info_update", "1" \
    "+app_update", "258550", "validate", \
    "+quit"]

COPY --chown=Rust:root ./server.sh /home/steam/rust/server.sh

USER steam

WORKDIR /home/steam/rust

ENTRYPOINT [ "/bin/bash", "/home/steam/rust/server.sh" ]

EXPOSE ${PORT}/udp
EXPOSE ${PORT}/tcp
EXPOSE ${RCON_PORT}/tcp

# Volumes for Persistent Server Data
VOLUME "/home/steam/rust/server"
