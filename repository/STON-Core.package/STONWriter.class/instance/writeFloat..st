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
			writeStream nextPutAll: 'Float['; print: argument; nextPut: $] ]