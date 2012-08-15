packages = %w/
  aptitude
  build-essential
  debtree
  git
  libgecode-dev
  libxml2-dev
  libxslt1-dev
  pwgen
  ruby1.9.1
  ruby1.9.1-dev
  tmux
  vim
  vim-gnome
  virtualbox
/

gems = %w/
  berkshelf
  bundler
  chef
  hub
  nokogiri
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
