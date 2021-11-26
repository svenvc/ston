*STON-Core
stonOn: stonWriter
	"For collections we chose to write a list of elements as delivered by #do:
	This is not the best or most correct solution for all subclasses though,
	so some will revert to standard object behavior or chose another solution"
	
	stonWriter writeObject: self do: [
		stonWriter encodeList: self ]
