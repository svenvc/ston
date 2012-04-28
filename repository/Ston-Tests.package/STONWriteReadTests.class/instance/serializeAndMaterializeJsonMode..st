private
serializeAndMaterializeJsonMode: object
	| serialization materialization |
	serialization := String streamContents: [ :stream |
		(STONWriter on: stream)
			jsonMode: true;
			nextPut: object ].
	materialization := (STONReader on: serialization readStream) next.
	self assert: object = materialization
	