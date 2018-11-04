package "dovecot"
service "dovecot" do
  action [:start, :enable]
end

%w(
  10-auth.conf
  10-mail.conf
  10-ssl.conf
).each do |f|
  remote_file "/etc/dovecot/conf.d/#{f}" do
    mode '0644'
    owner 'root'
    group 'root'
    source "files/#{f}"
    notifies :restart, 'service[dovecot]'
  end
end

remote_file "/etc/dovecot/users" do
  mode '0644'
  owner 'root'
  group 'root'
  source "files/users"
  notifies :restart, 'service[dovecot]'
end
