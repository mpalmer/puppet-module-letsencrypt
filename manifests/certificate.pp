define letsencrypt::certificate($names) {
	include letsencrypt::scripts
	include letsencrypt::cronjobs

	$names_array = maybe_split($names, '\s+')
	$name_list = join($names_array, " ")

	$filename = $names_array[0]

	exec { "Issue certificate ${filename}":
		command => "/usr/local/bin/acme-issue ${name_list}",
		creates => "/var/lib/letsencrypt/certs/${filename}.pem",
		require => File["/usr/local/bin/acme-issue"],
	}
}
