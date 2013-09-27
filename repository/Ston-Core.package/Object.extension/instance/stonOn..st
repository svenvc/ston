*ston-core
stonOn: stonWriter
	"Encode non-variable classes with a map of their instance variable and values.
	Override to customize and add a matching #fromSton: (see implementors)."

	self class isVariable 
		ifTrue: [
			self subclassResponsibility ]
		ifFalse: [
			stonWriter writeObject: self ]
