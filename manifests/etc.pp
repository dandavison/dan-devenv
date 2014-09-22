class devenv::etc {

  $home = $devenv::home
  $user = $devenv::user
  $group = $devenv::group

  vcsrepo { "${home}/config/etc":
    ensure   => latest,
    provider => 'git',
    source   => 'git@github.counsyl.com:dan/config.git',
    revision => 'master',
  }

  file { "${home}/.dircolors":
    ensure  => link,
    target  => "${home}/config/etc/dircolors/dircolors",
    owner   => $user,
    group   => $group,
  }

  file { "${home}/.gitconfig":
    ensure  => link,
    target  => "${home}/config/etc/git/gitconfig",
    owner   => $user,
    group   => $group,
  }

  file { "${home}/.tmux.conf":
    ensure  => link,
    target  => "${home}/config/etc/tmux/tmux.conf",
    owner   => $user,
    group   => $group,
  }

}
