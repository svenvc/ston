tests
testDate
	| date |
	date := (Date year: 2012 month: 1 day: 1) translateToUTC.
	self assert: (self serialize: date) equals: 'Date[''2012-01-01Z'']'.
	date := (Date year: 2012 month: 1 day: 1) translateTo: 1 hour.
	self assert: (self serialize: date) equals: 'Date[''2012-01-01+01:00'']'.