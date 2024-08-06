#!/bin/bash

declare -A computers

read_config() {
  while read -r device user hostname mac; do
    computers["$device"]="$user $hostname $mac"
  done < <(
    awk ' BEGIN {IGNORECASE=1}
      /^ *Host /          {device=$2}
      /^ *HostName /      {hostname=$2}
      /^ *User /          {user=$2}
      /^ *# Mac Address/  {mac=$2; gsub(/[<>]/,"",mac); print device, user, hostname, mac}
      ' ~/.ssh/config )
  }

choose_computer() {
    echo "Choose a computer to wake and connect to:"
    select device in "${!computers[@]}"; do
        if [[ -n "$device" ]]; then
            echo "You chose $device"
            break
        else
            echo "Invalid choice. Try again."
        fi
    done
}

wake_and_connect(){
  local machine=(${computers[$device]})
  local mac=${machine[2]}

  echo "Waking up $device ..."
  wakeonlan "$mac"
  echo "Waiting for $device to wake up..."
  sleep 30

  echo "Connecting to $device"
  ssh $device
}

mini_man(){
  echo -e "NAME\n\tWakeAndConnect - Use Wake-on-LAN to power on machines and establish secure connections via SSH."
  echo -e "SYNOPSIS\n\twakeandconnect [options] [device]"
  echo -e "DESCRIPTION\n\tWakeAndConnect is a shell script that utilizes Wake-On-Lan and SSH\n\tto automate the process of turning on and connecting to a remote computer."
  echo -e "OPTIONS\n\t-h, --help\tDisplay the mini manual page"
}

main(){
  options=$(getopt -o h --long help -- "$@")
  eval set -- "$options"

  while true ; do
    case "$1" in 
      -h|--help)
        mini_man
        exit 0
        ;;
      --)
        shift
        break 
        ;;
      *)
        mini_man
        exit 1
        ;;
    esac
    shift
  done

  read_config
  choose_computer
  wake_and_connect
}
main "$@"
