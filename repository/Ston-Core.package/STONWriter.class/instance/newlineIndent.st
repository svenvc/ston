private
newlineIndent
	prettyPrint ifTrue: [ 
		writeStream nextPut: Character cr.
		level timesRepeat: [ writeStream tab ] ]