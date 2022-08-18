accessing
jsonWriter
	"Shortcut to create a new STONWriter instance configured to output JSON"
	
	^ STONWriter new
			jsonMode: true;
			referencePolicy: #error;
			yourself