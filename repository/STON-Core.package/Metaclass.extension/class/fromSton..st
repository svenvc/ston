*STON-Core
fromSton: stonReader
	| theClassName theClass theMetaclass |
	theClassName := stonReader parseListSingleton.
	theClass := self environment at: theClassName.
	theMetaclass := theClass class.
	^ theMetaclass