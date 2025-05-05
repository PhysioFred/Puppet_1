file { '/opt/hello_world.sh':
  ensure  => file,
  content => "#!/bin/bash\necho Hello, world! > /opt/hello_world_output.txt\n",
  mode    => '0755',
  owner   => 'root',
  group   => 'root',
}

exec { 'run_hello_world':
  command     => '/opt/hello_world.sh',
  path        => ['/bin', '/usr/bin'],
  refreshonly => true,
  subscribe   => File['/opt/hello_world.sh'],
}