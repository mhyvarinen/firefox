class firefox {

	package { 'firefox':
		ensure => "installed",
		allowcdrom => true,
	}

	file { '/etc/firefox/syspref.js' :
		content => template ("firefox/syspref.js"),
	}

}
