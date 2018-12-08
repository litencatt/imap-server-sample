execute "grant_roundcube_privirage" do
  user "root"
  not_if "mysql -u root -e 'select user from mysql.user' | grep roundcubemail"
  command <<-EOL
    mysql -u root -e "CREATE DATABASE roundcubemail;"
    mysql -u root -e "GRANT ALL PRIVILEGES ON roundcubemail.* TO vagrant@'localhost' IDENTIFIED BY 'password';"
    mysql -u root -e "FLUSH PRIVILEGES;"
  EOL
end
