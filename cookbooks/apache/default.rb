%w(
  httpd
  httpd-devel
  mod_ssl
).each { |pkg| package pkg }

service "httpd" do
  action [:start, :enable]
end
