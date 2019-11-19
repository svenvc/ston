tests
testURL
	self
		assert: (self serialize: 'https://pharo.org/files/pharo.png' asUrl)
		equals: 'URL[''https://pharo.org/files/pharo.png'']'.
	self
		assert: (self serialize: 'mailto:sven@stfx.eu' asUrl)
		equals: 'URL[''mailto:sven@stfx.eu'']'.
	self
		assert: (self serialize: 'file:///var/log/system.log' asUrl)
		equals: 'URL[''file:///var/log/system.log'']'.
	self
		assert: (self serialize: 'scheme://user:password@host:123/var/log/system.log?foo=1&bar#frag' asUrl)
		equals: 'URL[''scheme://user:password@host:123/var/log/system.log?foo=1&bar#frag'']'.