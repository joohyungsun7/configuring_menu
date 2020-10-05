#!/bin/bash

SELYES=0
SELNO=1
SELESC=255

HEIGHT=30
WIDTH=60
NUMITEM=20

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
#	while true; do
	  exec 3>&1
	  cussel=$(dialog \
	    --backtitle "Installation of KSB Framework" \
	    --title "Customize BeeAI" \
	    --clear \
	    --cancel-label "Cancel" \
	    --checklist "Space to select/deselect TARGET\nEnter to install selected TARGETS\n... Please select:" $HEIGHT $WIDTH $NUMITEM \
	    "1" "Option 1" on \
	    "2" "Option 2" off \
	    "3" "Option 3" on\
	    "4" "Option 4" off\
	    "5" "Option 5" on\
	    "6" "Option 6" off\
	    "7" "Option 7" off\
	    "8" "Option 8" off\
	    "9" "Option 9" off\
	    "10" "Option 10" off\
	    "11" "Option 11" off\
	    2>&1 1>&3)
          defsel=$?
	  exec 3>&-
	  case $defsel in
	    $SELNO)
	      return
	      ;;
	    $SELESC)
	      return
	      ;;
	  esac
	  for sel in $cussel
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

clear

echo "Option(s) $cussel is/are selected"

exit
#	done
}

function normal_install()
{
  exec 3>&1
  insta=$(dialog --title "  Normal installation  " --clear --cancel-label "Cancel" \
         --yesno "Description for Normal installation..." 0 0 \
        2>&1 1>&3)
  defsel=$?
  exec 3>&-
  case $defsel in
    $SELNO) 
      return
      ;;
    $SELYES)
      clear
      
      do_sel_1
      do_sel_3
      do_sel_5
      do_sel_7
      do_sel_9
      do_sel_11


      exit
      ;;
  esac
}

function maximal_install()
{
  exec 3>&1
  insta=$(dialog --title "  Maximal installation  " --clear --cancel-label "Cancel" \
         --yesno "Description for Maximal installation..." 0 0 \
        2>&1 1>&3)
  defsel=$?
  exec 3>&-
  case $defsel in
    $SELNO) 
      return
      ;;
    $SELYES)
      clear
      
      do_sel_1
      do_sel_2
      do_sel_3
      do_sel_4
      do_sel_5
      do_sel_6
      do_sel_7
      do_sel_8
      do_sel_9
      do_sel_10
      do_sel_11


      exit
      ;;
  esac
}

function trial_install()
{
  exec 3>&1
  insta=$(dialog --title "  Trial/Demo installation  " --clear --cancel-label "Cancel" \
         --yesno "Description for Trial/Demo installation..." 0 0 \
        2>&1 1>&3)
  defsel=$?
  exec 3>&-
  case $defsel in
    $SELNO) 
      return
      ;;
    $SELYES)
      clear

      do_sel_1
      do_sel_5
      do_sel_10

      exit
      ;;
  esac
}

# test
while true; do
#

  exec 3>&1
  mainsel=$(dialog \
    --backtitle "Installation of KSB Framework" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH $NUMITEM \
    "1" "Normal" \
    "2" "Maximal" \
    "3" "Trial/Demo" \
    "4" "Customization" \
    2>&1 1>&3)
  defsel=$?
  exec 3>&-
  case $defsel in
    $SELNO)
      clear
      exit
      ;;
    $SELESC)
      clear
      exit 1
      ;;
  esac
  case $mainsel in
    0)
      clear
      ;;
    1)
      normal_install
      ;;
    2)
      maximal_install
      ;;
    3)
      trial_install
      ;;
    4)      
      customenu
      ;;
  esac
# test
done
#
