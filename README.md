# PlatformIO container with preinstalled toolchain for Arduino on the espressif32 platform

This docker image can be used to build PlatformIO projects within a docker container. It has no entrypoint so you have to provide the command by yourself. This e.g. usefull if you want to run this container in a Azure DevOps build pipeline.

## Preinstalled 

I allready preinstalled the packages which are needed for ESP32 builds with the Arduino framework

> The packages are installed for uid 1001 (Username: vsts)

## Example usage local

```docker
docker run -v ${pwd}:/opt/build dirnei/ --user 1001 platformio-for-ci-espressif32-arduino:latest platformio run -d /opt/build/.
```

## Example usage Azure DevOps
```yml
# ...
resources:
    containers:
    - container: platformio
      image: dirnei/platformio-for-ci-espressif32-arduino:latest
      endpoint: your-service-connection

jobs:
- job: esp32_platformio
  displayName: "PlatformIO build"
  pool:
    vmImage: ubuntu-18.04
  container: platformio
  steps:
# ...
  - script: platformio run -d .
    displayName: 'Build firmware'
# ....
```