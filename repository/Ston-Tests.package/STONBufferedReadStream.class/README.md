I am STONBufferedReadStream.

I wrap another ReadStream and add efficient buffering for the typical access pattern of parsers working on character streams: sending lots of #next, #peek and #atEnd messages. 