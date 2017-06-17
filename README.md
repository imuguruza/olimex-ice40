# olimex-ice40
Olimex ICE40 board stuff

### Memory Flasher
	
Script used to flash the memory using a RPi.
As the memory is connected to SPI bus, you can use the RPi SPI bus to flash using `flashrom` command :)

Thanks to @anse1 for [his explanation](https://github.com/anse1/olimex-ice40-notes)!

More (hopefuly) to be come!

Use the script **piflasher.sh** to flash your *.bin bitstream, the script needs to give the name of the 
file to flash!

In case, give execution permission to the script, using `chmod +x piflasher.sh`. Execute using `./piflasher.sh`


### Requirements

+ RPi: instal `flashrom`
+ Linux computer: instal `sshpass`
