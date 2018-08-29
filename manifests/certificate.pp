define letsencrypt::certificate($names) {
	include letsencrypt::scripts
	include letsencrypt::cronjobs

	$names_array = maybe_split($names, '\s+')

	$filename = $names_array[0]

	exec { "Issue certificate ${filename}":
		command => "/usr/local/bin/acme-issue $names",
		creates => "/var/lib/letsencrypt/certs/${filename}.pem",
		require => File["/usr/local/bin/acme-issue"],
	}
}
