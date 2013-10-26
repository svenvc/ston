parsing-internal
parseCharacter
	| char |
	(char := readStream next) = $\ 
		ifFalse: [ ^ char ].
	(#( $' $" $/ $\) includes: (char := readStream next))
		ifTrue: [ ^ char ].
	char = $b
		ifTrue: [ ^ Character backspace ].
	char = $f
		ifTrue: [ ^ Character newPage ].
	char = $n
		ifTrue: [ ^ Character lf ].
	char = $r
		ifTrue: [ ^ Character cr ].
	char = $t
		ifTrue: [ ^ Character tab ].
	char = $u
		ifTrue: [ ^ self parseCharacterHex ].
	self error: 'invalid escape character \' , (String with: char)