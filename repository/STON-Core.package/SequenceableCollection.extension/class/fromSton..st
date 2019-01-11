*ston-core
fromSton: stonReader
	"Overwritten to use #streamContents: and #nextPut:"
	
	^ self streamContents: [ :stream |
		stonReader parseListDo: [ :each |
			stream nextPut: each ] ]