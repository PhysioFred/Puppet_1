# nginx_demo.pp
# Set this to 'present' to install and configure nginx, or 'absent' to uninstall and clean up
$ensure_state = 'present'  # Change to 'absent' to uninstall everything

package { 'nginx':
  ensure => $ensure_state,
}

file { '/tmp/nginx_demo.txt':
  ensure  => $ensure_state ? {
    'present' => 'file',
    'absent'  => 'absent',
  },
  content => "Nginx is managed by Puppet!\n",
  mode    => '0644',
  require => Package['nginx'],
}

service { 'nginx':
  ensure     => $ensure_state ? {
    'present' => 'running',
    'absent'  => 'stopped',
  },
  enable     => $ensure_state ? {
    'present' => true,
    'absent'  => false,
  },
  subscribe  => Package['nginx'],
  require    => Package['nginx'],
}
