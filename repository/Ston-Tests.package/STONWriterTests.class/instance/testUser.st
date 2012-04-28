tests
testUser
	| user |
	(user := STONTestUser new)
		username: 'john@foo.com';
		password: 'secret1'.
	self assert: (self serialize: user) = 'TestUser{#username:''john@foo.com'',#password:''secret1'',#enabled:true}'