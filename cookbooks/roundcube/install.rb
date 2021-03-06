directory "/var/www/roundcube" do
  mode '755'
  owner 'apache'
  group 'apache'
end

execute "download_roundcube_source" do
  user 'root'
  command <<-EOL
    cd /usr/local/src
    wget https://github.com/roundcube/roundcubemail/releases/download/1.3.8/roundcubemail-1.3.8-complete.tar.gz
    tar xzvf roundcubemail-1.3.8-complete.tar.gz
    mv -f roundcubemail-1.3.8/* /var/www/roundcube/.
  EOL
  not_if "test -e /usr/local/src/roundcubemail-1.3.8-complete.tar.gz"
end

execute "change_permission" do
  user 'root'
  command <<-EOL
    cd /var/www/roundcube
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
    chown -R apache:apache /var/www/roundcube
  EOL
end

execute "add_imap_server_to_etc_hosts" do
  user 'root'
  command <<-EOL
    echo "192.168.33.10 hoge.com" >> /etc/hosts
  EOL
  not_if "grep hoge.com /etc/hosts"
end
