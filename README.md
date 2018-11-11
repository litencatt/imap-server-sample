Build dovecot IMAP test server.
NOT for production.

## Usage
### Setup IMAP server

```
$ git clone git@github.com:litencatt/imap_server.git
$ cd /path/to/imap_server

$ vagrant up imap

$ vagrant ssh-config imap >> ~/.ssh/config

$ bundle install --path vendor/bundle --jobs=4
$ bundle exec itamae ssh --host imap -y nodes/imap-server-development.yml entry.rb
```

### Setup Rainloop client
```
$ vagrant up client

$ vagrant ssh-config client >> ~/.ssh/config

$ be itamae ssh --host client -y nodes/client.yml entry.rb
```

### IMAP connection check
- ホストPCからのIMAPサーバ接続確認
- vagrant内から行う場合はIPをlocalhost(127.0.0.1)に変えればOK
- メールデータはなにもないので置く必要あり
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
