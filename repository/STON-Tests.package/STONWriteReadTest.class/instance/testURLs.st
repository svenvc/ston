tests
testURLs
	| urls |
	urls := STON listClass withAll: { 
		'https://pharo.org/files/pharo.png' asUrl. 
		'mailto:sven@stfx.eu' asUrl. 
		'file:///var/log/system.log' asUrl.
		'scheme://user:password@host:123/var/log/system.log?foo=1&bar#frag' asUrl }.
	self serializeAndMaterialize: urls