#!/bin/bash
diskutil list disk0
diskutil resizeVolume disk0s2 392G "MS-DOS FAT32" Windows 75g "MS-DOS FAT32" boot 1G "MS-DOS FAT32" lvm 32g
diskutil list disk0
