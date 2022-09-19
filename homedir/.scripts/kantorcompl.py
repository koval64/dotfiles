import urllib.request
from bs4 import BeautifulSoup

def print_gold_table(table,startRow=0,endRow=0):
    tRows = table.find_all('tr')
    if endRow == 0: endRow = len(tRows)
    out = []
    for tr in tRows[startRow:endRow]:
        f = tr.find_all('td')
        f1 = f[1].text.replace('.00','') 
        f2 = f[2].text.replace('.00','')
        out.append('GLD {:>6}  {:>10}  {:>10}'.format(f[0].text,f1,f2))
    return out

def print_currency_table(table,tags):
    tRows = table.find_all('tr')
    out = []
    for tr in tRows:
        f = tr.find_all('td')
        f1 = f[1].text
        if f1 in tags.keys():
            f0 = tags[f1]
            f2 = f[2].text
            f3 = f[3].text
            out.append('{:>3}  {:5}   {:8}  {:6}'.format(f1,f0,f2,f3))
    return out

if __name__ == "__main__":
    fh = urllib.request.urlopen('https://kantor.com.pl/')
    content = fh.read()
    soup = BeautifulSoup(content,'html5lib')

    tAll = soup.find_all('table')
    tags = {'USD':'Dolar',
            'EUR':'Euro',
            'CHF':'Frank',
            'CNY':'Juan',
            'RUB':'Rubel'
            }

    t1 = print_currency_table(tAll[0],tags)
    t2 = print_gold_table(tAll[2],3,7)
    max_len = max(len(t1), len(t2))
    while len(t1) < max_len:
        t1.append('')
    while len(t2) < max_len:
        t2.append('')

    tf = list(zip(t1,t2))
    for line in tf:
        print("   " + "     |     ".join(line))




