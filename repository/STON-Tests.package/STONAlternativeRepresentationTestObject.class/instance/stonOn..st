ston persistence
stonOn: stonWriter
	stonWriter writeObject: self streamMap: [ :dictionary |
		dictionary
			at: #id put: self id;
			at: #time put: self timeUTC;
			at: #grid_reference put: self gridReferenceImperial ]