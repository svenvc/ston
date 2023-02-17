accessing
readInto: collection startingAt: offset count: requestedCount
	"Read count elements and place them in collection starting at offset.
	Return the number of elements actually read."

	^ peekedCharacter
		ifNil: [
			0 to: requestedCount - 1 do: [ :count | | object |
				(object := self nextNonCommentChar) ifNil: [ ^ count ].
				collection at: offset + count put: object ].
			^ requestedCount ]
		ifNotNil: [
			collection at: offset put: peekedCharacter.
			peekedCharacter := nil.
			(self
				readInto: collection
				startingAt: offset + 1
				count: requestedCount - 1) + 1 ]