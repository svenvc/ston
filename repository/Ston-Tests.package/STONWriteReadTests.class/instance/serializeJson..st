private
serializeJson: anObject
	^ String streamContents: [ :stream |
		STON writer 
			on: stream;
			jsonMode: true;
			nextPut: anObject ]