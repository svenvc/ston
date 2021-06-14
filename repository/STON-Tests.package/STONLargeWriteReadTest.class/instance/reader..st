private
reader: string
	^ (super reader: string) 
		optimizeForLargeStructures; 
		yourself