define ppds::group_deploy(
  String[1] $group_name => '',
) {
  include ppds

  file { "/opt/ppd/${group_name}":
    owner   => 'root',
    group   => 'root',
    recurse => true,
    ensure  => directory,
    source  => "puppet:///modules/ppds/${group_name}"
  }

  file { "/usr/share/ppd/${group_name}":
    ensure => link,
    target => "/opt/ppd/${group_name}",
  }
}
