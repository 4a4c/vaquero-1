install
lang en_GB.UTF-8
keyboard us
timezone Australia/Melbourne
auth --useshadow --enablemd5
selinux --disabled
firewall --disabled
services --enabled=NetworkManager,sshd
eula --agreed
ignoredisk --only-use=sda
reboot

bootloader --location=mbr
zerombr
clearpart --all --initlabel
part swap --asprimary --fstype="swap" --size=1024
part /boot --fstype xfs --size=200
part pv.01 --size=1 --grow
volgroup rootvg01 pv.01
logvol / --fstype xfs --name=lv01 --vgname=rootvg01 --size=1 --grow

rootpw --iscrypted {{.group.passwdHash}}

repo --name=base --baseurl={{.env.centosRepo}}
url --url="{{.env.centosRepo}}"

%packages --nobase --ignoremissing
@core
%end