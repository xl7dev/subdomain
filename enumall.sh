#!/bin/bash

# Subdomain enumeration script that creates/uses a dynamic resource script for recon-ng.
# only 1 module needs api’s (/api/google_site) find instructions for that on the wiki.
# Or you can comment out that module.
# uses google scraping, bing scraping, baidu scraping, netcraft, and bruteforces to find subdomains.
# by @jhaddix

# input from command-line becomes domain to test
domain=$1

#run as bash enumall.sh paypal.com

#timestamp
stamp=$(date +"%m_%d_%Y")

#create rc file with workspace.timestamp and start enumerating hosts
touch $domain$stamp.resource

echo $domain

echo "workspaces select $domain$stamp" >> $domain$stamp.resource
echo "use recon/domains-hosts/baidu_site" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/bing_domain_web" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/brute_hosts" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/google_site_web" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/links_site" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/fofa_site" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/5118" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/sitedossier" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/alexa_chinaz" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/chaxunla_site" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/netcraft" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/domains-hosts/yahoo_domain" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use recon/hosts-hosts/resolve" >> $domain$stamp.resource
echo "set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "use reporting/csv" >> $domain$stamp.resource
echo "set FILENAME /Users/xl7dev/tools/recon-ng/$domain.csv" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "shell cat /Users/xl7dev/tools/recon-ng/$domain.csv | awk -F '\"' '{print \$2}' > /Users/xl7dev/tools/recon-ng/$domain.txt" >> $domain$stamp.resource
echo "shell rm /Users/xl7dev/tools/recon-ng/$domain.csv" >> $domain$stamp.resource
echo "exit" >> $domain$stamp.resource
sleep 1

# python was giving some weird errors when trying to call python /opt/recon-ng/recon-ng so this workaround worked.

path=$(pwd)
cd /Users/xl7dev/tools/recon-ng
./recon-ng --no-check -r $path/$domain$stamp.resource

# now just run "show hosts" or use a report module in recon-ng prompt
