user = "thorsten"
group = user
homedir = "/home/#{user}"

# Vagrant directory structure
vagrantroot = "#{homedir}/scm/vagrant"
vagrantdirs = %w|
  archives
  cookbooks/local
  cookbooks/github.com/froschi
  data_bags
roles|

directory vagrantroot do
  owner user
  group group
  mode 0775
end

vagrantdirs.each do |vagrantdir|
  d = File.join(vagrantroot, vagrantdir)
  directory d do
    owner user
    group group
    recursive true
    mode 0775
  end
end
