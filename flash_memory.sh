#! /bin/bash

echo 24 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio24/direction
echo "Reading memory content..."
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=20000 -r dump
echo "Flashing back again the memory..."
flashrom -p linux_spi:dev=/dev/spidev0.0,spispeed=20000 -w dump

