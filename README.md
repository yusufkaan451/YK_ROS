### Clone Repository
	git clone git@bitbucket.org:robotivo/robodogfreenevo.git

* You must add your publickey on Bitbucket

### Setup Robodog

* Read Tutorial.pdf and apply it on the your robodog

### Camera

* For taking photo you should "picam" python library and you must apply enable legacy camera.
* For enabling legacy camera, "sudo raspi-config" >> "Enable legacy camera" >> "OK" >> "sudo reboot"

* For live video you should use "picam2" pyhton library and you must apply disable legacy camera.
* For Disabling legacy camera, "sudo raspi-config" >> "Disable legacy camera" >> "OK" >> "sudo reboot"

* IMPORTANT: You must be careful taking camera module cable because if you don't be careful camera module is fired and cable is damage.

### GPS

* Then we need to update the RPi3
* sudo apt-get upgrade
* sudo apt-get update
* sudo apt-get install gpsd gpsd-clients python-gps foxtrotgps gpsbabel "Install gps service"

* Note: if you get any gps data or gps service is not working you try this command "sudo gpsd /dev/ttyUSB0 -F /var/run/gpsd.sock". This command is manually start code.

* If raspberry's uart pins are full try using usb. 
* You should see pins "https://cdn.sparkfun.com/assets/learn_tutorials/4/6/6/FTDI_Arduino.png?_gl=1*1awzc1w*_ga*MTk1OTA1MTQ2NS4xNjkxNTg0MTAy*_ga_T369JS7J9N*MTY5MTU4NDEwMi4xLjAuMTY5MTU4NDEwMi42MC4wLjA."

### CALIBRATION

* If robodog's calibration is not working correctly, you should use application "MAC" or "Windows". You can do precise calibration there.


### RSSI Library 
* You must add "raw_output = raw_output.decode('utf-8')" line 67 in the __init__.py. So you don't get a bytes-like object is required, not 'str'

### VOLTAGE 

* If only raspberry pi 3 is working you should 6.5 V but if raspberry pi3 and robodog are working you should 7.5 V.
* If you don't apply 7.5 V some servo motors are not working!!

### YOLO

* You should use yolov3-tiny verison. This repository contains the model, coco.names and weights that yolov3-tiny needs.
* You should clone from "git clone https://github.com/smarthomefans/darknet-test.git"

### AWS S3
* For aws configure
* AWS Access Key ID: 
* AWS Secret Access Key : 
* Default region name : nl-ams

### DOCKER

* sudo apt-get update
* sudo apt-get install ca-certificates curl gnupg
* sudo install -m 0755 -d /etc/apt/keyrings
* curl -fsSL https://download.docker.com/linux/raspbian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
* sudo chmod a+r /etc/apt/keyrings/docker.gpg
* docker login and pull ROS







docker run -it \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
--privileged \
--restart always \
--name ros \
--env="DISPLAY" \
--env="QT_X11_NO_MITSHM=1" \
-v "/home/robo/temp/robodogfreenevo/Code/:/ROSDockerFolder" \
robodog-ros:v1
