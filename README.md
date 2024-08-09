# WakeAndConnect
WakeAndConnect is a shell script that utilizes Wake-On-Lan and SSH to automate the process of turning on and connecting to a remote computer.
## NAME
WakeAndConnect - Use Wake-on-LAN to power on machines and establish secure connections via SSH.
## SYNOPSIS
wakeandconnect [options] [device]
## DESCRIPTION
WakeAndConnect is a shell script that utilizes Wake-On-Lan and SSH
to automate the process of turning on and connecting to a remote computer.
## OPTIONS
- -h, --help&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Display the mini manual page
- -c, --config&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Display all devices and device information
## ARGUMENTS
- device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The name of the device to wake up and connect to. Same as your ssh shortcut.
## EXAMPLES
- wakeandconnect -h
- wakeandconnect -c
- wakeandconnect device
