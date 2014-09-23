class devenv {
  $user = "dan"

  case $::operatingsystem {
    'Darwin': {
      $home = "/Users/${user}"
      $group = 'staff'
    }
    default:  {
      $home = "/home/${user}"
      $group = "$user"
    }
  }

  $ssh_key = "${home}/.ssh/id_rsa"

  include devenv::bin
  include devenv::misc
  include devenv::shell
  include devenv::emacs
  include devenv::etc
}
