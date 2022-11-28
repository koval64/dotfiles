#!/usr/bin/python3

notes = []

# p - print
# a - add
# r - remove
# d - remove

class Notes:

    def __init__(self) -> None:
        self.notes = []

    def print_notes(self):
        print()
        print( "\n".join([ "%s) %s" % (i, v) for (i, v) in enumerate( self.notes ) ]) )
        print()

    def clear(self):
        self.notes.clear()
        print( 'notes empty' )

    def add_note(self, note):
        self.notes.append( note )

    def remove_note(self, numbers_list):
        numbers_list.sort()
        numbers_list.reverse()
        if len( numbers_list ) > 0:
            for number in numbers_list:
                self.notes.pop( int( number ) )
                print( f'{number}   note removed' )

    # def remove_note(self, index):
    #     self.notes.pop( index )

    def help(self):
        print("add   remove   load   save   print   clear   help   quit")
        print()

def main():
    notes = Notes()
    notes.help()

    while True:
        res = input("> notes | h help > ").split()

        if len(res) == 0:
            continue

        cmd = res[0]
        if cmd.startswith('q'):
            exit(0)

        if len( res ) > 1:
            if cmd.startswith('r'):
                notes.remove_note( res[1:] )
            elif cmd.startswith('a'):
                notes.add_note( ' '.join( res[1:] ) )
        else:
            if cmd.startswith('p'):
                notes.print_notes()
            elif cmd.startswith('c'):
                notes.clear()
            elif cmd.startswith('h'):
                notes.help()


if __name__ == "__main__":
    main()

