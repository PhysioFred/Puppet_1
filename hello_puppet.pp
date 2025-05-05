# hello_puppet.pp
# This Puppet manifest ensures a file /tmp/hello_puppet.txt exists with specific content

file { '/tmp/hello_puppet.txt':
  ensure  => 'file',
  content => "Hello, Puppet!\nThis file was created by Puppet.",
  mode    => '0644',
}
