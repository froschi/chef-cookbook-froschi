user = 'thorsten'
homedir = "/home/#{user}"

template "#{homedir}/.vimrc" do
  source 'dotfiles/vimrc'
  owner user
  group user
  mode 0644
end
