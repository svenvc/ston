*STON-Core
fromSton: stonReader
	"Read a ISO YYYY-MM-DD format.
	Since my current implementation is time zone offset sensitive, the offset has to be taken into account.
	A missing offset results in the local timezone offset to be used"
	
	| readStream date |
	readStream := stonReader parseListSingleton readStream.
	date := self readFrom: readStream.
	readStream atEnd
		ifFalse: [ | offset |
			offset := DateAndTime readTimezoneOffsetFrom: readStream.
			offset = date offset 
				ifFalse: [ date start: (date start translateTo: offset) ] ].
	^ date