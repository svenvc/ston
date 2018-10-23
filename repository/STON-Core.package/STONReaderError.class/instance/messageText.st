accessing
messageText
	^ streamPosition 
		ifNil: [ 
			super messageText ] 
		ifNotNil: [ :pos | 
			'At character <1P>: <2P>' expandMacrosWith: pos with: super messageText ]