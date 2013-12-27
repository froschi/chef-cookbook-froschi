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
  python-gpgme
  ruby1.9.1
  subversion
  sysstat
  tmux
  tree
  vim
  vim-gnome
  virt-manager
  virtualbox-4.2
/

# Development packages
# This includes Ubuntu package building.
packages |= %w/
  autoconf
  automake
  cdbs
  debhelper
  debootstrap
  devscripts
  dh-make
  diff
  fakeroot
  genisoimage
  gnupg
  libtool
  lintian
  m4
  patch
  pbuilder
  piuparts
  quilt
  squashfs-tools
  syslinux
  ubuntu-dev-tools
/

# Development headers
packages |= %w/
  libgecode-dev
  libncurses5-dev
  libxml2-dev
  libxslt1-dev
  zlib1g-dev
  ruby1.9.1-dev
/

# Networking goodness
packages |= %w/
  dsniff
  fping
  hping3
  nmap
  sslstrip
  tcpdump
/

gems = %w/
  berkshelf
  bundler
  chef
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
