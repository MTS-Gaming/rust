# docker-steamcmd-template
Template repository for building images with our steamcmd baseimage

## Usage

```Dockerfile
FROM ghcr.io/mts-gaming/rust:latest
```

## Volumes

| Path                                 | Description                                                                         | Volume Definition |
|--------------------------------------|-------------------------------------------------------------------------------------|-------------------|
| `/home/steam/rust/server`            | Where the rust server data lives                                                    | Yes               |
