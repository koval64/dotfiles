#!/usr/bin/python3

notes = []

# print notes
def n():
    print( "\n".join([ "%s) %s" % (i, v) for (i, v) in enumerate( notes ) ]) )

# add note
def a( note ):
    notes.append( note )

# remove note
def r( index ):
    notes.pop( index )

# remove note
def d( index ):
    r( index )

