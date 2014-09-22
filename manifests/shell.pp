class devenv::shell {

  $home = $devenv::home
  $user = $devenv::user
  $group = $devenv::group

  vcsrepo { "${home}/config/shell":
    ensure   => latest,
    provider => 'git',
    source   => 'git@github.com:dandavison/shell-config.git',
    revision => 'master',
  }

  vcsrepo { "${home}/config/fasd":
    ensure   => present,
    provider => 'git',
    source   => 'git://github.com/clvv/fasd.git',
    revision => 'master',
  }

  file { "${home}/.profile":
    ensure   => present,
    content  => "zsh\n",
    owner    => $user,
    group    => $group,
  }

  file { "${home}/.bash_profile":
    ensure  => absent,
  }

  file { "${home}/.zshrc":
    ensure  => link,
    target  => "${home}/config/shell/zsh/zshrc.sh",
    owner   => $user,
    group   => $group,
  }

  file { "${home}/.bashrc":
    ensure  => link,
    target  => "${home}/config/shell/bash/bashrc.sh",
    owner   => $user,
    group   => $group,
  }

}
