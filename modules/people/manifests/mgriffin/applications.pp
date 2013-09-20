class people::mgriffin::applications {
  include zsh
  include iterm2::dev
  include alfred
  include dropbox
  include lastpass
  include handbrake
  include vlc
  include spotify
  include virtualbox
  include vagrant
  include mactex::basic
  include wget
  include libtool
  include pkgconfig
  include pcre
  include libpng
  include php::5_4
  include transmission
  include tmux

  #package { 'libdvdcss':
  #  source => 'http://download.videolan.org/libdvdcss/1.2.12/macosx/libdvdcss.pkg',
  #  provider => pkg
  #}

  package { 'GarminCommunicatorPlugin':
    ensure => installed,
    provider => pkgdmg,
    source => 'http://www8.garmin.com/software/CommunicatorPluginforMac_404.dmg'
  }

  package { 'GarminAntAgent':
    ensure => installed,
    provider => pkgdmg,
    source => 'http://www8.garmin.com/software/ANTAgentforMac_222.dmg'
  }

  package { 'GPGSuite':
    ensure => installed,
    provider => pkgdmg,
    source => 'https://s3.amazonaws.com/gpgtools/GPG%20Suite%20-%202013.07.31.dmg'
  }

  class { 'php::global':
    version => '5.4.17'
  }
}
