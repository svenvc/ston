*STON-Core
stonOn: stonWriter
	"I store my instances as maps. When in JSON mode,
	encode me directly, without a class tag, keeping the order."

	(stonWriter jsonMode or: [ self class == STON mapClass])
		ifTrue: [
			stonWriter writeMap: self ]
		ifFalse: [
			stonWriter
				writeObject: self
				do: [ stonWriter encodeMap: self ] ]
