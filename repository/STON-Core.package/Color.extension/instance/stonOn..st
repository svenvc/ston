*STON-Core
stonOn: stonWriter
	| name |
	(self isTranslucent or: [ (name := self name) = #unnamed ])
		ifTrue: [ 
			stonWriter writeObject: self streamMap: [ :map |
				#(red green blue alpha) do: [ :each | 
					map at: each put: ((self perform: each) roundTo: 0.001) ] ] ]
		ifFalse: [ 
			stonWriter writeObject: self listSingleton: name ]