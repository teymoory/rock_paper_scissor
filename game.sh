#!/bin/bash

#clearing
clear >&2

echo "
 ██████╗  █████╗ ███╗   ███╗███████╗
██╔════╝ ██╔══██╗████╗ ████║██╔════╝
██║  ███╗███████║██╔████╔██║█████╗
██║   ██║██╔══██║██║╚██╔╝██║██╔══╝
╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗
 ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
" |lolcat
#--------
ex="exit"
s="rock"
k="paper"
g="scissor"

function clean(){
	echo "		"

}
function replay(){
	if [ $random -eq 1 ];then
		echo " Replay => $s"
	elif [ $random -eq 2 ];then
		echo " Replay => $k"
	elif [ $random -eq 3 ];then
		echo " Replay => $g"
	fi
}

function win(){
	if [ $random -eq 1 ] && [ "$input" = "$k" ];then
		echo "### Win ! ###" | lolcat
	elif [ $random -eq 2 ] && [ "$input" = "$g" ];then
		echo "### Win ! ###" | lolcat
	elif [ $random -eq 3 ] && [ "$input" = "$s" ];then
                echo "### Win ! ###" | lolcat
	fi
}
function lose(){
        if [ $random -eq 1 ] && [ "$input" = "$g" ];then
                echo "### Lose ! ###" | lolcat
        elif [ $random -eq 2 ] && [ "$input" = "$s" ];then
                echo "### Lose ! ###" | lolcat
        elif [ $random -eq 3 ] && [ "$input" = "$k" ];then
                echo "### Lose ! ###" | lolcat
	fi
}

function equal(){
        if [ $random -eq 1 ] && [ "$input" = "$s" ];then
		echo "Equal ! Again" | lolcat
        elif [ $random -eq 2 ] && [ "$input" = "$k" ];then
                echo "Equal ! Again" | lolcat
        elif [ $random -eq 3 ] && [ "$input" = "$g" ];then
		echo "Equal ! Again" | lolcat
	fi
}

while [ -z $input ];do
	random=$((RANDOM%3+1))
	#echo $random

	read -p "Enter => rock | paper | scissor : " input
	input=$(echo $input | tr -d [:digit:] | tr -d [:punct:])

	if [ "$s" = "$input" ];then
		clean
		replay
		clean
		win
		clean
		lose
		clean
		equal
		clean
	elif [ "$k" = "$input" ];then
		clean
		replay
		clean
               	win
		clean
               	lose
		clean
               	equal
		clean
	elif [ "$g" = "$input" ];then
		clean
		replay
		clean
               	win
		clean
               	lose
		clean
               	equal
		clean
	fi

	if [ "$input" = "$ex" ];then
		clean
		echo break | lolcat
		clean
		break 1
	fi
	unset input
	clean
done
