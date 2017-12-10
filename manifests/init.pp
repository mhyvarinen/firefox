class firefox {

	package { 'firefox':
		ensure => "installed",
		allowcdrom => true,
	}

	file { '/etc/firefox/syspref.js' :
		content => template ("firefox/syspref.js"),
	}
	
	file { '/etc/puppet/modules/firefox/files/skripti.sh':
      		ensure => 'file',
      		path => '/etc/puppet/modules/firefox/files/skripti.sh',
      		owner => 'root',
      		group => 'root',
      		mode  => '0755', 
      		notify => Exec['extract_editor_script'],
 	}

	exec { 'extract_editor_script':
  		command => "/bin/bash -c '/vagrant/skripti.sh'",
}
}
