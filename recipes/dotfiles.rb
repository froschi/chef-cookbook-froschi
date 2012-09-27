user = 'thorsten'
homedir = "/home/#{user}"

template "#{homedir}/.vimrc" do
  source 'dotfiles/vimrc'
  owner user
  group user
  mode 0644
end

template "#{homedir}/.tmux.conf" do
  source 'dotfiles/tmux.conf'
  owner user
  group user
  mode 0644
end

template "#{homedir}/bash_aliases" do
  source 'dotfiles/.bash_aliases'
  owner user
  group user
  mode 0644
end
