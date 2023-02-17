accessing
classNameKey
	"Return the key that will be used to add a property with the class name
	when an unknown class is read and the option STONReader>>#acceptUnknownClasses: is true,
	by default #className. Such unknown classes are returned as generic maps."

	"((STON reader acceptUnknownClasses: true; on: 'FooBarBaz { #foo : 100 }' readStream; next) at: STON classNameKey) >>> #FooBarBaz"

	^ #className