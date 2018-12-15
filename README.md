Build dovecot IMAP test server.  
:warning:NOT for production.

## Usage
```
$ git clone git@github.com:litencatt/imap-server-sample.git
$ cd /path/to/imap-server-sample
$ bundle install --path vendor/bundle --jobs=4
```

### Setup IMAP server
```
$ vagrant up imap

$ vagrant ssh-config imap >> ~/.ssh/config

$ bundle exec itamae ssh --host imap -y nodes/imap-server-development.yml entry.rb
```

### Setup Roundcube client
```
$ vagrant up roundcube

$ vagrant ssh-config roundcube >> ~/.ssh/config

$ bundle exec itamae ssh --host roundcube -y nodes/roundcube.yml entry.rb
```

### Setup Rainloop client
```
$ vagrant up rainloop

$ vagrant ssh-config rainloop >> ~/.ssh/config

$ bundle exec itamae ssh --host rainloop -y nodes/rainloop.yml entry.rb
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
