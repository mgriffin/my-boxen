class people::mgriffin {

  $my_homedir = "/Users/${::luser}"

  # OSX Defaults
  boxen::osx_defaults { 'Disable Dashboard':
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => 'YES',
  }
  boxen::osx_defaults { 'Disable reopen windows when logging back in':
    key    => 'TALLogoutSavesState',
    domain => 'com.apple.loginwindow',
    value  => 'false',
  }
  boxen::osx_defaults { 'Disable press-and-hold character picker':
    key    => 'ApplePressAndHoldEnabled',
    domain => 'NSGlobalDomain',
    value  => 'false',
  }
  boxen::osx_defaults { 'Display full POSIX path as Finder Window':
    key    => '_FXShowPosixPathInTitle',
    domain => 'com.apple.finder',
    value  => 'true',
  }
  boxen::osx_defaults { 'Secure Empty Trash':
    key    => 'EmptyTrashSecurely',
    domain => 'com.apple.finder',
    value  => 'true',
  }
  boxen::osx_defaults { 'Always use current directory in default search':
    key    => 'FXDefaultSearchScope',
    domain => 'com.apple.finder',
    value  => 'SCcf',
  }
  boxen::osx_defaults { 'Do not create .DS_Store':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.dashboard',
    value  => 'true',
  }
  boxen::osx_defaults { "Disable 'natural scrolling'":
    key    => 'com.apple.swipescrolldirection',
    domain => 'NSGlobalDomain',
    value  => 'false',
  }
  boxen::osx_defaults { 'Disable the "Are you sure you want to open this application?" dialog':
    key    => 'LSQuarantine',
    domain => 'com.apple.LaunchServices',
    value  => 'true',
  }
  boxen::osx_defaults { 'fucking sane key repeat':
    domain => 'NSGlobalDomain',
    key    => 'KeyRepeat',
    value  => '0',
  }
  boxen::osx_defaults { 'Expand save panel by default':
      key    => 'NSNavPanelExpandedStateForSaveMode',
      domain => 'NSGlobalDomain',
      value  => 'true',
  }
  boxen::osx_defaults { 'Expand print panel by default':
      key    => 'PMPrintingExpandedStateForPrint',
      domain => 'NSGlobalDomain',
      value  => 'true',
  }
  boxen::osx_defaults { 'Minimize on Double-Click':
      key    => 'AppleMiniaturizeOnDoubleClick',
      domain => 'NSGlobalDomain',
      value  => 'true',
  }
  boxen::osx_defaults { 'Put my Dock on the left':
    key    => 'orientation',
    domain => 'com.apple.dock',
    value  => 'left',
  }
  boxen::osx_defaults { 'Make function keys do real things, and not apple things':
    key    => 'com.apple.keyboard.fnState',
    domain => 'NSGlobalDomain',
    value  => 'true',
  }

  # Disable GateKeeper
  exec { 'Disable Gatekeeper':
    command => 'spctl --master-disable',
    unless  => 'spctl --status | grep disabled',
  }

  ##################################
  ## Facter, Puppet, and Envpuppet##
  ##################################

  repository { "${::boxen_srcdir}/puppet":
    source => 'puppetlabs/puppet',
  }

  repository { "${::boxen_srcdir}/facter":
    source => 'puppetlabs/facter',
  }

  file { '/bin/envpuppet':
    ensure  => link,
    mode    => '0755',
    target  => "${::boxen_srcdir}/puppet/ext/envpuppet",
    require => Repository["${::boxen_srcdir}/puppet"],
  }

  include people::mgriffin::applications

  # My dotfile repository
  repository { "${my_homedir}/src/dotfiles":
    source => 'mgriffin/dotfiles',
  }

  file { "${my_homedir}/.vimrc":
    ensure => link,
    mode   => '0644',
    target => "${my_homedir}/src/dotfiles/vimrc",
    require => Repository["${my_homedir}/src/dotfiles"],
  }

  file { "${my_homedir}/.vim":
    ensure => link,
    mode   => '0644',
    target => "${my_homedir}/src/dotfiles/vim",
    require => Repository["${my_homedir}/src/dotfiles"],
  }

  file { "${my_homedir}/.gitconfig":
    ensure => link,
    mode   => '0644',
    target => "${my_homedir}/src/dotfiles/gitconfig",
    require => Repository["${my_homedir}/src/dotfiles"],
  }
}
