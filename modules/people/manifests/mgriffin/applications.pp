class people::mgriffin::applications {
  include zsh
  include iterm2::dev
  include alfred
  include dropbox
  include lastpass
  include handbrake
  include vlc
  include spotify

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
}
