%w(
  epel-release
  strace
  sysstat
  lsof
  tcpdump
  telnet
  nc
  traceroute
  openssl-devel
  readline-devel
  zlib-devel
  unzip
).each do |pkg|
  package pkg
end

service 'iptables' do
  action [:disable, :stop]
end

include_recipe 'selinux::disabled'
