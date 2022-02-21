This repos aim to provide the initial required security hardening on a new Debian-like systems

We use an ansible-playbook, it contains two roles as bellow

1. server_hardening
    * Update & upgrade
    * Create a sysadmin user
    * Document system specifications
    * Backup existing ufw rules
    * Set up ufw desired config
    * Transfer sysadmin scripts to the server
    * Add hardened SSH config
    * Install fail2ban
    * Setup a cronjob for local backup
    * Setup a cronjob for remote backup
    
2. rkhunter [from this repo](https://github.com/maxlareo/ansible-rkhunter)
    * Install rkhunter

## Usage

clone the project, adjust the inventories/prod_server_1.yml

to adjust firewall config go to ./roles/server_hardening/tasks/scripts/server_firewall_rules.sh

Make sure the configured user for backup can connect through ssh passwordless to backup server, you may have to allow password authentication on the backup server if it's disabled (go to /etc/ssh/ssd_config and make sure that this is set  : ``` PasswordAuthentication yes ``` )


``` ansible-playbook -i inventories/hosts site.yml ```

## Important
If any ssh keys exist on the backup server, for the configured user, they will be overrided.