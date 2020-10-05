#!/bin/bash

# while-menu-dialog: a menu driven system information program

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0
NUMITEM=7

function do_sel_1()
{
  echo "do_sel_1()"
}

function do_sel_2()
{
  echo "do_sel_2()"
}

function do_sel_3()
{
  echo "do_sel_3()"
}

function do_sel_4()
{
  echo "do_sel_4()"
}

function do_sel_5()
{
  echo "do_sel_5()"
}

function do_sel_6()
{
  echo "do_sel_6()"
}

function do_sel_7()
{
  echo "do_sel_7()"
}

function do_sel_8()
{
  echo "do_sel_8()"
}

function do_sel_9()
{
  echo "do_sel_9()"
}

function do_sel_10()
{
  echo "do_sel_10()"
}

function do_sel_11()
{
  echo "do_sel_11()"

}


function customenu()
{
	while true; do
	  exec 3>&1
	  selection=$(dialog \
	    --backtitle "Installation of KSB Framework" \
	    --title "Customize BeeAI" \
	    --clear \
	    --cancel-label "Exit" \
	    --checklist "Space to select/deselect TARGET\nEnter to install selected TARGETS\n... Please select:" $HEIGHT $WIDTH $NUMITEM \
	    "1" "Display System Information" off \
	    "2" "Display Disk Space" off \
	    "3" "Display Home Space Utilization Utilization Utilization" off\
	    "4" "Display Home Space Utilization" off\
	    "5" "Display Home Space Utilization" off\
	    "6" "Display Home Space Utilization" off\
	    "7" "Display Home Space Utilization" off\
	    "8" "Display Home Space Utilization" off\
	    "9" "Display Home Space Utilization" off\
	    "10" "Display Home Space Utilization" off\
	    "11" "Display Home Space Utilization" off\
	    2>&1 1>&3)
	  exit_status=$?
	  exec 3>&-
	  case $exit_status in
	    $DIALOG_CANCEL)
	      clear
	      echo "Program terminated."
	      exit
	      ;;
	    $DIALOG_ESC)
	      clear
	      echo "Program aborted." >&2
	      exit 1
	      ;;
	  esac
	  for sel in $selection
	  do
	    if [ $sel = 1 ]; then
	      do_sel_1
	    elif [ $sel = 2 ]; then
	      do_sel_2
	    elif [ $sel = 3 ]; then
	      do_sel_3
	    elif [ $sel = 4 ]; then
	      do_sel_4
	    elif [ $sel = 5 ]; then
	      do_sel_5
	    elif [ $sel = 6 ]; then
	      do_sel_6
	    elif [ $sel = 7 ]; then
	      do_sel_7
	    elif [ $sel = 8 ]; then
	      do_sel_8
	    elif [ $sel = 9 ]; then
	      do_sel_9
	    elif [ $sel = 10 ]; then
	      do_sel_10
	    elif [ $sel = 11 ]; then
	      do_sel_11
	    fi
	  done

	  #test
	  exit

	done
}

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "Installation of KSB Framework" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH $NUMITEM \
    "1" "Display System Information" \
    "2" "Display Disk Space" \
    "3" "Display Home Space Utilization" \
    "4" "Customize BeeAI" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      result=$(echo "Hostname: $HOSTNAME"; uptime)
      display_result "System Information"
      ;;
    2 )
      result=$(df -h)
      display_result "Disk Space"
      ;;
    3 )
      if [[ $(id -u) -eq 0 ]]; then
        result=$(du -sh /home/* 2> /dev/null)
        display_result "Home Space Utilization (All Users)"
      else
        result=$(du -sh $HOME 2> /dev/null)
        display_result "Home Space Utilization ($USER)"
      fi
      ;;
    4 )
      customenu
  esac
done

