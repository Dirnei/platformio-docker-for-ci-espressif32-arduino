FROM infinitecoding/platformio-for-ci

# add build user
RUN groupadd -g 1001 vsts
RUN useradd --gid 1001 --uid 1001 vsts
RUN mkdir -p /home/vsts
RUN chown vsts:vsts /home/vsts

ENV PATH=${PATH}:/home/vsts/.local/bin

# install tool-chain for user vsts
USER vsts:vsts
WORKDIR /home/vsts

# Install PlatformIO, and it's newest available dependencies via pip.
RUN platformio platform install espressif32 \
--with-package framework-arduinoespressif32

# change
USER root:root

# Delete entrypoint of parent containers (required by Azure Pipelines)
ENTRYPOINT []
