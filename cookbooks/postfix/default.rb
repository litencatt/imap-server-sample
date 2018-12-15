package "postfix"

remote_file "/etc/postfxi/main.cf" do
  mode '0644'
  owner 'root'
  group 'root'
  source "files/main.conf"
  notifies :restart, 'service[postfix]'
end
