class letsencrypt::cronjobs {
	include letsencrypt::scripts

	cron {
		"renew let's encrypt certs":
			hour    => seeded_rand(24, "hour-${::fqdn}"),
			minute  => seeded_rand(60, "minute-${::fqdn}"),
			user    => "root",
			command => "/usr/local/bin/acme-renew && /usr/sbin/service nginx reload",
			require => Class["letsencrypt::scripts"];
		"purge stale challenges":
			hour    => seeded_rand(24, "hour-purge-${::fqdn}"),
			minute  => seeded_rand(60, "minute-purge-${::fqdn}"),
			user    => "root",
			command => "/usr/bin/find /var/lib/letsencrypt/acme-challenge -type f -mtime +3 -delete",
	}
}
