*STON-Core
stonOn: stonWriter
	"Use a map with element-occurences pairs as representation"

	stonWriter 
		writeObject: self 
		do: [ stonWriter encodeMap: contents ]