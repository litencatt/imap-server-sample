remote_file "/etc/httpd/conf.d/roundcube.conf" do
  mode '0644'
  owner 'root'
  group 'root'
  source "files/roundcube.conf"
  notifies :restart, 'service[httpd]'
end
