file { '/home/fred/it-projects-ubuntu/Puppet_1/test_folder':
  ensure  => directory,
  content => "Welcome to the server\n",
  mode    => '0666',
  owner   => 'fred',
  group   => 'fred',
}