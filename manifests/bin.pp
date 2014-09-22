class devenv::bin {

  $home = $devenv::home

  vcsrepo { "${home}/bin":
    ensure   => latest,
    provider => 'git',
    source   => 'git@github.com:dandavison/bin.git',
    revision => 'master',
  }

}
