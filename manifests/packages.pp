class letsencrypt::packages {
	gem { "acme-client for letsencrypt module":
		package => "acme-client",
		version => "< 2",
	}
}
