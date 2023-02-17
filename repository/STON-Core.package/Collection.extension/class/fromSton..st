*STON-Core
fromSton: stonReader
	"For collections we chose to instanciate based a list of elements using #add:
	This is not the best or most correct solution for all subclasses though,
	so some will revert to standard object behavior or chose another solution."

	| collection |
	collection := self new.
	stonReader parseListDo: [ :each |
		collection add: each ].
	^ collection