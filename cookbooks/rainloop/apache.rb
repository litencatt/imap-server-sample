remote_file "/etc/httpd/conf.d/rainloop.conf" do
  mode '0644'
  owner 'root'
  group 'root'
  source "files/rainloop.conf"
  notifies :restart, 'service[httpd]'
end
