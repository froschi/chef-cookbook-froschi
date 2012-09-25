include_recipe 'froschi::vagrant'

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

vimdirs = %w/
  autoload
  bundle
  plugin
/

vimroot = "#{homedir}/.vim"

vimdirs.each do |vimdir|
  d = File.join(vimroot, vimdir)
  directory d do
    owner user
    group group
    recursive true
    mode 0755
  end
end

vimaddons = {
  "endwise" => "https://github.com/tpope/vim-endwise.git",
  "fugitive" => "https://github.com/tpope/vim-fugitive.git",
  "markdown" => "https://github.com/hallison/vim-markdown.git",
  "nerdtree" => "https://github.com/scrooloose/nerdtree.git",
  "snipmate" => "https://github.com/msanders/snipmate.vim.git"
}

vimaddons.each do |name, url|
  git "#{vimroot}/bundle/#{name}" do
    repository url
    action :sync
  end
end

git "#{homedir}/.csolo/pathogen" do
  repository "https://github.com/tpope/vim-pathogen.git"
  reference 'v2.0'
  action :sync
end

# This doesn't do what I expected it to do. Giving a pathname
# to 'source' complains that the source file is not in the cookbook.
# Using a file:// URL leads to "connection refused". Bummer.
#remote_file "#{homedir}/.vim/autoload/pathogen.vim" do
#  source "file://#{homedir}/.csolo/pathogen/pathogen.vim"
#end

# The following works as intended; however, what's intended is not
# what I really need.
#directory "#{homedir}/.vim/testing/shared" do
#  owner user
#  group group
#  recursive true
#  mode 0755
#end
#
#deploy "#{homedir}/.vim/testing" do
#  repo "#{homedir}/.csolo/pathogen"
#  revision 'v2.0'
#  create_dirs_before_symlink []
#  purge_before_symlink []
#  symlinks({})
#  symlink_before_migrate({})
#end
