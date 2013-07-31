class people::mgriffin {

  $my_homedir = "/Users/${::luser}"

  notify { 'class people::mgriffin declared': }

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
}
