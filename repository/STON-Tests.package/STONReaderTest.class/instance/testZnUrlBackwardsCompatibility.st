tests
testZnUrlBackwardsCompatibility
	"We now have URL, make sure we still support the old format"
	self
		assert: (self materialize: 'ZnUrl{#scheme:#https,#host:''pharo.org'',#segments:OrderedCollection[''files'', ''pharo.png'']}')
		equals: 'https://pharo.org/files/pharo.png' asUrl.
	self
		assert: (self materialize: 'ZnUrl{#scheme:#file,#segments:OrderedCollection[''tmp'', ''foo.txt'']}')
		equals: 'file:///tmp/foo.txt' asUrl