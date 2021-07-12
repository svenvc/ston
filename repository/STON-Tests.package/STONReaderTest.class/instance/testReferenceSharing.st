tests
testReferenceSharing
	| one array |
	one := {#one}.
	array := self materialize: '[[#one],@2,@2]'.
	self assert: array equals: (STON listClass with: one with: one with: one).
	self assert: array first identicalTo: array second.
	self assert: array first identicalTo: array third