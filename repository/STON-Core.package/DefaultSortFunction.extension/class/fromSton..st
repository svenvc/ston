*STON-Core
fromSton: stonReader
	"Overwritten to always return the default"
	
	self assert: stonReader parseMap isEmpty.
	^ SortFunction default