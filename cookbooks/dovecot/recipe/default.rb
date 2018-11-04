package "dovecot"
service "dovecot" do
  action [:start, :enable]
end
