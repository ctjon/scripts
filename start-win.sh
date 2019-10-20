#sudo qemu-system-x86_64 \
qemu-system-x86_64 \
--enable-kvm \
-cpu host \
-smp 2 \
-m 4096 \
-mem-path /dev/hugepages/libvirt/qemu/win10.ram \
-display sdl -vga qxl \
-device qemu-xhci,id=xhci \
-device virtio-tablet,wheel-axis=true \
-soundhw hda \
-netdev user,id=vmnic,smb=/home/chris/Downloads,smb=/export/archive \
-device virtio-net,netdev=vmnic \
-drive file=/usr/share/edk2/ovmf/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
-drive file=$HOME/.config/qemu-windows.nvram,if=pflash,format=raw,unit=1 \
-drive file=/dev/sda1,index=0,media=disk,driver=raw \
-cdrom /usr/share/edk2/ovmf/UefiShell.iso
