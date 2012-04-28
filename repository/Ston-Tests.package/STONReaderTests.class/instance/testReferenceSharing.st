tests
testReferenceSharing
	| one array |
	one := { #one }.
	array := (self materialize: '[[#one],@2,@2]').
	self assert: array = { one. one. one }.
	self assert: array first == array second.
	self assert: array first == array third