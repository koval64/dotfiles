import urllib.request
from bs4 import BeautifulSoup

def print_table(table,tags):
    trs = table.find_all('tr')
    for r in trs:
        tds = r.find_all('td')
        if len(tds) > 0:
            waluta = tds[0].text[0:3]
            if waluta in tags:
                nazwa = tags[waluta]
                skup = tds[2].text[0:-2].replace(',','.')
                sprzedaz = tds[3].text[0:-2].replace(',','.')
                print('   {:>3}  {:5}     {:8}    {:6}'.format(waluta,nazwa,skup,sprzedaz))

if __name__ == "__main__":
    site = 'https://internetowykantor.pl/kursy-walut/'
    fh = urllib.request.urlopen(site)
    content = fh.read()
    soup = BeautifulSoup(content,'html5lib')
    tAll = soup.find_all('table')
    tags = {'USD':'Dolar',
            'EUR':'Euro',
            'CHF':'Frank',
            'CNY':'Juan',
            'RUB':'Rubel'
            }
    print_table(tAll[0],tags)
    print_table(tAll[1],tags)


