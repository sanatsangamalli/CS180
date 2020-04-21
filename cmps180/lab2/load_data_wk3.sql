COPY Movies from stdin USING DELIMITERS '|';
pretty woman|1990|119|true|disney|999
monsters inc.|1990|119|true|dreamworks|233
jurassic park|1998|145|null|disney|675
hercules|2014|130|true|MGM|362
avatar|2009|123|null|20th century fox|917
me before you|2016|125|null|MGM|872
\.

COPY StarsIn from stdin USING DELIMITERS '|';
pretty woman|1990|julia roberts
avatar|2009|stephen lang
avatar|2009|zoe saldana
monsters inc.|1990|john goodman
me before you|2016|emilia clarke
avatar|2009|sam worthington
\.

COPY MovieStar from stdin USING DELIMITERS '|';
sam worthington|perth|M|1976-08-02
stephen lang|new york|M|1952-07-11
zoe saldana|new jersey|F|1978-06-19
\.

COPY MovieExec from stdin USING DELIMITERS '|';
johnathon glickman|los angelos|456|550000000
christopher DeFaria|glendale|371|349000000
\.

COPY Studio from stdin USING DELIMITERS '|';
MGM|los angelos|456
disney|los angelos|783
dreamworks|glendale|123
\.