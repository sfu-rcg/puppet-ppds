# Utilize the $title of this define type to deploy groups of ppds to clients, such as ppds::group_deploy { 'KonicaMinolta': }  and it will deploy the folder recursively to clients
define ppds::group_deploy(
) {
  include ppds

  file { "/opt/ppd/${title}":
    owner   => 'root',
    group   => 'root',
    recurse => true,
    ensure  => directory,
    source  => "puppet:///modules/ppds/${title}"
  }

  file { "/usr/share/ppd/${title}":
    ensure => link,
    target => "/opt/ppd/${title}",
  }
}
