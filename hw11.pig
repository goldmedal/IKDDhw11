register 'udf.py' using jython as myfuncs;

a = LOAD 'dblp.json' as (works:chararray);
b = foreach a generate flatten(TOKENIZE(myfuncs.first_split(works),',')) as word;
c = group b by word;
d = foreach c generate COUNT(b), group;
e = order d by $0 DESC;
f = limit e 100;
store f into 'answer';
