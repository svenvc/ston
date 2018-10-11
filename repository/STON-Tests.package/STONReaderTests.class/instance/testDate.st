tests
testDate
	| date |
	date := (Date year: 2012 month: 1 day: 1) translateToUTC.
	self assert: (self materialize: 'Date[''2012-01-01Z'']') equals: date.
	self assert: (self materialize: 'Date[''2012-01-01+00:00'']') equals: date.
	date := (Date year: 2012 month: 1 day: 1) translateTo: 1 hour.
	self assert: (self materialize: 'Date[''2012-01-01+01:00'']') equals: date.
	"a missing timezone offset results in the local timezone offset being used,
	this is never written by STON, but matches the first implementation for backwards compatibility"
	date := Date year: 2012 month: 1 day: 1.
	self assert: (self materialize: 'Date[''2012-01-01'']') equals: date.