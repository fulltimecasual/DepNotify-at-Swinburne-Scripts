#!/bin/sh

##########################################################################################
#
# Created by: Steve Valle
#
# Updated by: Peter Wells
# All computers enrolled into Casper using Apple DEP will be required to run this script.
# This script triggers policies which will configure the OS with SOE related settings.
##########################################################################################

##########################################################################################
# Run policy to install SOE Customisation Scripts
# 	• Disable Apple iCloud and Diagnostics
# 	• Display HostInfo
# 	• Disable App Warning
# 	• Disable Safari Welcome Page v9.0
# 	• Disable Software Updates
# 	• Enable RemoteManagement
# 	• Login Screen Show Name Password
# 	• Set Display Sleep 5min
# 	• Set Internal Apple Software Update Server
# 	• Set Time Server & Time Zone
##########################################################################################

jamf policy -trigger dep-scripts
echo "dep-scripts policy completed"



##########################################################################################
# Run policy to install SOE Customisation Packages
# 	• cocoaDialog v3.0-beta7
# 	• Dockutil v2.0.3
# 	• SOE Desktop Image 5K v4.0 for DEP
#   • Staff and Student Network Drives App
# 	• Apple Mouse Settings v2.0
# 	• Disable iTunes Popups
# 	• Enable ScreenLock After ScreenSaver
# 	• SOE Finder Preferences
# 	• SOE Login Screen Background for macOS Sierra v1.0
# 	• SOE Safari Preferences v3
# 	• Staff SOE Default Dock
#	• Fuji Xerox Printer Drivers v3.1
# 	• Fuji Xerox PS Plug-in Installer
##########################################################################################

#Commenting out packages and policies to replace with Configuration Profiles
#jamf policy -trigger dep-packages-2019
#echo "dep-packages policy completed"

#jamf policy -trigger dep-staffPackages
#echo "dep-staffPackages policy completed"



##########################################################################################
# Run policy to install Printers & Printer Drivers
#	• Staff Printer 
##########################################################################################

jamf policy -trigger dep-staffPrinter
echo "dep-staffPrinter policy completed"



##########################################################################################
# Run policy to install Base Applications
##########################################################################################

jamf policy -trigger dep-webBrowsers
echo "dep-webBrowsers policy completed"

#jamf policy -trigger dep-flash
#echo "dep-flash policy completed"

#jamf policy -trigger dep-silverlight
#echo "dep-silverlight policy completed"

#jamf policy -trigger dep-shockwave
#echo "dep-shockwave policy completed"

#jamf policy -trigger dep-java
#echo "dep-java policy completed"

jamf policy -trigger dep-IPinMenuBar
echo "dep-IPinMenuBar policy completed"

jamf policy -trigger dep-adobeAcrobat
echo "dep-adobeAcrobat policy completed"

jamf policy -trigger dep-office2019
echo "dep-office2016 policy completed"

#jamf policy -trigger dep-stuffItExpander
#echo "dep-stuffItExpander policy completed"

jamf policy -trigger dep-vlc
echo "dep-vlc policy completed"

jamf policy -trigger dep-adobe-staff
echo "dep-adobe-staff policy completed"

jamf policy -trigger dep-K2Client
echo "dep-K2Client policy completed"

##########################################################################################
# Install Solstice and Vivi
##########################################################################################


    jamf policy -trigger dep-solstice
    echo "dep-solstice policy completed"


##########################################################################################
# Install Sophos
##########################################################################################

jamf policy -trigger dep-sophos
echo "dep-sophos policy completed"



##########################################################################################
# Add Staff SOE Dock
##########################################################################################

#jamf policy -trigger dep-staffDock REPLACE WITH CONFIG
#echo "dep-staffDock policy completed"

##################################################################################
# Application Installation Completed
##################################################################################


echo "Installation of Base SOE Applications Complete"



##################################################################################
# Move servicedesk user folder
##################################################################################

#jamf policy -trigger dep-moveHomeFolder
#echo "dep-moveHomeFolder policy completed"


##########################################################################################
# Recon
##########################################################################################

jamf recon

##################################################################################
# Enrollment Completed
##################################################################################


echo "DEP Enrollment Complete"


exit 0
