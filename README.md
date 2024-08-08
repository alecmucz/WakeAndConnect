WakeAndConnect is a shell script that utilizes Wake-On-Lan and SSH to automate the process of turning on and connecting to a remote computer.

NAME
	WakeAndConnect - Use Wake-on-LAN to power on machines and establish secure connections via SSH.
SYNOPSIS
	wakeandconnect [options] [device]
DESCRIPTION
	WakeAndConnect is a shell script that utilizes Wake-On-Lan and SSH
	to automate the process of turning on and connecting to a remote computer.
OPTIONS
	-h, --help	Display the mini manual page
	-c, --config	Display all devices and device information
ARGUMENTS
	device	 The name of the device to wake up and connect to. Same as your ssh shortcut.
EXAMPLES
	wakeandconnect -h
	wakeandconnect -c
	wakeandconnect device
