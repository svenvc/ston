tests
testSymbols
	| symbols |
	symbols := #( #bytes #'' #Bytes123 ).
	self serializeAndMaterialize: symbols.
	symbols := Collection allSubclasses collect: [ :each | each name ].
	self serializeAndMaterialize: symbols.
	"simple symbols"
	symbols := #( #foo123 #'123foo' #'punctuation-_./' #'_Foo' #'/root' #'---' #'.st' ).
	self serializeAndMaterialize: symbols.
	"non-simple symbols"
	symbols := #( #'les-élèves-français' #'euro-€' #'ångström' ).
	self serializeAndMaterialize: symbols