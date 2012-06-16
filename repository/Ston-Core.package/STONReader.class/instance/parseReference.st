parsing-internal
parseReference
	| index object |
	self expectChar: $@.
	index := self parseNumberInteger.
	self consumeWhitespace.
	object := self resolveReferenceIndex: index.
	object isStonReference 
		ifTrue: [ unresolvedReferences := unresolvedReferences + 1 ].
	^ object