#!/bin/sh

propogationtime=360

minutes=(($propogationtime/60))

echo "To: notificationemail@domain.com
From: youremail@domain.com
Subject: Time to renew certs for $CERTBOT_DOMAIN

Please add the following TXT record for $CERTBOT_DOMAIN:
_acme-challenge.$CERTBOT_DOMAIN:$CERTBOT_VALIDATION
Another email may follow after $minutes minutes with a second record to add" > /opt/ssmtp/$CERTBOT_DOMAIN.txt

/usr/sbin/ssmtp notificationemail@domain.com < /opt/ssmtp/$CERTBOT_DOMAIN.txt

sleep $propogationtime
