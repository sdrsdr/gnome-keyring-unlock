CFLAGS +=  $(shell pkg-config --cflags gtk+-3.0) $(shell pkg-config --cflags libsecret-1) -Ilibgnome-keyring/library/
GDK_LIBS +=$(shell pkg-config --libs gtk+-3.0) $(shell pkg-config --libs libsecret-1)

default: gnome-keyring-unlock

main.o: libgnome-keyring/library/.libs/libgnome-keyring.a

gnome-keyring-unlock: main.o libgnome-keyring/library/.libs/libgnome-keyring.a $(GDK_LIBS) /lib/x86_64-linux-gnu/libdbus-1.so.3 /usr/lib/x86_64-linux-gnu/libgcrypt.so.20
	$(CC) -o $@  $^ 
	strip -s $@

clean: 
	rm -f *.o gnome-keyring-unlock

distclean: clean
	rm -rf libgnome-keyring

libgnome-keyring/library/.libs/libgnome-keyring.a:
	./build_libgnome-keyring.sh

.PHONY: clean distclean
.ONESHELL:
