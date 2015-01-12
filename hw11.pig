REGISTER 'udf.py' USING jython AS myfuncs;

data = LOAD '$input' AS (works:chararray);
author = FOREACH data GENERATE flatten(TOKENIZE(myfuncs.first_split(works),',')) AS word;
a_list = GROUP author BY word;
a_count = FOREACH a_list GENERATE COUNT(author), group;
a_order_list = ORDER a_count BY $0 DESC;
result = LIMIT a_order_list 100;
STORE result INTO '$output';
