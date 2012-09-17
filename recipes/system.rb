include_recipe "froschi::firefox"

packages = %w/
  aptitude
  build-essential
  debtree
  git
  pwgen
  python-docutils
  ruby1.9.1
  sysstat
  tmux
  tree
  vim
  vim-gnome
  virtualbox
/

# Development packages
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
