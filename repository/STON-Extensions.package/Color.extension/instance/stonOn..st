*STON-Extensions
stonOn: stonWriter
	| name |
	(self isTranslucent or: [ (name := self name) = #unnamed ])
		ifTrue: [ 
			stonWriter writeObject: self streamMap: [ :map |
				#(red green blue alpha) do: [ :each | 
					map at: each put: (self perform: each) ] ] ]
		ifFalse: [ 
			stonWriter writeObject: self listSingleton: name ]