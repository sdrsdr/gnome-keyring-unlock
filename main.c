
#include <stdio.h>
#include <gtk/gtk.h>

#define GNOME_KEYRING_DEPRECATED
#define GNOME_KEYRING_DEPRECATED_FOR(x)
#include "gnome-keyring.h"

static void activate (GtkApplication* app, gpointer user_data) {
	printf("So far so good..\n");
	gnome_keyring_unlock_sync(NULL,NULL);
	printf("We're done here!\n");
}


int main (int argc, char **argv) {
	printf("Here we go..\n");
	GtkApplication *app;
	int status;

	app = gtk_application_new (NULL, G_APPLICATION_FLAGS_NONE);
	g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
	status = g_application_run (G_APPLICATION (app), argc, argv);
	g_object_unref (app);
	printf("Done..\n");
	return status;
}