writing
writeObject: anObject
	| instanceVariableNames |
	(instanceVariableNames := anObject class allInstVarNames) isEmpty
		ifTrue: [ 
			self writeObject: anObject do: [ self encodeMap: #() ] ]
		ifFalse: [ 
			self writeObject: anObject streamMap: [ :dictionary | 
				instanceVariableNames do: [ :each | 
					dictionary at: each asSymbol put: (anObject instVarNamed: each) ] ] ]