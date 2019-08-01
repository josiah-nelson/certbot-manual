# certbot-manual

This script was made to enable manual DNS renewal for wildcard letsencrypt certificates on unsupported providers. Normally, with DNS-01 verification you must have a supported DNS provider and set up API credentials so certbot can set the TXT record for acme verification. If you don't use a supported provider, you are not able to use certbot's auto-renew feature and have to manually run the certbot script every few months to keep your certificate valid.

This script functions by sending an email to you with the acme verification record produced by letsencrypt during automatic renewal. When you get the email, you simply have to log into your DNS provider and update the TXT record. The script is set to wait 1 hour before checking and verifying the record, but can be changed to any amount of time. 

The script relies on certbot as the letsencrypt client and ssmtp as the email client. 

sudo certbot certonly --manual --preferred-challenges dns --manual-auth-hook /opt/letsencrypt/authenticator.sh --deploy-hook /opt/letsencrypt/deploy.sh --server https://acme-v02.api.letsencrypt.org/directory --email certs@jel.dev --agree-tos -d *.jnel.dev -d jnel.dev
