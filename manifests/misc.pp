class devenv::misc {

  $home = $devenv::home

  vcsrepo { "${home}/misc":
    ensure   => latest,
    provider => 'git',
    source   => 'git@github.counsyl.com:dan/misc.git',
    revision => 'master',
    identity => $devenv::ssh_key,
  }

}
