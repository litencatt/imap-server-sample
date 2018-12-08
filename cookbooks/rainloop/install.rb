directory "/var/www/rainloop" do
  mode '755'
  owner 'apache'
  group 'apache'
end

execute "DL rainloop source" do
  user 'root'
  command <<-EOL
    cd /usr/local/src
    wget http://repository.rainloop.net/v2/webmail/rainloop-community-latest.zip
    unzip rainloop-community-latest.zip -d rainloop
    mv -f rainloop/* /var/www/rainloop
  EOL
  not_if "test -e /usr/local/src/rainloop-community-latest.zip"
end

execute "Change permission" do
  user 'root'
  command <<-EOL
    cd /var/www/rainloop
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
    chown -R apache:apache /var/www/rainloop
  EOL
end

execute "Add imap server hosts" do
  user 'root'
  command <<-EOL
    echo "192.168.33.10 hoge.com" >> /etc/hosts
  EOL
  not_if "grep hoge.com /etc/hosts"
end
