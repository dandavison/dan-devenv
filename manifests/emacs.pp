class devenv::emacs {

  $home = $devenv::home
  $user = $devenv::user
  $group = $devenv::group

  vcsrepo { "${home}/config/emacs":
    ensure   => latest,
    provider => 'git',
    source   => 'git@github.com:dandavison/emacs-config.git',
    revision => 'master',
    identity => $devenv::ssh_key,
  }

  file { "${home}/.emacs":
    ensure  => link,
    target  => "${home}/config/emacs/emacs-init.el",
    owner   => $user,
    group   => $group,
  }

}
