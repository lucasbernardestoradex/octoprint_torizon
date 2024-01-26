ARG BASE_VERSION=latest

##
# Board architecture
# arm or arm64
##
ARG IMAGE_ARCH=

##
# Board GPU vendor prefix
##
ARG GPU=

# DEPLOY ------------------------------------------------------------------------
FROM --platform=linux/${IMAGE_ARCH} octoprint/octoprint:${BASE_VERSION}

ARG IMAGE_ARCH
ARG GPU

RUN apt-get -y update && apt-get install -y --no-install-recommends \
# DO NOT REMOVE THIS LABEL: this is used for VS Code automation
    # __torizon_packages_prod_start__
    # __torizon_packages_prod_end__
# DO NOT REMOVE THIS LABEL: this is used for VS Code automation
	&& apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*
