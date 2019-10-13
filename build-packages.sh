#! /bin/sh

# Delete the previous packages
rm -fv *.deb

# Loop through the modules
for module in mylinux*; do
	# Get the package version number
	version=$(cat $module/DEBIAN/control | grep Version | awk '{print $2}')
	# Build the package
	fakeroot dpkg-deb --build $module
	# Move the package with its proper version number to the mdebian-packages folder
	mv -fv $module.deb ${module}_${version}.deb
done
