private
serializeAndMaterialize: object
	| serialization materialization |
	serialization := String streamContents: [ :stream |
		(STONWriter on: stream) 
			prettyPrint: true;
			nextPut: object ].
	materialization := (STONReader on: serialization readStream) next.
	self assert: object = materialization
	