package "http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm" do
  not_if "rpm -qa | grep mysql-community-release-el7-5.noarch"
end

%w(
  mysql
  mysql-devel
  mysql-community-server
  mysql-community-client
).each do |pkg|
  package pkg
end

service "mysqld" do
  action [:start, :enable]
end
