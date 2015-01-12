#!/usr/bin/python
import re

COUNT = 0

@outputSchema("author:chararray")
def first_split(word):
    p = re.compile('\["\S+", \[(["\S\s?"]*)\], \S+\]')
    m = p.match(word)
    output = ''
    if m != None :
        if m.group(1) :
            a_list = m.group(1).split(', ')
            for word in a_list :
                word = word.strip('"')
                output = output + word +','
            output = output.strip(',')
        return output
    else :
        return


