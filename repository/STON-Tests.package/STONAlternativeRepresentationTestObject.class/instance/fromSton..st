ston persistence
fromSton: stonReader
	stonReader parseMapDo: [ :key :value |
		key = #id ifTrue: [ self id: value ].
		key = #time ifTrue: [ self timeUTC: value ].
		key = #grid_reference ifTrue: [ self gridReferenceImperial: value ] ]