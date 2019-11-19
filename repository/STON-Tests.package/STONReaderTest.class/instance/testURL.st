tests
testURL
	self 
		assert: (self materialize: 'URL[''https://pharo.org/files/pharo.png'']') 
		equals: 'https://pharo.org/files/pharo.png' asUrl.
	self 
		assert: (self materialize: 'URL[''mailto:sven@stfx.eu'']') 
		equals: 'mailto:sven@stfx.eu' asUrl.
	self 
		assert: (self materialize: 'URL[''file:///var/log/system.log'']') 
		equals: 'file:///var/log/system.log' asUrl.
	self 
		assert: (self materialize: 'URL[''scheme://user:password@host:123/var/log/system.log?foo=1&bar#frag'']') 
		equals: 'scheme://user:password@host:123/var/log/system.log?foo=1&bar#frag' asUrl.