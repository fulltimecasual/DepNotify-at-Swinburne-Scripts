#!/bin/bash

# $4 = JSS URL
# $5 = JSS account username for API access
# $6 = JSS account password for API access

# Set basic variables
osversion=$(sw_vers -productVersion)
serial=$(ioreg -rd1 -c IOPlatformExpertDevice | awk -F'"' '/IOPlatformSerialNumber/{print $4}')

# Let's not go to sleep 
caffeinate -d -i -m -s -u &
caffeinatepid=$!

# Disable Software Updates during imaging
softwareupdate --schedule off

dockStatus=$(pgrep -x Dock)
while [[ "$dockStatus" == "" ]]; do
	sleep 5
	dockStatus=$(pgrep -x Dock)
done

# Get the currently logged in user's username
loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

# Check for existing Hostname extension attribute in JSS - if it's not there, we'll ask for the name and role, otherwise, automation baby!

eaxml=$(curl "$4":8443/JSSResource/computers/serialnumber/"$serial"/subset/extension_attributes -u "$5":"$6" -H "Accept: text/xml")
jssHostName=$(echo "$eaxml" | xpath '//extension_attribute[name="Hostname"' | awk -F'<value>|</value>' '{print $2}')
jssComputerRole=$(echo "$eaxml" | xpath '//extension_attribute[name="Computer Role"' | awk -F'<value>|</value>' '{print $2}')

if [[ "$jssHostName" == "" ]] || [[ "$jssComputerRole" == "" ]]; then
	sudo -u "$loggedInUser" defaults write menu.nomad.DEPNotify PathToPlistFile /var/tmp/
	sudo -u "$loggedInUser" defaults write menu.nomad.DEPNotify RegisterMainTitle "Let's get started..."
	sudo -u "$loggedInUser" defaults write menu.nomad.DEPNotify RegistrationButtonLabel OK
 	sudo -u "$loggedInUser" defaults write menu.nomad.DEPNotify UITextFieldUpperPlaceholder "HAW12345"
	sudo -u "$loggedInUser" defaults write menu.nomad.DEPNotify UITextFieldUpperLabel "Computer Name"
	sudo -u "$loggedInUser" defaults write menu.nomad.DEPNotify UIPopUpMenuUpper -array "Staff" "Labs" "Shared" "Loaner"
	sudo -u "$loggedInUser" defaults write menu.nomad.DEPNotify UIPopUpMenuUpperLabel "Computer Role"
	echo "Command: ContinueButtonRegister: Continue" >> /var/tmp/depnotify.log
	echo "Command: Image: "/private/var/tmp/swinburne-university-of-technology-logo.png"" >> /var/tmp/depnotify.log
	echo 'Command: MainTitle: Hi there!'  >> /var/tmp/depnotify.log
	echo "Command: MainText: It's time to set up this Mac with the software and settings it needs. Before we continue, please make sure it is plugged into a wired network connection on campus. \n \n If you need any assistance, please contact the Swinburne Service Desk. \n \n Telephone: 9214 5000 \n Email: servicedesk@swin.edu.au"  >> /var/tmp/depnotify.log
	echo "Status: Please set the computer name and role to continue..." >> /var/tmp/depnotify.log
	sudo -u "$loggedInUser" /Applications/Utilities/DEPNotify.app/Contents/MacOS/DEPNotify -jamf -fullScreen &
	sleep 1

	# Wait for the user data to be submitted...
	while [ ! -f /var/tmp/DEPNotify.plist ]; do
		echo "Status: Please set the computer name and role to continue..." >> /var/tmp/depnotify.log
		sleep 5
	done

	# Let's read the user data into some variables...
	computerName=$(/usr/libexec/plistbuddy /var/tmp/DEPNotify.plist -c "print 'Computer Name'")
	computerRole=$(/usr/libexec/plistbuddy /var/tmp/DEPNotify.plist -c "print 'Computer Role'")

	# Update Hostname and Computer Role in JSS
	# Create xml
	cat << EOF > /var/tmp/name.xml
<computer>
    <extension_attributes>
        <extension_attribute>
            <name>Hostname</name>
            <value>$computerName</value>
        </extension_attribute>
    </extension_attributes>
</computer>
EOF
	## Upload the xml file
	/usr/bin/curl -sfku "$5":"$6" "$4":8443/JSSResource/computers/serialnumber/"$serial" -H "Content-type: text/xml" -T /var/tmp/name.xml -X PUT
	# Create xml
	cat << EOF > /var/tmp/role.xml
<computer>
    <extension_attributes>
        <extension_attribute>
            <name>Computer Role</name>
            <value>$computerRole</value>
        </extension_attribute>
    </extension_attributes>
</computer>
EOF
	## Upload the xml file
	/usr/bin/curl -sfku "$5":"$6" "$4":8443/JSSResource/computers/serialnumber/"$serial" -H "Content-type: text/xml" -T /var/tmp/role.xml -X PUT

else
	# Set variables for Computer Name and Role to those from the JSS
	computerName="$jssHostName"
	computerRole="$jssComputerRole"
	# Launch DEPNotify
	echo "Command: Image: "/var/tmp/swinburne-university-of-technology-logo.png"" >> /var/tmp/depnotify.log
	echo "Command: MainTitle: Setting things up..."  >> /var/tmp/depnotify.log
	if [[ $computerRole == "Labs" ]]; then
		echo "Command: MainText: Please wait while we set this Mac up with the software and settings it needs. This may take a few hours. We'll restart automatically when we're finished. \n \n Role: "$computerRole" Mac \n Computer Name: "$computerName" \n macOS Version: "$osversion""  >> /var/tmp/depnotify.log
	else
		echo "Command: MainText: Please wait while we set this Mac up with the software and settings it needs. This may take up to 20 minutes. We'll restart automatically when we're finished. \n \n Role: "$computerRole" Mac \n Computer Name: "$computerName" \n macOS Version: "$osversion""  >> /var/tmp/depnotify.log
	fi
	echo "Status: Please wait..." >> /var/tmp/depnotify.log
	sudo -u "$loggedInUser" /Applications/Utilities/DEPNotify.app/Contents/MacOS/DEPNotify -jamf -fullScreen &	
fi

# Carry on with the setup...

# Change DEPNotify title and text...
echo "Command: MainTitle: Setting things up..."  >> /var/tmp/depnotify.log
if [[ $computerRole == "Labs" ]]; then
	echo "Command: MainText: Please wait while we set this Mac up with the software and settings it needs. This may take a few hours. We'll restart automatically when we're finished. \n \n Role: "$computerRole" Mac \n Computer Name: "$computerName" \n macOS Version: "$osversion""  >> /var/tmp/depnotify.log
else
	echo "Command: MainText: Please wait while we set this Mac up with the software and settings it needs. This may take up to 20 minutes. We'll restart automatically when we're finished. \n \n Role: "$computerRole" Mac \n Computer Name: "$computerName" \n macOS Version: "$osversion""  >> /var/tmp/depnotify.log
fi
echo "Status: Please wait..." >> /var/tmp/depnotify.log

# Time to set the hostname...
echo "Status: Setting computer name" >> /var/tmp/depnotify.log
jamf setComputerName -name "${computerName}"

# Bind to AD
jamf policy -event dep-bindToAD

# Run software deployment policies based on smart group membership
jamf policy -event Deploy

# Finishing up
echo "Command: MainTitle: All done!"  >> /var/tmp/depnotify.log
echo "Command: MainText: This Mac will restart shortly and you'll be able to log in. \n \n If you need any assistance, please contact the Swinburne Service Desk. \n \n Telephone: 9214 5000 \n Email: servicedesk@swin.edu.au"  >> /var/tmp/depnotify.log
echo "Status: Restarting, please wait..." >> /var/tmp/depnotify.log

# Remove DEPNotify and the logs
rm -Rf /Applications/Utilities/DEPNotify.app

# Remove the autologin user password file so it doesn't login again
rm -Rf /etc/kcpassword

#Drop an Enrolment Complete Receipt into Shared User Folder
touch /Users/Shared/.Enrolled

jamf recon

kill "$caffeinatepid"
/sbin/shutdown -r +2 &

# Wait a few seconds
sleep 5
 
exit 0
