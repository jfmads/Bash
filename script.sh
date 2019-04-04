#!/bin/bash
clear

main (){												 	# main program -- first thing executed
	menu
}

fileman() {
	sleep .3												# slows process for user
	clear
	echo "--------------------------------------------"
	echo "-             File Manipulation            -"
	echo "--------------------------------------------"
	echo ""
	echo "  1.) Create .txt File"
	echo "  2.) Create Folder"
	#echo "  3.) Find File" #whereis
	#echo "  4.) Move File"
	#echo "  5.) Remove File"
	echo ""
	echo "--------------------------------------------"
	nav

	while true; do

		read input
		case $input in
			1) cfi
			   nav2;;
			2) cfo
			   nav2;;
		#	3) findfi
		#	   nav2;;
			m) menu;;
			b) fileman;;
			q) echo ""
			   echo "exiting..." 							# CASE 3: quit
			   sleep .5
			   clear
			   exit;;	
			*) echo ""
			   echo "	INVALID INPUT"
			   sleep .3
			   fileman;;
		esac
	done
}

cfi(){
	sleep .3
	clear
	echo "--------------------------------------------"
	echo "-               Create File                -"
	echo "--------------------------------------------"
	echo ""
	echo "The file will be created on your desktop...."
	echo ""
	echo -n "Enter file name: "
	read fn
	cd ~/Desktop
	if [ ! -f $fn ]
	then
	  echo ""
	  echo "Creating file $fn ...."
	  echo ""
	  echo "Opening file $fn ...."
	  sleep .3
      touch $fn
      gedit $fn
	else
	  echo ""
	  echo "The file $fn already exists.. opening file..."
	  sleep .3
      gedit $fn
    fi
}

cfo(){
    sleep .3
	clear
	echo "--------------------------------------------"
	echo "-             Create Folder                -"
	echo "--------------------------------------------"
	echo ""
	echo "The folder will be created on your desktop...."
	echo ""
	echo -n "Enter folder name: "
	read fn
	cd ~/Desktop
	if [ ! -d $fn ]
	then
	  echo ""
	  echo "Creating folder $fn ...."
	  echo ""
	  echo "Opening folder $fn ...."
	  echo ""
	  sleep .3
      mkdir $fn
      xdg-open $fn
	else
	  echo ""
	  echo "The file $fn already exists.. opening file..."
	  echo ""
	  sleep .3
      xdg-open $fn
    fi
}

findfi()
{
    sleep .3
	clear
	echo "--------------------------------------------"
	echo "-               Find Files                 -"
	echo "--------------------------------------------"
	echo ""
	echo "The file to be found on your CPU...."
	echo ""
	echo -n "Enter file name: "
	read fn
	cd ~
	if [ ! $(readlink -m $fn) ]
	then
	  echo ""
	  echo "$fn file does not exist"
	  echo ""
	  sleep .3
	else
	  echo ""
	  echo -n "The file is located at: "
	  readlink -m $fn
	  sleep .3
      #xdg-open $fn
    fi

}

menu() {
	sleep .3												# slows process for user
	clear
	echo "--------------------------------------------"
	echo "-                  Menu                    -"
	echo "--------------------------------------------"
	echo ""
	echo "  1.) File Manipulation "
	echo "  2.) System Diagnostics"
	echo ""
	echo "--------------------------------------------"

	echo "enter 'q' to quit program"
	echo ""
	echo -n "(enter digit): "

	while true; do

		read input											# variable input
		case $input in 
			1) fileman;;									# CASE 1: file manipulation
			2) sysdi;;										# CASE 2: system diagnostics
			q) echo ""
			   echo "exiting..." 							# CASE 3: quit
			   sleep .5
			   clear
			   exit;;
			*) echo ""
			   echo "	INVALID INPUT"
			   sleep .3
			   menu;;								
		esac
	done
}

nav() {
	echo "enter 'm' to exit to main menu"
	echo "enter 'q' to quit program"
	echo ""
	echo -n "(enter digit): "
}

nav2() {
	echo ""
	echo "--------------------------------------------"
	echo "enter 'm' to exit to main menu"
	echo "enter 'b' to exit to previous menu"
	echo "enter 'q' to quit program"
	echo ""
	echo -n "(enter digit): "
}

sysdi() {
	sleep .3												# slows process for user
	clear
	echo "--------------------------------------------"
	echo "-            System Diagnostics            -"
	echo "--------------------------------------------"
	echo ""
	echo "  1.) System Information"
	echo "  2.) Active Network Connections"
	echo "  3.) Input / Output Devices"
	echo "  4.) Users Active Today"
	echo "  5.) Storage"
	echo ""
	echo "--------------------------------------------"
	nav

	while true; do

		read input
		case $input in
			1) sleep .3
			   clear
			   echo "--------------------------------------------"
			   echo "-            System Information            -"
			   echo "--------------------------------------------"
			   echo ""
			   lscpu
			   nav2;;
			2) sleep .3
			   clear
			   echo "--------------------------------------------"
			   echo "-        Active Network Connections        -"
			   echo "--------------------------------------------"
			   echo ""
			   netstat -lu
			   nav2;;
			3) sleep .3
			   clear
			   echo "--------------------------------------------"
			   echo "-          Input / Output Devices          -"
			   echo "--------------------------------------------"
			   echo ""
			   iostat
			   nav2;;
			4) sleep .3
			   clear
			   echo "--------------------------------------------"
			   echo "-            Users Active Today            -"
			   echo "--------------------------------------------"
			   echo ""
			   w
			   nav2;;
			5) sleep .3
			   clear
			   echo "--------------------------------------------"
			   echo "-                 Storage                  -"
			   echo "--------------------------------------------"
			   echo ""
			   free
			   nav2;;
			m) menu;;
			b) sysdi;;
			q) echo ""
			   echo "exiting..." 							# CASE 3: quit
			   sleep .5
			   clear
			   exit;;
			*) echo ""
			   echo "	INVALID INPUT"
			   sleep .3
			   sysdi;;	
		esac
	done
}

main $@ 													# allows prototyping 

