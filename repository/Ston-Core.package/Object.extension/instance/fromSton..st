*ston-core
fromSton: stonReader
	"Decode non-variable classes from a map of their instance variables and values.
	Override to customize and add a mathcing #toSton: (see implementors)."
	
	self class isVariable 
		ifTrue: [
			self subclassResponsibility ]
		ifFalse: [
			stonReader parseMapDo: [ :instVarName :value |
				self instVarNamed: instVarName put: value ] ] 