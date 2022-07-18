*STON-Core
fromSton: stonReader
	| argument |
	argument := stonReader parseListSingleton.
	argument isNumber ifTrue: [ ^ argument ].
	^ (#(nan infinity negativeInfinity) includes: argument)
		ifTrue: [ self perform: argument ]
		ifFalse: [ stonReader error: 'special Float not recognized' ]