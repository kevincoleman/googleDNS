#!/bin/sh

DIR="$(dirname "$(readlink -f "$0")")"
LOGFILE="$DIR/response.log"

if test -f ~/.config/googleDNS ; then
    . ~/.config/googleDNS
elif test -f "$DIR/config" ; then
    . "$DIR/config"
fi

if test -z getIP ; then
    getIP="dig +short myip.opendns.com @resolver1.opendns.com"
fi

externalIp=$($getIP)

touch "$LOGFILE"
echo url="https://$username:$password@domains.google.com/nic/update?hostname=$domainToUpdate&myip=$externalIp" | curl -k -o "$LOGFILE" -K -
