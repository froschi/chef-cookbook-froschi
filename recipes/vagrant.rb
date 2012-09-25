user = "thorsten"
group = user
homedir = "/home/#{user}"

# Vagrant directory structure
vagrantroot = "#{homedir}/scm/vagrant"
vagrantdirs = %w/archives cookbooks/

directory vagrantroot do
  owner user
  group group
  mode 0755
end

vagrantdirs.each do |vagrantdir|
  d = File.join(vagrantroot, vagrantdir)
  directory d do
    owner user
    group group
    recursive true
    mode 0755
  end
end
