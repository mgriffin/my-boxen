# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.9"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.4"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "osx", "1.5.0"
github "zsh", "1.0.0"
github "iterm2", "1.0.3"
github "alfred", "1.1.6"
github "dropbox", "1.1.1"
github "lastpass", "1.1.0", :repo => "dieterdemeyer/puppet-lastpass"
github "handbrake", "1.0.1"
github "vlc", "1.0.4"
github "spotify", "1.0.1"
github "virtualbox", "1.0.9"
github "vagrant", "3.0.0"
github "mactex", "0.1.0", :repo => "Omegaice/puppet-mactex"
github "wget", "1.0.0"
github "libtool", "1.0.0"
github "pkgconfig", "1.0.0"
github "pcre", "1.0.0"
github "libpng", "1.0.0"
github "php", "1.1.1", :repo => "mattheath/puppet-php"
github "transmission", "1.0.0"
github "tmux", "1.0.2"
github "mou", "1.1.3"
github "flux", "1.0.0"
github "imagemagick", "1.2.1"
