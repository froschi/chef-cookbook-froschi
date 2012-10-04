user = 'thorsten'
homedir = "/home/#{user}"

dldir = "#{homedir}/dl"

directory dldir do
  owner user
  group user
  mode 0755
  action :create
end

dldirs = %w/audio iso src tmp video/

dldirs.each do |d|
  directory "#{dldir}/#{d}" do
    owner user
    group user
    mode 0755
    action :create
  end
end
