#!/bin/bash
##########################################################################################
#
# Created by: Steve Valle
# Date Created: 22/12/16
# 
# 
# Updated: Peter Wells
#
# 10-10-2018
#
# This script Installs lab specific software and preferences based on the room number
# and computer name
#
##########################################################################################

# Record the Computer Name
computer_name=`scutil --get ComputerName`

# Room number is stripped from ComputerName
computer_suffix=`scutil --get ComputerName | awk -F"-" '{print $2}'`

# Suffix is stripped from ComputerName
room_name=`scutil --get ComputerName | awk -F"-" '{print $1}'`

# Records if Data volume exists
data_volume=`test -d /Volumes/Data && echo YES || echo NO`

# Records if files exist on Data volume
files_exist=`test -e /Volumes/Data/* && echo YES || echo NO`

# Records if disks are part of a CoreStorage Volume (blank if not)
core_storage=`diskutil list | grep Apple_CoreStorage`


##########################################################################################

echo " " >> /var/log/jamf.log
echo "** DEP - Install Lab Specific Software and Preferences **" >> /var/log/jamf.log
echo "** Computer is in room "$room_name"!" >> /var/log/jamf.log
echo " " >> /var/log/jamf.log


############### Install lab software and preferences based on ComputerName ################

case $computer_name in
    "NAMEOFLAB"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-redgiant
        #jamf policy -trigger dep-secretlife
        jamf policy -trigger dep-utc-client
        ;;
    "ANOTHERLAB"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-protools
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        #jamf policy -trigger dep-finaldraft9 # Policy includes avtivation file
        jamf policy -trigger dep-ftv100007
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-redgiant
        jamf policy -trigger dep-secretlife
        jamf policy -trigger dep-utc-client
        ;;
    "ANOTHERLAB-02"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-protools
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        #jamf policy -trigger dep-finaldraft9 # Policy includes avtivation file
        jamf policy -trigger dep-ftv100007
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-redgiant
        jamf policy -trigger dep-secretlife
        jamf policy -trigger dep-utc-client
        ;;
esac
################################# Configure AV computers #################################
#if [[ $computer_name == *"AV" ]]
#	then 
 #       defaults write "/Library/Preferences/com.apple.AppleFileServer" guestAccess -bool yes; echo "-Guest Folder Sharing Enabled" >> /var/log/jamf.log
  #      test -d /Volumes/Data && sharing -a /Volumes/Data -A Data -n Data; echo "-Data Volume Shared" >> /var/log/jamf.log
   #     launchctl load -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist; echo "-File Sharing Enabled" >> /var/log/jamf.log
    #    jamf policy -trigger dep-mirror-package
     #   #jamf policy -trigger dep-appleKeynote   #installed under DEP - 3. Install SOE Software (Student Labs)
    #else
 #   	echo "- Not an AV computer. Nothing to execute!" >> /var/log/jamf.log
#fi
########################### Configure INDIVIDUAL computers #################################
case $computer_name in
    "EDITSUITE")
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-wacom-driver
        ;;
    *)
        echo "- Computer is not as edit suite. Nothing to execute!" >> /var/log/jamf.log
        ;;
esac

############################################################################################
echo "** Completed DEP - Install Lab Specific Software and Preferences **" >> /var/log/jamf.log

exit 0
