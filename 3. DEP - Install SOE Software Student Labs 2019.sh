#!/bin/sh

##########################################################################################
#
# Created by: Steve Valle
# Date Created: 10/11/16
# 
#
# Updated by: Peter Wells
#
#
#
# All Student Labs will use Apple DEP to enroll into Jamf and install settings and
# applications.
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
# 	• Enable ScreenSaver at Login Window
##########################################################################################

jamf policy -trigger dep-scripts
echo "dep-scripts policy completed"

jamf policy -trigger dep-studentScripts
echo "dep-studentScripts policy completed"

##########################################################################################
# Run policy to install Student Lab Customisation Packages
# 	•  cocoaDialog v3.0-beta7
# 	•  Dockutil v2.0.3
# 	•  SOE Desktop Image 5K v4.0 for DEP
# 	•  Apple Mouse Settings v2.0
# 	•  Disable iTunes Popups
# 	•  Fuji Xerox Printer Drivers v3.1
# 	•  Fuji Xerox PS Plug-in Installer
# 	•  SOE Finder Preferences
# 	•  SOE Login Screen Background for macOS Sierra v1.0
# 	•  SOE Safari Preferences v3
# 	•  Staff and Student Network Drives App
# 	•  DEP Default Dock.dmg
# 	•  Jamf_SystemConfigTrigger
# 	•  Cisco Discovery Protocol Reporter
# 	•  BlueUtil
# 	•  Student Lab ScreenSaver - Image Files
# 	•  Student Lab ScreenSaver - Preference Files
# 	•  Disable Screen Lock after ScreenSaver
# 	•  User Template Keychains Folder

##########################################################################################

jamf policy -trigger dep-packages-2019
echo "dep-packages policy completed"

jamf policy -trigger dep-studentPackages
echo "dep-studentPackages policy completed"

jamf policy -trigger dep-userTemplateFolder
echo "dep-userTemplateFolder policy completed"

##########################################################################################
# Run policy to install Base SOE Applications
##########################################################################################

jamf policy -trigger dep-webBrowsers
echo "dep-webBrowsers policy completed"

jamf policy -trigger dep-flash
echo "dep-flash policy completed"

jamf policy -trigger dep-java
echo "dep-java policy completed"

jamf policy -trigger dep-shockwave
echo "dep-shockwave policy completed"

jamf policy -trigger dep-filezilla
echo "dep-filezilla policy completed"

jamf policy -trigger dep-audacity
echo "dep-audacity policy completed"

jamf policy -trigger dep-snare
echo "dep-snare policy completed"

jamf policy -trigger dep-stuffItExpander
echo "dep-stuffItExpander policy completed"

jamf policy -trigger dep-bbedit
echo "dep-bbedit policy completed"

jamf policy -trigger dep-vlc
echo "dep-vlc policy completed"

jamf policy -trigger dep-IPinMenuBar
echo "dep-IPinMenuBar policy completed"

jamf policy -trigger dep-K2Client
echo "dep-K2Client policy completed"

jamf policy -trigger dep-cuda
echo "dep-cuda policy completed"

jamf policy -trigger dep-office2016
echo "dep-office2016 policy completed"

jamf policy -trigger dep-camtasia
echo "dep-camtasia policy completed"

jamf policy -trigger dep-appleKeynote
echo "dep-appleKeynote policy completed"

jamf policy -trigger dep-adobeAcrobat
echo "dep-adobeAcrobat policy completed"

jamf policy -trigger dep-adobeCC2018Full
echo "dep-adobeCC2018Full policy completed"



##################################################################################
# Application Installation Completed
##################################################################################

echo "**************************************************"
echo "Installation of Base SOE Applications Complete"
echo "**************************************************"


exit 0
