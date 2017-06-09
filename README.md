# VNC IntelliJ

Builds a Docker image with X, VNC and IntelliJ set up

## Prerequisites

To run this image, you'll need to [install Docker](https://docs.docker.com/engine/installation/linux/ubuntu/) (instructions for Ubuntu).

## Running the image (first time)

To run the image, use the following command (this will download the image if it doesn't exist):

```bash
$ docker run --name vnc-intellij -v /home/myuser/code:/src -p 5901:5901 pandeiro/vnc-intellij:latest
```

This assumes that there is some code in `/home/myuser/code` that you will want to view in IntelliJ, where it will be available in the container's `/src` directory.

## Connecting to the Server

Once you have the container running, you can connect to it using a VNC client:

```bash
$ vinagre <serverip>:5901
```

It will prompt for a password, which is set by default to 'password'. (You can change it by following the instructions [here](https://hub.docker.com/r/kaixhin/vnc/).)

The IntelliJ application is accessible in the 'Other' folder from the LXDE start menu in the bottom left corner of the desktop.

## Using the container subsequent times

You can keep the container server running and simply disconnect your VNC client to maintain state, or you can also terminate the container process:

```bash
$ docker stop vnc-intellij
```

Then, if you wish to use it again:

```bash
$ docker start vnc-intellij
```
