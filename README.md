# PlatformIO container with preinstalled toolchain for Arduino on the espressif32 platform

This docker image can be used to build PlatformIO projects within a docker container. It has no entrypoint so you have to provide the command by yourself. This e.g. usefull if you want to run this container in a Azure DevOps build pipeline.

## Preinstalled 

I allready preinstalled the packages which are needed for ESP32 builds with the Arduino framework

> The packages are installed for uid 1001 (Username: vsts)