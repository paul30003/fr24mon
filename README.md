# fr24mon

Raspberry Pi FR24 Feeder logger

This script will log the fr24 feeder status, CPU temperature and uptime to a Google spreadsheet.


#Prerequisites.

Google account, as the log is saved to a spreadsheet in your Google drive. 

IFTTT account.  https://ifttt.com/
 
Connect the Maker and Google drive channels to your IFTTT account.
(See ifttt.com for more information)


#Usage

cd into the fr24mon directory and edit the script with your IFTTT secret key and trigger event name.  make the file executable with:

chmod +x fr24mon.sh

then simply run it with:

./fr24mon.sh

Congratulations! You've fired the 'event_name' event.

^^^^ If you receive this message and an entry is added to your spread sheet, you can go ahead and add it to your cron to run at a predetermined time.

To have this script run every 30 minutes, add this you your crontab.  You may need to change the path, if you have it somewhere else.

crontab -e

0,30 * * * * /home/pi/fr24mon/fr24mon.sh >/dev/null 2>&1
