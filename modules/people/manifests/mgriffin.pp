class people::mgriffin {

  $my_homedir = "/Users/${::luser}"

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
