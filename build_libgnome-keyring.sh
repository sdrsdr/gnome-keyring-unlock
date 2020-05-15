#!/bin/bash
echo I hope you have everyting needed already installed...
git clone https://github.com/GNOME/libgnome-keyring.git
cd libgnome-keyring 
./autogen.sh 
if [ ! -x ./configure ] ; then 
	echo "autogen.sh failed to produce a configure you have missing deps!"
	exit 1
fi

./configure --enable-static --disable-gtk-doc-html --disable-maintainer-mode --enable-vala=no

if [ ! -e ./Makefile ] ; then 
	echo "configure failed to produce a Makefile you have missing deps or something"
	exit 2
fi

exec make 
