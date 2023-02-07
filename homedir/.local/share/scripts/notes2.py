#!/usr/bin/python3

from random import randint

norm = '\033[0m'

# format help string:
# - light up first char in space separated string
# - separate by 3 spaces
def format_help(text):

    # randomize first character background color
    backlight_color = str( randint(0,7) )

    if backlight_color == '0':
        back = ''
    else:
        back = '\033[30;4' + backlight_color + 'm'

    return '   '.join( [ back + c[0] + norm + c[1:] for c in text.split() ] )

class HappyNumber:

    def __init__(self):
        self.used_numbers = []

    def add(self, number):
        if number in self.used_numbers:
            print( f'{number}  already used' )
        else:
            if number in range(1,101):
                self.used_numbers.append(number)
                print( f'{number}   added' )
            else:
                print("only numbers in range(1, 100)")

    def clear(self):
        self.used_numbers.clear()
        print( 'notes empty' )

    def remove(self, number):
        if number in self.used_numbers:
            self.used_numbers.remove(number)
            print( f'{number}   removed' )

    def exclude(self, numbers_list):
        if len( numbers_list ) > 0:
            for number in numbers_list:
                self.remove( int( number ) )

    def extend(self, numbers_list):
        if len( numbers_list ) > 0:
            for number in numbers_list:
                self.add( int( number ) )

    # 1 - 100
    def show(self):
        print()
        for y in range(0,10):
            line = []
            for x in range(1,11):
                num = y * 10 + x
                if num in self.used_numbers:
                    line.append( "%02s" % num )
                else:
                    line.append("  ")
            print( " ".join(line) )
        print()

    def load(self):
        try:
            with open( 'happy number backup.txt' ) as f:
                self.used_numbers = list( map( int, f.read().split() ) )
            print( 'loading...' )
        except IOError: 
            print( "Error: File not found." )

    def save(self):
        self.used_numbers.sort()
        fh = open( 'happy number backup.txt', 'w' )
        for number in self.used_numbers:
            fh.write( '%s ' % number )
        fh.close()
        print( 'saving...' )

    def help(self):
        # print("add   remove   load   save   print   clear   help   quit")
        commands = "add remove load save print clear help quit"
        print(format_help(commands))
        print()

def main():

    happy_number = HappyNumber()
    happy_number.help()

    while True:
        res = input("> happy number | h help > ").split()

        if len(res) == 0:
            continue

        cmd = res[0]
        if cmd.startswith('q'):
            exit(0)

        if len( res ) > 1:
            if cmd.startswith('a'):
                happy_number.extend( res[1:] )
            elif cmd.startswith('r'):
                happy_number.exclude( res[1:] )
        else:
            if cmd.startswith('l'):
                happy_number.load()
            elif cmd.startswith('s'):
                happy_number.save()
            elif cmd.startswith('p'):
                happy_number.show()
            elif cmd.startswith('c'):
                happy_number.clear()
            elif cmd.startswith('h'):
                happy_number.help()

if __name__ == "__main__":
    main()

