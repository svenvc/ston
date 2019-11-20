tests
testList
	self assert: (self serialize: (STON listClass withAll: #(1 2 3))) equals: '[1,2,3]'.
	self assert: (self serialize: STON listClass new) equals: '[]'.
	self 
		assert: (self serialize: (STON listClass withAll: { 1. -1. 0. #foo. 'a b c'. true. false. nil }))
		equals: '[1,-1,0,#foo,''a b c'',true,false,nil]'