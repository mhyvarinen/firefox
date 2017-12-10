class firefox {

	package { 'firefox':
		ensure => "installed",
		allowcdrom => true,
	}

	file { '/etc/firefox/syspref.js' :
		content => template ("firefox/syspref.js"),
	}
	file { 'skripti.sh':
                ensure => 'file',
                source => 'puppet:///modules/firefox/skripti.sh',
                path => '/usr/local/bin/skripti.sh',
                owner => 'root',
                group => 'root',
                mode => '0744',
                notify => Exec['run_my_script'],
        }

        exec { 'run_my_script' :
                command => '/usr/local/bin/skripti.sh',
                refreshonly => true,
        }
}
