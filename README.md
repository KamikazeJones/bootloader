# bootloader
Booten von verschiedenen Medien

Mit make das binary 'bootloader' erzeugen

in VirtualBox ein Image erstellt (geht auch mit dd)

dann das Image mounten: 
sudo mount -o loop ~/VirtualBox\ VMs/bootloader/bootloader.img /media/floppy1/

'bootloader' in das Image kopieren mit dd: 
dd if=bootloader of=~/VirtualBox\ VMs/bootloader/bootloader.img
