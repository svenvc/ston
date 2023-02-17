*STON-Core
fromSton: stonReader
	"Overwritten to get back the standard object behavior"

	^ self new
		fromSton: stonReader;
		yourself