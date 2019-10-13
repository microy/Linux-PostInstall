#! /bin/sh

# Delete the previous packages
rm -fv *.deb

# Loop through the packages
for package in mylinux*; do
	# Build the package
	fakeroot dpkg-deb --build $package
	# Get the package version number
	version=$(cat $package/DEBIAN/control | grep Version | awk '{print $2}')
	# Rename the package with the proper version number
	mv -fv $package.deb ${package}_${version}.deb
done
