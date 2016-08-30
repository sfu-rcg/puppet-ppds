class ppds(
) {
  file { "/opt/ppd":
    owner  => "root",
    group  => "root",
    ensure => directory,
  }
}
