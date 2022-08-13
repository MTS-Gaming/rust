# docker-steamcmd-template
Template repository for building images with our steamcmd baseimage

## Usage

```Dockerfile
FROM ghcr.io/mts-gaming/docker-steamcmd-template:latest
```

## Volumes

| Path                                 | Description                                                                         | Volume Definition |
|--------------------------------------|-------------------------------------------------------------------------------------|-------------------|
| `/home/steam/.local`                 | Where games usually store their savegames.                                          | Yes               |
| `/home/steam/Steam/steamapps/common` | Where games are installed by default (I.E. when `force_install_dir` is not defined) | No                |
