#----------------------------------------------------------------------------#
# Olimex iCE40HX1K board flasher
# using a Rpi Raspbian image
# Requirements: install flashrom under Rpi & sshpass under your Linux computer
# Author: Iñigo Muguruza imuguruza @GitHub
# License: GPLv2
#----------------------------------------------------------------------------#

#! /bin/bash
pswd="raspberry"
pi_ip=192.168.1.133
gpio=24
#Create an Flash size image to flash
tr '\0' '\377' < /dev/zero | dd bs=2048kB count=245 of=image &> /dev/null
dd if=$1 conv=notrunc of=image &> /dev/null

echo "Connecting to RPi..."
#Copy the bitstream into Rpi
sshpass -p "raspberry" scp image pi@$pi_ip:/home/pi
#Connect to your RPI
sshpass -f <(printf raspberry) ssh pi@$pi_ip " \

sudo echo $gpio > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio24/direction
echo "Reading memory content..."
#Create an image out of acutal content of flash
/usr/local/sbin/flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=20000 -r dump
echo "Flashing memory..."
/usr/local/sbin/flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=20000 -w image
echo $gpio > /sys/class/gpio/unexport
exit"
echo "Exiting..."
rm image
