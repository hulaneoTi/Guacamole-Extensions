# Guacamole-Extensions
A simple way to make your extensions (good to branding)

I use docker compose to make a simple change in default guacamole.

1 - I add one line at the default initialization script, put a call to another script (i don't want to make many changes in the default script); (start.sh)

2 - On this secondary script you can make the changes you want, in this sample i make a "extension builder" (loadExt.sh) because Guacamole only work with .jar extensions, so in this you just need to put your extension folder in /extension and the script will run through all folder inside and make a .jar file for each folder, then it will make a symbolic link in default $GUACAMOLE_EXT (find in start.sh).

Extensions
1 - Your extension need a manifest.json file to work (you can use the guac-manifest.json as example).
