%w(
  httpd
  httpd-devel
  mod_ssl
).each { |pkg| package pkg }

service "httpd" do
  action [:start, :enable]
end

remote_file "/etc/httpd/conf.d/rainloop.conf" do
  mode '0644'
  owner 'root'
  group 'root'
  source "files/rainloop.conf"
  notifies :restart, 'service[httpd]'
end
