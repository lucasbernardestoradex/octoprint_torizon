# Octoprint for Torizon

The purpose of this application is use a Toradex SoM to control a 3D printer, wich can be acess remotely by a host computer.

## Configure the USB connection to the printer

In the `docker-compose.yml`, inside the `device_cgroup_rules`, the standard USB port for the connection is `- c 188:0 rmw`. However it could be another port in your device.

To search the possible ports to connection, in the target device, run the command and use `Linux device major`:

`# ls -l /dev/ttyUSB*`

In this case, running this command provide `crw-rw---- 1 root dialout 188,   0 Sep  5 17:41 ttyUSB0`, so on the `docker-compose.yml`, use `- c 188:0 rmw` inside `device_cgroup_rules`. Note that only the left statement is about the ports in the SoM, the right is about the container ports.

## Configure the camera port

Furthermore, the same thing must be done to the camera, inside the `device_cgroup_rules`.

To search the possible ports to connection, in the target device, run the command:

`# ls -l /dev/video*`

If your video port is `crw-rw---- 1 root video    81,   4 Sep  5 17:41 video`, for example, change the `device_cgroup_rules` to `- c 81:* rmw`. Also, you should select your camera index on `CAMERA_DEV` virtual environment.
