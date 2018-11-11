package "http://rpms.famillecollet.com/enterprise/remi-release-7.rpm" do
  not_if 'rpm -qa | grep remi-release-7'
end

%w(
  php
  php-devel
  php-mbstring
  php-pdo
  php-gd
  php-xml
  php-mcrypt
  php-mysqlnd
).each do |pkg|
  package pkg do
    options '--enablerepo=remi,remi-php56'
  end
end
