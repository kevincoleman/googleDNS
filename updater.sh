externalIp=$(curl icanhazip.com)
echo url="https://username:password@domains.google.com/nic/update?hostname=domainToUpdate.com&myip=$externalIp" | curl -k -o ~/googleDNS/response.log -K -
