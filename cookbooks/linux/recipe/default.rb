%w(
  epel-release
  gcc
  make
  strace
  sysstat
  lsof
  tcpdump
  telnet
  nc
  traceroute
  patch
  openssl-devel
  readline-devel
  zlib-devel
).each do |pkg|
  package pkg
end

service 'iptables' do
  action [:disable, :stop]
end

include_recipe 'selinux::disabled'
