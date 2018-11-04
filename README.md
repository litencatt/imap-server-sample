Build dovecot IMAP test server.
NOT for production.

## Usage
### Setup

```
$ git clone git@github.com:litencatt/imap_server.git
$ cd /path/to/imap_server

$ vagrant up

$ vagrant ssh-config >> ~/.ssh/config

$ bundle install --path vendor/bundle --jobs=4
$ bundle exec itamae ssh --host imap -y nodes/imap-server-development.yml entry.rb
```

### IMAP connection check
```
$ telnet 192.168.33.10 143
Trying 192.168.33.10...
Connected to consul-server.local.
Escape character is '^]'.
* OK [CAPABILITY IMAP4rev1 LITERAL+ SASL-IR LOGIN-REFERRALS ID ENABLE IDLE AUTH=PLAIN] Dovecot ready.

a login vagrant password
a OK [CAPABILITY IMAP4rev1 LITERAL+ SASL-IR LOGIN-REFERRALS ID ENABLE IDLE SORT SORT=DISPLAY THREAD=REFERENCES THREAD=REFS THREAD=ORDEREDSUBJECT MULTIAPPEND URL-PARTIAL CATENATE UNSELECT CHILDREN NAMESPACE UIDPLUS LIST-EXTENDED I18NLEVEL=1 CONDSTORE QRESYNC ESEARCH ESORT SEARCHRES WITHIN CONTEXT=SEARCH LIST-STATUS SPECIAL-USE BINARY MOVE] Logged in

a logout
* BYE Logging out
a OK Logout completed.
Connection closed by foreign host.
```
