echo 'GRUB_CMDLINE_LINUX_DEFAULT="modprobe.blacklist=amdgpu" ' | sudo tee -a /etc/default/grub
sudo update-grub
echo 'updated grub,then rebooting'
sleep 3
sudo reboot
