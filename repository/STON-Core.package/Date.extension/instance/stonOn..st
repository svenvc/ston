*ston-core
stonOn: stonWriter
	"Use an ISO style YYYY-MM-DD representation.
	Since my current implementation is time zone offset sensitive, the offset has to be included."

	| representation |
	representation := self offset isZero
		ifTrue: [ 
			String new: 11 streamContents: [ :out | 
				self printOn: out format: #(3 2 1 $- 1 1 2).
				out nextPut: $Z ] ]
		ifFalse: [ 
			String new: 32 streamContents: [ :out | 
				self printOn: out format: #(3 2 1 $- 1 1 2).
				out nextPut: (self offset positive ifTrue: [ $+ ] ifFalse: [ $- ]).
				self offset hours abs printOn: out base: 10 length: 2 padded: true.
				out nextPut: $:.
				self offset minutes abs printOn: out base: 10 length: 2 padded: true.
				self offset seconds = 0 
					ifFalse:[ 
						out nextPut: $:; print: self offset seconds abs truncated ] ] ].
	stonWriter writeObject: self listSingleton: representation