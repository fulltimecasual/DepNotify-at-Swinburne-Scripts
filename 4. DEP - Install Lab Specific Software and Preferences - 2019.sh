#!/bin/bash
##########################################################################################
#
# Created by: Steve Valle
# Date Created: 22/12/16
# Ext. No.: 8834
# 
# Updated: Peter Wells
#Ext: 8148
#10-10-2018
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
    "24G204"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        #jamf policy -trigger dep-finaldraft9 # Policy includes avtivation file
        #jamf policy -trigger dep-ftv100007
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-redgiant
        #jamf policy -trigger dep-secretlife
        jamf policy -trigger dep-utc-client
        if [[ $computer_name == *"001" ]]
	        then 
        	    jamf policy -trigger dep-neatvideo
    	fi
    	if [[ $computer_name == *"002" ]]
	        then 
        	    jamf policy -trigger dep-neatvideo
    	fi
    	if [[ $computer_name == *"003" ]]
	        then 
        	    jamf policy -trigger dep-neatvideo
    	fi
    	if [[ $computer_name == *"010" ]]
	        then 
        	    jamf policy -trigger dep-doremi
    	fi
        jamf policy -trigger dep-epson-10000xl
        jamf policy -trigger dep-epson-24g204
        ;;
    "24G306"*)
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
    "24G307"*)
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
    "24G308"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-blackmagic-4k
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-epson-10000xl
        jamf policy -trigger dep-epson-24g308
        jamf policy -trigger dep-wacom-driver
        ;;
    "12G"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-dragonframe3
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-wacom-driver
        ;;
    "AD209"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-mboxdrivers
        jamf policy -trigger dep-avid-protools
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-wacom-driver
        ;;
    "AMDC203"*)
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        ;;
    "AMDC204"*)
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        ;;
    "AMDC304"*)
        jamf policy -trigger dep-android-studio
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-arduino
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-axurerp
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-intelhaxm
        jamf policy -trigger dep-foundry
        jamf policy -trigger dep-gopro
        jamf policy -trigger dep-klynt
        jamf policy -trigger dep-netbeans
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-resolume-dxv
        jamf policy -trigger dep-rhino-lab
        jamf policy -trigger dep-skitch
        jamf policy -trigger DEP-SublimeText
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-virb
        jamf policy -trigger dep-wacom-driver
        jamf policy -trigger dep-xamarin
        jamf policy -trigger dep-xcode
        jamf policy -trigger dep-monoframework
        ;;
        
    "AMDC507"*)
        jamf policy -trigger dep-snare
        jamf policy -trigger dep-cuda
        jamf policy -trigger dep-filezilla
        jamf policy -trigger dep-appleKeynote
        
    "AMDC601"*)
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-epson-10000xl
        jamf policy -trigger dep-epson-amdc601
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        ;;
    "AMDC602"*)
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-epson-10000xl
        jamf policy -trigger dep-epson-amdc602
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        ;;
    "ATC522"*)
        jamf policy -trigger dep-android-studio
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-arduino
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-atc522-soundApps
        jamf policy -trigger dep-axurerp
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-foundry
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-max
        jamf policy -trigger dep-redgiant
        jamf policy -trigger dep-rhino-lab
        jamf policy -trigger dep-unity
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        jamf policy -trigger dep-xamarin
        jamf policy -trigger dep-xcode
        jamf policy -trigger dep-monoframework
        ;;
    "ATC525"*)
        jamf policy -trigger dep-android-studio
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-arduino
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-axurerp
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-foundry
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-rhino-lab
        jamf policy -trigger dep-spss-desktops
        jamf policy -trigger dep-unity
        jamf policy -trigger dep-wacom-driver
        jamf policy -trigger dep-xamarin
        jamf policy -trigger dep-xcode
        jamf policy -trigger dep-monoframework
        ;;
    "ATC526"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-epson-10000xl
        jamf policy -trigger dep-epson-atc526
        jamf policy -trigger dep-spss-desktops
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        ;;
    "ATC527"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-spss-desktops
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        ;;
    "ATC601B"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-axurerp
        jamf policy -trigger dep-davinci-resolve
        if [[ $computer_suffix> 000 && $computer_suffix< 020 ]] || [[ $computer_suffix = AV ]]
            then
                 jamf policy -trigger dep-sportscode # Includes preferences, Manual activation
                 jamf policy -trigger dep-coda # Manual activation
            else
                    echo "**Computer not in range for SportsCode**" >> /var/log/jamf.log
        fi
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        ;;
    "ATC601C"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        ;;
    "ATC620"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-intelhaxm
        jamf policy -trigger dep-android-studio
        jamf policy -trigger dep-netbeans
        jamf policy -trigger dep-xcode
        jamf policy -trigger dep-xamarin
        jamf policy -trigger dep-skitch
        jamf policy -trigger DEP-SublimeText
        jamf policy -trigger dep-monoframework
        ;;
    "ATC621"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-intelhaxm
        jamf policy -trigger dep-android-studio
        jamf policy -trigger dep-netbeans
        jamf policy -trigger dep-xcode
        jamf policy -trigger dep-xamarin
        jamf policy -trigger dep-skitch
        jamf policy -trigger DEP-SublimeText
        jamf policy -trigger dep-monoframework
        ;;
    "EN123"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-epson-10000xl
        jamf policy -trigger dep-epson-en123
        #jamf policy -trigger dep-finaldraft9
        jamf policy -trigger dep-ftv100007
        jamf policy -trigger dep-gopro
        jamf policy -trigger dep-klynt
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-redgiant
        jamf policy -trigger dep-resolume-dxv
        jamf policy -trigger dep-secretlife
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-virb
        ;;
    "EN301"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-intelhaxm
        jamf policy -trigger dep-android-studio
        jamf policy -trigger dep-mathematica
        jamf policy -trigger dep-matLab
        jamf policy -trigger dep-netbeans
        jamf policy -trigger dep-spss-desktops
        jamf policy -trigger dep-xcode
        jamf policy -trigger dep-skitch
        jamf policy -trigger dep-xamarin        
        jamf policy -trigger DEP-SublimeText
        jamf policy -trigger dep-monoframework
        ;;
    "IS103"*)
        #jamf policy -trigger dep-skype
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        if [[ $computer_name == *"003" ]]
	        then 
        	    jamf policy -trigger dep-epson-usb-v700
    	fi
    	if [[ $computer_name == *"004" ]]
	        then 
        	    jamf policy -trigger dep-epson-usb-11000XL
        	    #jamf policy -trigger dep-silverfast
    	fi
    	if [[ $computer_name == *"006" ]]
	       then 
        	    jamf policy -trigger dep-epson-artisan1430
    	fi
        ;;
    "IS106"*)
        #jamf policy -trigger dep-skype
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        ;;
    "LB1-MAC"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-intelhaxm
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-android-studio
        jamf policy -trigger dep-mathematica
        jamf policy -trigger dep-matLab
        jamf policy -trigger dep-netbeans
        jamf policy -trigger dep-xamarin
        jamf policy -trigger dep-skitch
        if [[ $computer_suffix> 008 && $computer_suffix< 015 ]]
            then
                 jamf policy -trigger dep-avid-mediacomposer
                 jamf policy -trigger dep-davinci-resolve
            else
                    echo "**Computer not in range**" >> /var/log/jamf.log
        fi
        jamf policy -trigger dep-spss-desktops
        jamf policy -trigger dep-wacom-driver
        jamf policy -trigger dep-xcode
        jamf policy -trigger DEP-SublimeText
        jamf policy -trigger dep-monoframework
        ;;
    "LB2-MAC"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-intelhaxm
        jamf policy -trigger dep-android-studio
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-matLab
        jamf policy -trigger dep-mathematica
        jamf policy -trigger dep-netbeans
        jamf policy -trigger dep-spss-desktops
        jamf policy -trigger dep-wacom-driver
        jamf policy -trigger dep-xcode
        jamf policy -trigger dep-xamarin
        jamf policy -trigger dep-skitch        
        jamf policy -trigger DEP-SublimeText
        jamf policy -trigger dep-monoframework
        ;;
    "TB214"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-blackmagic-fusion
        jamf policy -trigger dep-hp-printer-drivers
        jamf policy -trigger dep-rhino-lab
        jamf policy -trigger dep-wacom-driver
        if [[ $computer_name == *"AV" ]]
	    then 
        	jamf policy -trigger dep-epson-v500
    	fi
        ;;
    "TB222"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-rhino-lab
        jamf policy -trigger dep-hp-printer-drivers
        if [[ $computer_name == *"002" ]]
	        then 
        	    jamf policy -trigger dep-epson-4490
    	fi
    	if [[ $computer_name == *"001" ]]
	        then 
        	    jamf policy -trigger dep-dragonframe4
    	fi
    	if [[ $computer_name == *"010" ]]
	        then 
        	    jamf policy -trigger dep-dragonframe4
    	fi
    	if [[ $computer_name == *"024" ]]
	        then 
        	    jamf policy -trigger dep-dragonframe4
    	fi
        ;;
    "TB306"*)
        jamf policy -trigger dep-rhino-lab
        if [[ $computer_name == *"3DPRINT1" ]]
	        then 
        	    jamf policy -trigger dep-dragonframe4
    	fi
    	if [[ $computer_name == *"3DPRINT2" ]]
	        then 
        	    jamf policy -trigger dep-dragonframe4
    	fi
    	if [[ $computer_name == *"3DPRINT3" ]]
	        then 
        	    jamf policy -trigger dep-dragonframe4
    	fi
        ;;
    "TD203"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-epson-10000xl
        jamf policy -trigger dep-epson-td203
        jamf policy -trigger dep-hp-printer-drivers
        jamf policy -trigger dep-wacom-driver
        ;;
    "TD207"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-epson-10000xl
        jamf policy -trigger dep-epson-td207
        jamf policy -trigger dep-hp-printer-drivers
        jamf policy -trigger dep-wacom-driver
        #jamf map printer
        ;;
    "TD209"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-epson-10000xl
        jamf policy -trigger dep-epson-td209
        jamf policy -trigger dep-hp-printer-drivers
        jamf policy -trigger dep-wacom-driver
        ;;
    "TD210"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-epson-10000xl
        jamf policy -trigger dep-epson-td210
        jamf policy -trigger dep-hp-printer-drivers
        jamf policy -trigger dep-wacom-driver
        ;;
    "TD218"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-hp-printer-drivers 
        jamf policy -trigger dep-wacom-driver
        if [[ $computer_name == *"AV" ]]
	    then 
        	jamf policy -trigger dep-epson-V500
    	fi
        ;;
    *)
        echo "- Computer is not in a lab. Nothing to execute!" >> /var/log/jamf.log
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
    "24G102-AV")
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
    "24G103-AV")
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-mediacomposer
        #jamf policy -trigger dep-clarity
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-utc-client
        ;;
    "24G302-001")
        #OnLine Editing Suite
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-blackmagic-4k
        jamf policy -trigger dep-davinci-resolve-studio
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-neatvideo
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-redgiant
        jamf policy -trigger dep-utc-client
        ;;
    "24G303-001")
        #DaVinci Colour Grading Suite
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-blackmagic-4k
        jamf policy -trigger dep-davinci-resolve-studio
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-neatvideo
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-redgiant
        jamf policy -trigger dep-utc-client
        ;;
    "AD151A-AEDIT-1")
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        ;;
    "AD151A-AEDIT-2")
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        ;;
    "AD151A-VEDIT-1")
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-blackmagic-4k
        jamf policy -trigger dep-davinci-resolve
        ;;
    "AD151A-VEDIT-2")
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-blackmagic-4k
        jamf policy -trigger dep-davinci-resolve
        ;;
    "AD151B-AEDIT")
        jamf policy -trigger dep-avid-protools
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-fireface
        ;;
    "AD151D-VEDIT")
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-blackmagic-4k
        jamf policy -trigger dep-davinci-resolve-studio
        ;;
    "AMDC301-AV")
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-adobe-encore
        jamf policy -trigger dep-appleGarageBand
        jamf policy -trigger dep-avid-mediacomposer
        jamf policy -trigger dep-davinci-resolve
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-redcine
        ;;
    "TB103-AV"*)
        jamf policy -trigger dep-autodesk
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-wacom-driver
        ;;
    "AMDC622-MACTEST")
        jamf policy -trigger dep-adobe-encore
        #jamf policy -trigger dep-arduino
        jamf policy -trigger dep-appleGarageBand
        #jamf policy -trigger dep-atc522-soundApps
        jamf policy -trigger dep-autodesk
        #jamf policy -trigger dep-avid-protools
        jamf policy -trigger dep-avid-mediacomposer
        #jamf policy -trigger dep-axurerp
        #jamf policy -trigger dep-blackmagic-4k
        jamf policy -trigger dep-blackmagic-fusion
        #jamf policy -trigger dep-dragonframe3
        #jamf policy -trigger dep-max
        jamf policy -trigger dep-celtx
        jamf policy -trigger dep-dcpomatic
        jamf policy -trigger dep-davinci-resolve
        #jamf policy -trigger dep-finaldraft9
        jamf policy -trigger dep-ftv100007
        jamf policy -trigger dep-gopro
        jamf policy -trigger dep-handbrake
        jamf policy -trigger dep-mpegstream
        jamf policy -trigger dep-redcine
        jamf policy -trigger dep-redgiant
        #jamf policy -trigger dep-resolume-dxv
        jamf policy -trigger dep-secretlife
        #jamf policy -trigger dep-spss-desktops
        #jamf policy -trigger dep-foundry
        #jamf policy -trigger dep-unity
        jamf policy -trigger dep-utc-client
        jamf policy -trigger dep-virb
        jamf policy -trigger dep-wacom-driver
        #jamf policy -trigger dep-xamarin
        #jamf policy -trigger dep-xcode
        #jamf policy -trigger dep-monoframework
        ;;
    "PeterTestMac"*)
        #jamf policy -trigger dep-adobe-encore
        #jamf policy -trigger dep-arduino
        #jamf policy -trigger dep-appleGarageBand
        #jamf policy -trigger dep-atc522-soundApps
        #jamf policy -trigger dep-autodesk
        #jamf policy -trigger dep-avid-protools
        #jamf policy -trigger dep-avid-mediacomposer
        #jamf policy -trigger dep-axurerp
        #jamf policy -trigger dep-blackmagic-4k
        #jamf policy -trigger dep-blackmagic-fusion
        #jamf policy -trigger dep-dragonframe3
        #jamf policy -trigger dep-max
        #jamf policy -trigger dep-celtx
        #jamf policy -trigger dep-dcpomatic
        #jamf policy -trigger dep-davinci-resolve
        #jamf policy -trigger dep-finaldraft9
        #jamf policy -trigger dep-ftv100007
        #jamf policy -trigger dep-gopro
        #jamf policy -trigger dep-handbrake
        #jamf policy -trigger dep-mpegstream
        #jamf policy -trigger dep-redcine
        #jamf policy -trigger dep-redgiant
        #jamf policy -trigger dep-resolume-dxv
        #jamf policy -trigger dep-secretlife
        #jamf policy -trigger dep-spss-desktops
        #jamf policy -trigger dep-foundry
        #jamf policy -trigger dep-unity
        #jamf policy -trigger dep-utc-client
        #jamf policy -trigger dep-virb
        #jamf policy -trigger dep-wacom-driver
        #jamf policy -trigger dep-xamarin
        #jamf policy -trigger dep-xcode
        #jamf policy -trigger dep-monoframework
        ;;
    *)
        echo "- Computer is not as edit suite. Nothing to execute!" >> /var/log/jamf.log
        ;;
esac

############################################################################################
echo "** Completed DEP - Install Lab Specific Software and Preferences **" >> /var/log/jamf.log

exit 0
