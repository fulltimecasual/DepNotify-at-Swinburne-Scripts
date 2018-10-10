# DepNotify-at-Swinburne-Scripts
These are the scripts that power DEPNotify at Swinburne Uni

The main work is done by the 

[DepNotify With User Input Script](https://github.com/fulltimecasual/DepNotify-at-Swinburne-Scripts/blob/master/1.%20DepNotify%20with%20User%20Input.sh)

It is mainly stolen from; https://github.com/neilmartin83 with a few extra tweaks from https://github.com/jmahlman 

This script is set to enrolment. It installs DepNotify, a depnotify local account set to autologin with 

https://github.com/gregneagle/pycreateuserpkg

And then reboots, and logs in, to kick off __DepNotify__. (Will repalce this as soon as Nolotify works over login)

Because the first script sets a __Computer Role__ (either Staff, Labs, Shared or Loaner) it moves into a smartgroup, and then runs either the [Staff Script](https://github.com/fulltimecasual/DepNotify-at-Swinburne-Scripts/blob/master/2.%20DEP%20-%20Complete%20Staff%20Enrolment%202019.sh)


Or the [Labs Script](https://github.com/fulltimecasual/DepNotify-at-Swinburne-Scripts/blob/master/3.%20DEP%20-%20Install%20SOE%20Software%20Student%20Labs%202019.sh)

If staff, it runs just that one script, that then moves it to Enrolment complete Smart Group, once Sophos is installed. 

Lab Macs move on to [Script 4, and install based on the room they're in](https://github.com/fulltimecasual/DepNotify-at-Swinburne-Scripts/blob/master/4.%20DEP%20-%20Install%20Lab%20Specific%20Software%20and%20Preferences%20-%202019.sh). Then then move to [Script 5 which installs Sophos](https://github.com/fulltimecasual/DepNotify-at-Swinburne-Scripts/blob/master/5.%20DEP%20-%20Install%20Sophos%20on%20Labs%202019.sh), and completes enrolment. 
