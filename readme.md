# OS X Google Dynamic DNS Updater
A simple shell script to update your Google Domains synthetic record, keeping it in sync with your current external IP address. This script queries a service to get your public IP address, then uses the response to make an API call to Google Domains and perform an update. This package depends on curl (https://github.com/bagder/curl) and cron (comes with OS X). Make sure these dependencies are installed and functional before proceeding.

## Installation

1. Clone this repository to your location of liking. The default assumes it’s in your user directory (`~/googleDNS`), but you can put it wherever is most convenient. Keep in mind that you’ll need to use the path of the location you clone this project into
2. Open `updater.sh` with a text editor
3. On the second line, replace `<user>` with the username from your Google Domains synthetic DNS record
4. On the third line, replace `<pass>` with the password from your Google Domains synthetic DNS record
5. On the fourth line, replace `<your_domains>` with the domain you have set up with Google’s synthetic record
6. If you cloned to a location other than your user folder, make sure to update `~/googleDNS/response.log` to reflect the new path
7. Open Terminal (found in Applications/Utilities/Terminal)
8. Browse to this project’s folder (`cd ~/googleDNS`)
9. Set permissions on updater.sh to make it executable by typing `chmod 700 updater.sh`

Now is a great time to test your script.

## Testing
1. In terminal, type `./updater.sh` to run your script
2. When the script is done running, You should see a result in response.log. If the response says anything about an error, recheck your script inputs
3. If you see `good #.#.#.#` or `nochg #.#.#.#` this means that your script is updating Google Domains’ records properly. Verify this in the Google Domains web interface

Great! Now you’re ready to create a cron job to run this script every 5 minutes.

## Automating
1. In terminal, type `crontab -e` to open an editor for cron (the cron process handles running recurring processes)
2. Copy and paste `*/5 * * * * ~/googleDNS/updater.sh >/dev/null 2>&1` at the bottom of the file. Make sure to update the script path if you changed it from the default location
3. Save the file and exit the editor to start running your recurring task

As long as your computer is running and executing this script, your Google Domains synthetic record should be udpated every 5 minutes. Enjoy!
