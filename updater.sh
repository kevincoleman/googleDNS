externalIp=$(dig +short myip.opendns.com @resolver1.opendns.com)
username=<user>
password=<pass>
domainToUpdate=<your_domains>

echo url="https://$username:$password@domains.google.com/nic/update?hostname=$domainToUpdate&myip=$externalIp" | curl -k -o ./response.log -K -
