include_recipe "froschi::firefox"

packages = %w/
  aptitude
  apt-file
  build-essential
  debtree
  git
  git-svn
  pwgen
  python-docutils
  ruby1.9.1
  subversion
  sysstat
  tmux
  tree
  vim
  vim-gnome
  virt-manager
  virtualbox
/

# Development packages
packages |= %w/
  autoconf
  automake
  debhelper
  devscripts
  libtool
  m4
/

# Development headers
packages |= %w/
  libgecode-dev
  libxml2-dev
  libxslt1-dev
  zlib1g-dev
  ruby1.9.1-dev
/

gems = %w/
  berkshelf
  bundler
  chef
  heroku
  hub
  jekyll
  json
  nokogiri
  rdiscount
  rubyzip
  tmuxinator
/

# Requires chef
gems |= %w/
  knife-block
/

# Requires virtualbox
gems |= %w/
  vagrant
  vagrant-vbguest
  veewee
/

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

gems.each do |gem|
  gem_package gem do
    action [:install, :upgrade]
  end
end
