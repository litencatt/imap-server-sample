Build dovecot IMAP server recipe.

## Usage

```
$ git clone git@github.com:litencatt/imap_server.git
$ cd /path/to/imap_server

$ vagrant up
$ bundle install
$ bundle exec itamae ssh --host imap nodes/imap-server-development.yml entry.rb
```
