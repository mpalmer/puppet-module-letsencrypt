class letsencrypt::cronjobs {
	include letsencrypt::scripts

	cron {
		"renew let's encrypt certs":
			hour    => 1,
			minute  => 15,
			user    => "root",
			command => "/usr/local/bin/acme-renew",
			require => Class["letsencrypt::scripts"];
		"purge stale challenges":
			hour    => 1,
			minute  => 30,
			user    => "root",
			command => "/usr/bin/find /var/lib/letsencrypt/acme-challenge -type f -mtime +3 -delete",
			require => Package["tmpreaper"];
	}
}
