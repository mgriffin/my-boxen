class people::mgriffin::applications {
  include zsh
  include iterm2::dev
  include alfred
  include dropbox
  include lastpass
  include handbrake
  include vlc

  #package { 'libdvdcss':
  #  source => 'http://download.videolan.org/libdvdcss/1.2.12/macosx/libdvdcss.pkg',
  #  provider => pkg
  #}
}
