tests
testClassNameKey
	self
		assert: ((STON reader
							acceptUnknownClasses: true;
							on: 'FooBarBaz { #foo : 100 }' readStream;
							next) at: STON classNameKey)
		equals: #FooBarBaz