writing
writeFloat: float
	float isFinite
		ifTrue: [ writeStream print: float ]
		ifFalse: [ | argument |
			argument := float isNaN 
				ifTrue: [ #nan ]
				ifFalse: [ 
					float negative 
						ifTrue: [ #negativeInfinity ]
						ifFalse: [ #infinity ] ].
			self writeObject: float named: #Float listSingleton: argument ]