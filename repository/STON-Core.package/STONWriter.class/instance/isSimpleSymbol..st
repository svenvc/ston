private
isSimpleSymbol: symbol
	(symbol isEmpty or: [ symbol isWideString ]) 
		ifTrue: [ ^ false ].
	^ (symbol class 
		findFirstInString: symbol 
		inSet: STONSimpleSymbolCharacters 
		startingAt: 1) = 0
