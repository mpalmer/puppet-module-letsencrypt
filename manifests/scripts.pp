class letsencrypt::scripts {
	include letsencrypt::packages

	file {
		"/usr/local/bin/acme-issue":
			source => "puppet:///modules/letsencrypt/acme-issue";
		"/usr/local/bin/acme-renew":
			source => "puppet:///modules/letsencrypt/acme-renew";
		["/var/lib/letsencrypt",
		 "/var/lib/letsencrypt/acme-challenge",
		 "/var/lib/letsencrypt/certs"]:
			ensure => directory,
			mode   => "0755",
			owner  => "root",
			group  => "root";
		"/var/lib/letsencrypt/keys":
			ensure => directory,
			mode   => "0700",
			owner  => "root",
			group  => "root";
	}
}
