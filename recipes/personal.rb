user = "thorsten"
group = user
homedir = "/home/#{user}"

directory homedir do
  action :nothing
  owner user
  group group
  mode 0700
end

# SSH, GPG

sshdir = "#{homedir}/.ssh"

directory sshdir do
  owner user
  group group
  mode 0700
end

gpgdir = "#{homedir}/.gnupg"

directory gpgdir do
  owner user
  group group
  mode 0700
end

vimdir = "#{homedir}/.vim/autoload"

directory vimdir do
  owner user
  group group
  recursive true
  mode 0755
end

git "#{homedir}/.csolo/pathogen/" do
  repository "https://github.com/tpope/vim-pathogen.git"
  reference 'v2.0'
  action :sync
end
