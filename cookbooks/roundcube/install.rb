directory "/var/www/roundcube" do
  mode '755'
  owner 'apache'
  group 'apache'
end

ver = '1.3.8'
execute "download_roundcube_source" do
  user 'root'
  command <<-EOL
    cd /usr/local/src
    wget https://github.com/roundcube/roundcubemail/releases/download/#{ver}/roundcubemail-#{ver}-complete.tar.gz
    tar xzvf roundcubemail-#{ver}-complete.tar.gz
    mv -f roundcube/* /var/www/roundcube
  EOL
  not_if "test -e /usr/local/src/roundcubemail-#{var}-complete.tar.gz"
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
