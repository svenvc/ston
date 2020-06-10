I am STONAlternativeRepresentationTestObject.

My properties are
 - id <Integer>
 - time <DateAndTime> in the local time zone
 - gridReference <Point <Float>@<Float>> in kilometer

My STON representation has the properties
 - id <Integer>
 - time <DateAndTime> in UTC
 - grid_reference <Point <Float>@<Float>> in miles

Note the different key, gridReference vs. grid_reference

Upon serialization, the conversions local time to UTC and kilometer to mile is performed.
Upon materialization, the convertions UTC to local tie and miles to kilometers are performed.
 