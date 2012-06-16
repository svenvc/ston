private
match: string do: block
	"Try to read and consume string and execute block if successful.
	Else do nothing (but do not back up)"
	 
	(string allSatisfy: [ :each | self matchChar: each ] )
		ifTrue: [ block value ]
