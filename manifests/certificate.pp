define letsencrypt::certificate($names) {
	include letsencrypt::scripts

	exec { "Issue certificate ${name}":
		command => "/usr/local/bin/acme-issue $names",
		require => File["/usr/local/bin/acme-issue"],
	}
}
