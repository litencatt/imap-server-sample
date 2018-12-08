execute "Grant rainloop privirage" do
  user "root"
  not_if "mysql -u root -e 'select user from mysql.user' | grep rainloop"
  command <<-EOL
    mysql -u root -e "create database rainloop;"
    mysql -u root -e "create user rainloop identified by 'passwd';"
    mysql -u root -e "grant all privileges on rainloop.* to rainloop;"
    mysql -u root -e "grant all on rainloop.* to rainloop@'localhost' IDENTIFIED BY 'passwd';"
    mysql -u root -e "FLUSH PRIVILEGES;"
  EOL
end
