Buildroot Project with Custom Packages (edgelab, edgelab-hellolib)

This is a demo repository that provides a Buildroot setup with two custom packages:

edgelab: main application

edgelab-hellolib: library dependency for edgelab

The project includes scripts to simplify package integration and building under Buildroot.
It was built using Qemu.


**Setup Instructions**
1. Copy Packages into Buildroot

Run the provided script to copy your packages into the Buildroot package/ directory:

./scripts/copy-packages.sh /path/to/buildroot


This will:

Copy edgelab/ and edgelab-hellolib/ under buildroot/package/.

2. Update Config.in: add edgelab and edgelab-hellolib

Edit buildroot/package/Config.in and add the following under the "Miscellaneous" menu:

menu "Miscellaneous"
    source "package/edgelab/Config.in"
    source "package/edgelab-hellolib/Config.in"
endmenu

2. Enable Package in Buildroot

Run menuconfig:

cd /path/to/buildroot
make menuconfig


Go to:

Target packages  --->
    Miscellaneous  --->
        [*] edgelab-hellolib


Save and exit.

3. Build the Image

Use the provided script to build the project:

./scripts/build.sh /path/to/buildroot


4. Run in QEMU

Once the image is built, you can test it in QEMU:

./output/images/start-qemu.sh


**Quick Usage Example**

Once your Buildroot image is running:

Login to the shell.

Run the edgelab program:

hello


**Note**

Make sure you have already built a base Buildroot image before adding these packages.

