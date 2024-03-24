#! /usr/bin/expect
# firt to make sure amdgpu driver is not installed.
spawn ./amdgpu_ls.sh
expect {
    -re "amdgpu" {
    	send_user "PLS disable amdgpu module before updating Firmware !!!\n"
  	exit
    }
}
# list the firmware version to see if they are up to date.
spawn ./amdvbflash -i
spawn ./amdvbflash -i >>listfile.txt 2>&1
spawn grep -o "113-D67301V-073" listfile.txt 
expect {
	-re "8"{
         send_user "firmware updated to 8 MI210 cards,reboot to confirm it!!!"
	}
	eof
	{
		#if firmware are not update,do this updating to 073 version
		spawn ./amdvbflash -pa -padevid=740f -fv ../113-D67301V-073
        	send_user "updating 073 firmware to 8 cards wait until it finished!!!!"
	}
}

#interact
#expect eof
