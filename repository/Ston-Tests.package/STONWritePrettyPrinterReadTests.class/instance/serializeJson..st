private
serializeJson: anObject
	^ String streamContents: [ :stream |
		STON writer 
			on: stream; 
			prettyPrint: true;
			jsonMode: true;
			nextPut: anObject ]