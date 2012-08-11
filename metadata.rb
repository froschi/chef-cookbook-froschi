maintainer "Thorsten Fischer"
maintainer_email "thorsten@froschi.org"
license "Apache 2.0"
description "Thorsten's personal configuration cookbooks"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

recipe "froschi", "Defaults to froschi::personal"
recipe "froschi::personal", "Configures personal stuff."
recipe "froschi::system", "Configures the system."

version "0.0.1"

%w/ubuntu/.each { |os| supports os }
