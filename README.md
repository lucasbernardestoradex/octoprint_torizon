# Octoprint for Torizon

The purpose of this application is use a Toradex SoM to control a 3D printer, wich can be acess remotely by a host computer.

## Configure the USB connection to the printer

In the `docker-compose.yml`, inside the `devices` group, the standard USB port for the connection is `- "/dev/ttyUSB0:/dev/ttyUSB0"`. However it could be another port in your device.

To search the possible ports to connection, in the target device, run the command:

`# ls /dev/ttyUSB*`

If your USB port is /dev/ttyUSB3, for example, change the `docker-compose.yml` to `- "/dev/ttyUSB3:/dev/ttyUSB0"`. Note that only the left statement is about the ports in the SoM, the right is about the container ports.

## Configure the camera port

Furthermore, the same thing must be done to the camera. The standard in the `docker-compose.yml` is `- "/dev/video2:/dev/video0"`.

To search the possible ports to connection, in the target device, run the command:

`# ls /dev/video*`

If your video port is /dev/video3, for example, change the `docker-compose.yml` to `- "- /dev/video3:/dev/video0"`. Note that only the left statement is about the ports in the SoM, the right is about the container ports.