initialization
convertNewLines: boolean
	"When true, any newline CR, LF or CRLF read unescaped inside strings or symbols
	will be converted to the newline convention chosen, see #newLine:
	The default is false, not doing any conversions."

	convertNewLines := boolean