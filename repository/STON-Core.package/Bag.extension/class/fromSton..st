*STON-Core
fromSton: stonReader
	"Read a map representation containing element/occurrences pairs"
	
	| bag |
	bag := self new.
	stonReader parseMapDo: [ :key :value |
		bag add: key withOccurrences: value ].
	^ bag