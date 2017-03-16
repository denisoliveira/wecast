#!/bin/bash

HOST="192.168.49.1"

HOST="${HOST:=$DEFAULT_HOST}"

media-controll() {
	case "$1" in
		"play" | "pause" | "stop" | "rew" | "ffw" | "vol_up" | "pre" | "next" | "vol_down" ) 
			curl -s "http://$HOST/cgi-bin/media_control.cgi?control=$1" >> /dev/null
		;;
		* )
			echo "Invalid option"
		;;
	esac
}

overscan() {
	curl -s "http://$HOST/cgi-bin/overscan.cgi" --data "overscan=$1" >> /dev/null
}

case "$1" in
	"media-controll" | "overscan" )
		$@
	;;
	* )
		echo "Invalid option: $1"
		echo "Commands:"
		echo " media-controll [play | pause | stop | rew | ffw | vol_up | pre | next | vol_down]"
		echo " overscan [0-100]"
	;;
esac
