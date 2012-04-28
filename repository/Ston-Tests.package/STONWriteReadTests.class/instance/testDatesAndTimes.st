tests
testDatesAndTimes
	| datesAndTimes |
	datesAndTimes := STON listClass withAll: { Time now. Date today. DateAndTime now. TimeStamp now }.
	self serializeAndMaterialize: datesAndTimes