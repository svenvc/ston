# The STON Specification

*Sven Van Caekenberghe*

*First version: October 30, 2018*

*Last update: July 22, 2022*


STON, short for Smalltalk Object Notation, is a lightweight, text-based human-readable data interchange format for class-based object-oriented languages like Smalltalk.

It can be used to serialise domain level objects, either for persistency or network transport. By offering class tags for objects as well as support for object references, arbitrary object graphs can we written and read back.

With conventions to use simpler representations for common value objects and comprehensive primitive support, STON is both compact and readable.

STON was created in 2012 and is in active use in various Smalltalk systems, most notably in Pharo. The original documentation was the [Smalltalk Object Notation](https://github.com/svenvc/ston/blob/master/ston-paper.md) paper. The Pharo Enterprise book, written in 2015, has an [STON](https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/book-result/STON/STON.html) chapter. This document is meant to be the authoritative specification of STON as a data format, independent from its implementation.


## Example

Here is an example STON object, a user with some fields.

    DoomUser {
	    #name : 'John Doe',
	    #password : ByteArray [ '5ebe2294ecd0e0f08eab7690d2a6ee69' ],
	    #roles : [ #login, #admin ],
	    #avatar : URL [ 'https://www.gravatar.com/avatar/f179b7f86ea5f35c32a6edf501f62bc7' ],
	    #lastLogin : DateAndTime [ '2018-10-30T15:01:13.364516+01:00' ],
	    #loginCount: 42 }

Class tags indicate the type of an object. In the example, DoomUser, ByteArray, URL and DateAndTime are used. Curly braces delineate maps containing key:value associations, most often used for the properties of an object. Square brackets delineate lists, like the roles array. A hash tag starts a symbol while strings use single quotes. Some objects have custom representations to make them easier to read and edit: ByteArray uses a hex string, while URL and DateAndTime use their natural RFC and ISO forms.


##  Basics


### Character Encoding

STON is a textual format. The stream or file containing STON uses UTF-8 character encoding. Since a Unicode escape mechanism is provided for strings and symbols, an STON writer could support the option to output pure ASCII and encode all non-ASCII using the Unicode escape mechanism. An STON reader has to accept UTF-8, but could use optional pure ASCII input as an optimisation.


### Whitespace and Newlines

Whitespace is not significant. Pretty printing STON does not alter its semantics. Any line end convention can be used.

By default, significant - inside strings or symbols - unescaped, raw newlines in any convention are preserved as is. A reader could offer the option to convert those significant unescaped newlines to a specific convention. Similarly, a writer could convert significant newlines in any convention to a specific convention and output them unescaped. The default is to leave them as they are and to escape them.


### Comments

There is no comment mechanism in STON. It is possible to use a filtering stream to skip C-style comments, for example.


### Character Classes

To support the formal syntax definitions in the next sections, we define a number of characters classes.

    lowercase-letter = "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z"
    uppercase-letter = "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z"
    decimal-digit-non-zero = "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
    decimal-digit = "0" | decimal-digit-non-zero
    hex-digit = decimal-digit | "A" | "B" | "C" | "D" | "E" | "F" | "a" | "b" | "c" | "d" | "e" | "f"

The following character classes are not directly used in any rules but are used in the accompanying descriptions.
    
    whitespace = sp | ht | cr | lf | ff
    sp = "\u0020" <space>
    ht = "\u0009" <horizontal tab>
    cr = "\u000D" <carriage return>
    lf = "\u000A" <line feed>
    ff = "\u000C" <form feed>
    bs = "\u0008" <backspace>
    ascii-control-char = "\u0000" | .. | "\u001F" | "\u007F"
    ascii-char = "\u0000" | .. | "\u007F"
    printable-ascii-char = "\u0020" | .. | "\u7E"
    unicode-char = <any Unicode character>


## The STON Object Graph

STON describes a single, self-contained object graph. Normally a stream or file contains one such graph. At the top level, STON can be any of six things: a primitive, list, association, map, object or reference.

    ston = primitive | list | association | map | object | reference

It is also possible to write or read multiple, independent, self-contained object graphs in sequence to or from a stream or file. Note that inter object references are defined per object graph.

No header nor version information is added to STON output.

The filename extension for STON is usually ".ston". There is no official mime type for STON, but "text/ston" and/or "application/ston" would seem logical.


## Primitives

STON has a just a few primitive, literal values: numbers, strings, symbols, booleans and an undefined value.

    primitive = number | string | symbol | boolean | nil 

Unless otherwise noted, literals are case sensitive, favouring lowercase.


### Numbers

There are four different kinds of numbers in STON: integers, fractions, scaled decimals and floats.

    number = integer | fraction | scaled-decimal | float


#### Integers

Integer are positive or negative whole numbers of unlimited precision. There should be no leading zeros. A plus sign "+" is not allowed for positive numbers.

    positive-integer = decimal-digit-non-zero decimal-digit *
    negative-integer = "-" positive-integer
    integer = "0" | positive-integer | negative-integer


#### Fractions

Fractions are positive or negative pure rational numbers, consisting of a nominator and denominator, both of unlimited precision. Fractions should be reduced to their normal, simplified or reduced, form.

    nominator = positive-integer | negative-integer
    denominator = positive-integer
    fraction = nominator "/" denominator


#### Scaled Decimals

Scaled decimals are a special form of fractions that add a scale, the number of significant digits they use. With a denominator that is a multiple of 10, scaled decimals are somewhat like fixed precision numbers.

    scale = positive-integer
    scaled-decimal = nominator "/" denominator "s" scale


#### Floats

STON uses a mostly standard IEEE 754 representation, excluding the infinity and not-a-number special values. The exponent indicator can be uppercase "E" or the lowercase "e". Inside exponents, an optional plus sign "+" is allowed. 

    float-fraction = "." decimal-digit *
    float-ee = "e" | "E"
    float-ee-sign = "+" | "-"
    float-exponent = float-ee [ float-ee-sign ] positive-integer
    float = integer [ float-fraction ] [ float-exponent ] 

Although both the float's fraction part and exponent part are optional, one of the two needs to be present for the number to be recognised as a float and not an integer.

Three special floats, Nan, Inf and -Inf are represented using the more general STON object syntax (see further, case is significant, whitespace is not):

- Float [ #nan ]
- Float [ #infinity ]
- Float [ #negativeInfinity ]


### Strings

Strings are enclosed in single quotes and use a backslash for escape sequences. In particular, the following escape sequences are defined:

- \\' for a single quote (functionally required)
- \\\\ for a backslash (functionally required)
- \\b for a backspace [bs]
- \\f for a form feed [ff]
- \\n for a line feed [lf]
- \\r for a carriage return [cr]
- \\t for a horizontal tab [ht]
- \\uHHHH for a Unicode escape (partially optional)
- \\" for a double quote (optional)
- \\/ for a forward slash (optional)

Functionally, only the first 2 escape sequences are required. It is only possible to have a single quote in a string by escaping it, else the string would end. Similarly, a backslash must be doubled else it is interpreted as an escape sequence.

Any other Unicode character could occur in its raw form and will be accepted as part of the string. However, an STON writer should always use the 5 named escapes, b, f, n, r and t as well as a Unicode escape for any control characters (most notably the ASCII control characters). An STON reader should also accept the 2 optional escapes for double quote and forward slash.

A Unicode escape consists of a lowercase "u" followed by 4 hexadecimal digits. Both uppercase and lowercase hex digits can be used and should be accepted.

For Unicode characters with code points that do not fit in the 0 to FFFF range, UTF-16 surrogate pairs are used. For example, the character "MUSICAL SYMBOL G CLEF" with code point 119070 decimal, 1D11E hex, is encoded with 2 escapes: \\uD834\\uDD1E.

Since raw Unicode characters can only occur inside strings and symbols and since a Unicode escape mechanism exists, an STON writer could support the option to output pure ASCII and encode all non-ASCII using the Unicode escape mechanism. An STON reader always has to accept UTF-8, but could use optional pure ASCII input as an optimisation.

    fundamental-string-escape = "\\" | "\'"
    named-string-escape = "\b" | "\f" | "\n" | "\r" | "\t"
    optional-string-escape = "\/" | "\""
    unicode-string-escape = "\u" hex-digit hex-digit hex-digit hex-digit
    string-escape = fundamental-string-escape | named-string-escape | optional-string-escape | unicode-string-escape
    string-char = < any Unicode char except "'" and "\" >
    string-chars = [ string-char | string-escape ] *
    string = "'" string-chars "'"

By default significant newlines inside strings in any convention (cr, lf, crlf) are left unchanged and are always encoded by a named escape. A reader could offer the option to convert those significant unescaped newlines to a specific convention. Similarly, a writer could convert significant newlines in any convention to a specific convention and output them unescaped.


### Symbols

Symbols are strings that are unique in a specific object space. They are maintained through a symbol table. STON has direct support for symbols as a primitive type. There are 2 variants for literal symbols, both starting with a hash sign:

- simple symbols using a limited character set
- arbitrary symbols

The limited character set consists of the standard upper and lowercase letters, the decimal digits and 4 punctuation characters ("-",  "_", "." and "/"). To encode arbitrary symbols, a string is used.

    simple-symbol-char = uppercase-letter | lowercase-letter | decimal-digit | "-" | "_" | "." | "/"
    simple-symbol = "#" simple-symbol-char
    generic-symbol = "#" string
    symbol = simple-symbol | generic-symbol


### Booleans

STON has the standard boolean literals, true and false, always in lowercase.

    boolean = "true" | "false"


### The Undefined Object

STON has a special literal for the undefined object, nil, in lowercase.

    nil = "nil"

The undefined object can occur anywhere a regular object is expected, inside lists, maps, associations and objects.


## Lists

A list is an ordered sequence of arbitrary values forming an indexable array.

    list-elements = ston | ston "," list-elements
    list = "[" "]" | "[" list-elements "]"

List elements are separated by commas. A list can also be empty. A list is functionally equivalent to an object with class tag "Array" using as representation the elements listed. 


## Associations

Associations are key/value pairs. Both the key and the value can be any STON value. Associations are building blocks for maps, but can also occur by themselves.

    association = ston ":" ston

The above shorthand notation is functionally equivalent to an object with class tag "Association" and the properties "key" and  "value". There are no restrictions on keys nor on values.


## Maps

A map is an unordered collection of associations forming an associative lookup table, hash table or dictionary.

    associations = association | association "," associations
    map = "{" "}" | "{" associations "}"

The associations that constitute a map are separated by commas. A map can also be empty. A map is functionally equivalent to an object with class tag "Dictionary" using as representation the associations listed.

No order is maintained and when duplicate keys occur, the behaviour is undefined but no error is signalled. Currently, duplicate keys overwrite each other in the order they are read. To maintain an order, an OrderedDictionary can be used. Duplicate keys should not occur.


## Objects

An object consists of a class tag followed by a representation. Class tags start with an uppercase letter and use a limited charset: upper and lowercase letter, decimal digits and the underscore character.

	class-tag-char = uppercase-letter | lowercase-letter | decimal-digit | "_"
	class-tag = uppercase-letter class-tag-char *
	object-representation = list | map
	object = class-tag object-representation

The standard default STON encoding of arbitrary non-variable objects is to use a map with all non nil named instance variables and their values.

The standard default STON encoding of collection objects is to use a list with the element values.

Note that an object representation is always either a list or a map.


## References

Inside an object graph, both shared structures and circular references can occur. STON remembers and checks object references (pointers) while writing and replacing already encountered objects with a reference. While reading, the inverse process occurs: references are replace by the object they refer to.

STON traverses an object graph in depth first order. The order at each level, basically each object's named instance variables or collection elements, is defined by the writer and preserved as such in the STON being written.

Objects in the graph are numbered from 1 up in the order they are encountered. This number is used in a reference.

    reference = "@" positive-integer

The order and numbering are only consistent and defined for a single object graph as written by a specific system. Given a specific STON object graph, any compatible system is capable of reading it and resolving all references as this does not depend on any local ordering in the receiving system.

Primitives are not counted as objects for this process, so cannot be the target of a reference.

When reading STON and materialising the object graph, references can only be swapped for the object they are pointing to after the whole structure has been read. This requires a second pass over the graph, in case there actually are references.

Additionally, special care must be taken to maintain the health of data structures that depend on certain properties of the sub objects they hold. In particular the hash of a key or value object might change if references are resolved in that key or value object. The solution then is to run a post reference resolution hook in that scenario.   


## Custom Representations

STON defines some conventions to use simpler representations for common value objects to produce both compact and readable output. Note that these custom representations do not add any new syntax, these are just objects. Some are required, the others are highly recommended. Implementations that lack certain target classes could use placeholders. Class tags do not necessarily have to correspond to actual classes.


### Collections

The general rule for collections is that they are represented by a list of their elements.

    OrderedCollection [ #a, #b, #c ]
    Set [ #c, #a, #b ]

The elements are obtained by standard enumeration while reconstruction is done by adding each element to an empty instance created upfront. Depending on the type, order is relevant.

For a number of collection subclasses the more natural map representation is chosed.

    OrderedDictionary { #a : 1, #b : 2, #c : 3 }

As noted earlier, Array and Dictionary, and only these exact classes, are treated special, they do not need a class tag since they directly and naturally represent the list and map concepts.

    [ #a, #b, #c ]
    { #a : 1, #b : 2, #c : 3 }

There are quite a few exceptions to this general rule in the collection hierarchy. Some more primitive types that happen to be collection subclasses are treated differently for obvious reasons: String, Symbol and ByteArray. Bag also has a special representation.

Some others are too special to be captured accurately as just a plain list of elements. Most of them revert back to general object behavior and use their instance variables as their representation like any STON object. Among them are Interval, RunArray and Text.

The list of exceptions is necessarily open ended, since new collection subclasses can be created freely.


### Class

Since class objects are complex and implementation dependent, STON represents classes using a singleton list with their symbol name.

    Class [ #ClassName ]

This gets resolved to the internal class object when read.

### Character

There is no special or additional literal constant for character objects, the elements of a string. STON represents character objects with a singleton list containing a string of length 1.

    Character [ 'a' ] 


### ByteArray

ByteArrays, used for opaque binary data, are represented with a singleton list containing the case independent hex representation.

    ByteArray [ 'efbbbf' ]


### Bag

Bags are represented by a map containing element/occurrences pairs. This more abstract representation hides the concrete implementation, is shorter and easier for humans to read and write and indicates the unordered nature of Bags.

    Bag { #a : 2, #b : 3 }


### Point

The classic 2 dimensional point is represented with a 2 element list, normally containing 2 numbers, the x and y component.

    Point [ 5, 10 ]


### Time

Simple time data is represented using a singleton list with a string in ISO style "HH:MM:SS.N" representation (with optional nanoseconds).

    Time [ '20:28:41' ]
    Time [ '20:28:41.063687' ]


### Date

The date object is represented using a singleton list with a string in ISO style "YYYY-MM-DD[+|-]hh:mm" representation (with timezone offset).

    Date [ '2018-10-29+01:00' ]


### DateAndTime

The timestamp (date and time) object is represented using a singleton list with a string in ISO style "YYYY-MM-DDTHH:MM:SS.N[+|-]" representation (with timezone offset and optional nanoseconds).

    DateAndTime [ '2018-10-29T20:30:35+00:00' ]
    DateAndTime [ '2018-10-29T20:30:35.899433+01:00' ]


### MimeType

RFC mime types use a singleton list with a string (with optional properties).

    MimeType [ 'text/plain' ]
    MimeType [ 'text/html;charset=utf-8' ]


### Color

The color object has 2 possible representations. Either a map with the properties red, green, blue and alpha as floats between 0 and 1, or a singleton list with a symbol naming a known color.

    Color [ #red ]
    Color { #red:1.0, #green:0.0, #blue:0.0, #alpha:0.4 }


### URL

General RFC URLs use a singleton list with a string of the URL.

    URL [ 'https://google.com/search?q=STON' ]

To prevent conflicts with an implementation class, an uppercase tag is used.


### FILE

Files on disk use a singleton list with a string of the full file path.

    FILE [ '/tmp/data/foo.txt' ]

To prevent conflicts with an implementation class, an uppercase tag is used.


## Semantic behaviour

In addition to the formal syntax and structural description, STON assumes semantic behaviour, beyond what was described above.

Reading STON class tags that do not exist in the receiving system normally results in a run time error. A reader can offer the option to turn such objects in generic dictionaries with an addition property called "className" to hold the tag.

While writing the properties of objects, those with nil values are normally skipped. This assumes that, when read back, those properties will be initialised to nil. A writer could offer some mechanism to write all properties, including those with nil values.

Class tags form a single global namespace, but do not necessarily have to correspond to actual implementation classes.   A decoupling between these 2 concepts is an essential part of STON.

Whitespace can occur between all syntactic elements, leaving room for optional pretty printing. 


## JSON Compatibility

STON is backwards compatible with JSON in the sense that an STON reader will transparently accept JSON. In particular:

- STON accepts double quotes are string and symbol delimiters
- STON accepts null as an alternative to nil

An STON writer can be configured to output JSON. In particular:

- Double quotes will be used to delimit strings
- Null will be used instead of nil
- Fractions and Scaled Decimals are written as floats
- Symbols will be written as strings
- Only Arrays and Dictionaries are allowed as composites
- Shared references in the object graph will be doubled
- Circular reference in the object graph will raise an error


## Syntax

This section lists all formal syntax rules grouped together in top down order.
 
    ston = primitive | list | association | map | object | reference
    primitive = number | string | symbol | boolean | nil
    number = integer | fraction | scaled-decimal | float
    integer = "0" | positive-integer | negative-integer
    positive-integer = decimal-digit-non-zero decimal-digit *
    negative-integer = "-" positive-integer
    decimal-digit-non-zero = "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
    decimal-digit = "0" | decimal-digit-non-zero
    fraction = nominator "/" denominator
    nominator = positive-integer | negative-integer
    denominator = positive-integer
    scaled-decimal = nominator "/" denominator "s" scale
    scale = positive-integer
    float = integer [ float-fraction ] [ float-exponent ] 
    float-fraction = "." decimal-digit *
    float-exponent = float-ee [ float-ee-sign ] positive-integer
    float-ee = "e" | "E"
    float-ee-sign = "+" | "-"
    string = "'" string-chars "'"
    string-chars = [ string-char | string-escape ] *
    string-char = < any Unicode char except "'" and "\" >
    string-escape = fundamental-string-escape | named-string-escape | optional-string-escape | unicode-string-escape
    fundamental-string-escape = "\\" | "\'"
    named-string-escape = "\b" | "\f" | "\n" | "\r" | "\t"
    optional-string-escape = "\/" | "\""
    unicode-string-escape = "\u" hex-digit hex-digit hex-digit hex-digit
    hex-digit = decimal-digit | "A" | "B" | "C" | "D" | "E" | "F" | "a" | "b" | "c" | "d" | "e" | "f"
    symbol = simple-symbol | generic-symbol
    simple-symbol = "#" simple-symbol-char
    simple-symbol-char = uppercase-letter | lowercase-letter | decimal-digit | "-" | "_" | "." | "/"
    lowercase-letter = "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z"
    uppercase-letter = "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z"
    generic-symbol = "#" string
    boolean = "true" | "false"
    nil = "nil"
    list-elements = ston | ston "," list-elements
    list = "[" "]" | "[" list-elements "]"
    association = ston ":" ston
    map = "{" "}" | "{" associations "}"
    associations = association | association "," associations
    object = class-tag object-representation
    class-tag = uppercase-letter class-tag-char *
    class-tag-char = uppercase-letter | lowercase-letter | decimal-digit | "_"
    object-representation = list | map
    reference = "@" positive-integer
