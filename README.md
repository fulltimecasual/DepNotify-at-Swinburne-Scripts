# DepNotify-at-Swinburne-Scripts
These are the scripts that power DEPNotify at Swinburne Uni

The main work is done by the 

__1. DepNotify With User Input Script__

It is mainly stolen from; https://github.com/neilmartin83 with a few extra tweaks from https://github.com/jmahlman 

This script is set to enrolment. It installs DepNotify, a depnotify local account set to autologin with 

https://github.com/gregneagle/pycreateuserpkg

And then reboots, and logs in, to kick off __DepNotify__. (Will repalce this as soon as Nolotify works over login)

Because the first script sets a __Computer Role__ (either Staff, Labs, Shared or Loaner) it moves into a smartgroup, and then runs either the __Staff Script:

https://github.com/fulltimecasual/DepNotify-at-Swinburne-Scripts/blob/master/2.%20DEP%20-%20Complete%20Staff%20Enrolment%202019.sh

Or the __Labs Script: 

https://github.com/fulltimecasual/DepNotify-at-Swinburne-Scripts/blob/master/3.%20DEP%20-%20Install%20SOE%20Software%20Student%20Labs%202019.sh

If staff, it runs just that one script, that then moves it to Enrolment complete Smart Group, once Sophos is installed. 

Lab Macs move on to Script 4, and install based on the room they're in. Then then move to Script 5 which installs Sophos, and completes enrolment. 
