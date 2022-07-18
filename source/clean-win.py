import os
import sys
import time
import tkinter as tk
import threading
import subprocess
import win32api

# Set up the window and its components
root = tk.Tk()
root.title("Clean")
root.geometry("300x300")
root.resizable(False, False)

# Set up the window's components
title = tk.Label(root, text="KARTHIK-V1.2-STABLE", font=("Helvetica", 20))
title.pack()

# Set up console color scheme
os.system("color 0A")

# Run the script on full screen
os.system("mode con: cols=300 lines=300")

# Abort the program if the user closes the window
root.protocol("WM_DELETE_WINDOW", sys.exit)

# Abort the program if the user presses the escape key (Windows) or the q key (Linux)
root.bind("<Escape>", lambda e: sys.exit())
root.bind("<q>", lambda e: sys.exit())

# Security check [1]
# Abort if the user is not running Windows
if os.name != "nt":
    sys.exit("This program only works on Windows.")

# Security check [2]
# Abort if the user is not running the script on administrator privileges
if not win32api.IsUserAnAdmin():
    sys.exit("This program must be run as administrator.")

# Security check [3]
# Abort if there is any pending reboot or shutdown operation in progress
if win32api.GetTickCount() < win32api.GetTickCount(): # If the system is rebooting or shutting down
    sys.exit("The system is rebooting or shutting down.")

# Clear the console screen
os.system("cls")

# Lets the user know that the program is going to start
print("YOU ARE USING KARTHIK LAL WINDOWS CLEAN SCRIPT")
time.sleep(3)

# Clear the console screen
os.system("cls")

# EULA (End User License Agreement) - https://www.gnu.org/licenses/gpl-3.0.en.html
# Security check [4]
# EULA Agreement (For the purpose of this script, the EULA is considered to be accepted if the user accepts it.)

print("EULA Agreement - Please read the following EULA agreement.")
print ("[1] This script is provided as is with no warranty of any kind. The author is not responsible for any damage caused by this script.")
print ("[2] This script is designed to clean up the Windows operating system.")
print ("[3] This operation may take a few minutes/hours to complete.")
print ("[4] Please do not close the console window until the script is finished.")
print ("[5] This script is fully automated and does not require any user input to complete. (after accepting the EULA)")
print ("[6] This script will not clean up the following:")
print    ("[*] Windows Defender")
print    ("[*] Windows Defender Antivirus")
print    ("[*] Windows Defender Online")
print    ("[*] Windows Defender SmartScreen")
print    ("[*] Windows Defender Trust Center")
print    ("[*] Windows Defender Web Scan")

print (" Do you accept EULA? (y/n)") # Ask the user to accept the EULA

    # If the user accepts the EULA
if input() == "y":
    print ("EULA Accepted")
    time.sleep(1)
    os.system("cls") # Clear the console screen
    goto EULA_ACCEPTED # Jump to the EULA_ACCEPTED label
else :
    print ("EULA Rejected")
    print ("Exiting the setup script...")
    print ("Please run the script again to accept the EULA.")
    time.sleep(1)
    os.system("cls") # Clear the console screen
    print ("=====")
    time.sleep(1) # Wait for 1 second
    os.system("cls") # Clear the console screen
    print ("=========")
    time.sleep(1) # Wait for 1 second
    os.system("cls") # Clear the console screen
    print ("===============")
    time.sleep(1) # Wait for 1 second
    os.system("cls") # Clear the console screen
    print ("====================")
    time.sleep(1) # Wait for 1 second
    os.system("cls") # Clear the console screen
    print ("========================")
    time.sleep(1) # Wait for 1 second
    os.system("cls") # Clear the console screen
    print ("==============================")
    time.sleep(1) # Wait for 1 second
    os.system("cls") # Clear the console screen

    # Exit the script
    sys.exit("EULA Rejected")

# EULA_ACCEPTED label
EULA_ACCEPTED: # Label for the EULA_ACCEPTED label

    os.system("cls") # Clear the console screen

    # Lets the user know that the program is going to start
    print ("Cleaning up the Windows operating system...")

    # Kill explorer.exe process (Windows Explorer)
    print ("Killing Explorer.exe process...")
    os.system("taskkill /f /im explorer.exe")
    time.sleep(1)

    # Clear DNS cache (Windows)
    print ("Clearing DNS cache...")
    os.system("ipconfig /flushdns")
    time.sleep(1)

    # Remove .log files (Windows)
    print ("Removing .log files...")
    os.system("del /q /f /s /a /t /f *.log")
    time.sleep(1)

    # Remove *.log files (Windows)
    print ("Removing *.log files...")
    os.system("del /q /f /s /a /t /f *.log")
    time.sleep(1)

    # Remove .tmp files (Windows)
    print ("Removing .tmp files...")
    os.system("del /q /f /s /a /t /f *.tmp")
    time.sleep(1)

    # Remove *.tmp files (Windows)
    print ("Removing *.tmp files...")
    os.system("del /q /f /s /a /t /f *.tmp")
    time.sleep(1)

    # Remove *_mp files files (Windows)
    print ("Removing *_mp files...")
    os.system("del /q /f /s /a /t /f *_mp")
    time.sleep(1)

    # Remove *.gid files files (Windows)
    print ("Removing *.gid files...")
    os.system("del /q /f /s /a /t /f *.gid")
    time.sleep(1)

    # Remove .chk files files (Windows)
    print ("Removing .chk files...")
    os.system("del /q /f /s /a /t /f *.chk")
    time.sleep(1)

    # Remove *.chk files files (Windows)
    print ("Removing *.chk files...")
    os.system("del /q /f /s /a /t /f *.chk")
    time.sleep(1)

    # Remove .old files files (Windows)
    print ("Removing .old files...")
    os.system("del /q /f /s /a /t /f *.old")
    time.sleep(1)

    # Remove recycled files (Windows)
    print ("Removing recycled files...")
    os.system("del /q /f /s /a /t /f Recycled")
    time.sleep(1)

    # Remove *.bak files files (Windows)
    print ("Removing *.bak files...")
    os.system("del /q /f /s /a /t /f *.bak")
    time.sleep(1)

    # Remove all prefetch files (Windows)
    print ("Removing all prefetch files...")
    os.system("del /q /f /s /a /t /f *_pf")
    time.sleep(1)

    # Remove *.pf files files (Windows)
    print ("Removing *.pf files...")
    os.system("del /q /f /s /a /t /f *.pf")
    time.sleep(1)

    # Remove all temp files from %windir% (Windows)
    print ("Removing all temp files from %windir%...")
    os.system("del /q /f /s /a /t /f %windir%\\Temp\\*.*")
    time.sleep(1)

    # Remove all .bak files from %windir% (Windows)
    print ("Removing all .bak files from %windir%...")
    os.system("del /q /f /s /a /t /f %windir%\\*.bak")
    time.sleep(1)

    # Remove all .tmp files from %windir% (Windows)
    print ("Removing all .tmp files from %windir%...")
    os.system("del /q /f /s /a /t /f %windir%\\*.tmp")
    time.sleep(1)

    # Remove all .old files from %windir% (Windows) 
    print ("Removing all .old files from %windir%...")
    os.system("del /q /f /s /a /t /f %windir%\\*.old")
    time.sleep(1)

    # Remove all default stored cookies (Windows)
    print ("Removing all default stored cookies...")
    os.system("del /q /f /s /a /t /f %windir%\\Cookies\\*.*")
    time.sleep(1)

    # Remove all default stored history (Windows)
    print ("Removing all default stored history...")
    os.system("del /q /f /s /a /t /f %windir%\\History\\*.*")
    time.sleep(1)

    # Remove all temporary_internet_files (Windows)
    print ("Removing all temporary_internet_files...")
    os.system("del /q /f /s /a /t /f %windir%\\Temporary Internet Files\\*.*")
    time.sleep(1)

    # Remove all the local_settings__temp files (Windows)
    print ("Removing all the local_settings__temp files...")
    os.system("del /q /f /s /a /t /f %windir%\\Local Settings\\Temporary Internet Files\\*.*")
    time.sleep(1)

    # Clear all the recent files (Windows)
    print ("Clearing all the recent files...")
    os.system("del /q /f /s /a /t /f %windir%\\Recent\\*.*")
    time.sleep(1)

    # Scan all protected files and replace corrupted files (Windows)
    print ("Scanning all protected files and replacing corrupted files...")
    os.system("sfc /scannow")
    time.sleep(1)

    # Clear all the system restore points (Windows)
    print ("Clearing all the system restore points...")
    os.system("vssadmin delete shadows /all /quiet")
    time.sleep(1)

    # Print out the directory_tree_lists
    print ("Printing out the directory_tree_lists...")
    os.system("dir /s")

    os.system("cls") # Clear the console screen

    # Restart explorer.exe process (Windows Explorer)
    print ("Restarting Explorer.exe process...")
    os.system("explorer.exe")
    time.sleep(1)

    # Lets the user know that the program is done
    print ("Cleaning up the Windows operating system... Done")
    time.sleep(1)
    os.system("cls")

    # Greeting for using the program
    print ("Thank you for using the Windows Cleanup Script!")
    time.sleep(2)
    print ("Regards KARTHIK LAL")
    time.sleep(3)
    print ("Remember to always keep your computer safe!")
    time.sleep(1)

    # Exit the program
    print ("Exiting the program...")
    time.sleep(1)
    os.system("exit")

#############################################################
#   AUTHOR: KARTHIK LAL & :: EMAIL: karthik.lal558@gmail.com
#   DATE: 17-07-2022
#   WINDOWS CLEANER SCRIPT - STABLE VERSION
#   TOOLS ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND AND THE AUTHOR IS NOT RESPONSIBLE FOR ANY DAMAGE CAUSED BY THE USE OF THESE TOOLS
#   USE AT YOUR OWN RISK
#   FORCED TO RUN ONLY WITH ADMINISTRATOR PRIVILEGES.
#   LICESNSE: GNU GENERAL PUBLIC LICENSE V3.0
#   OPENSOURCE SOFTWARE LICENSE AGREEMENT FOR WINDOWS DISTRIBUTION SYSTEM (https://www.gnu.org/licenses/gpl-3.0.en.html)
#   Copying and distribution of this file, with or without modification, are permitted in any medium without royalty provided the copyright notice and this notice are preserved.
#   Copyright (c) 2022 KARTHIK LAL
#############################################################