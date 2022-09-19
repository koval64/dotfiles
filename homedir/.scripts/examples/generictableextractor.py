import urllib.request
from bs4 import BeautifulSoup

def print_table(table):
    trs = table.find_all('tr')
    for r in trs:
        tds = r.find_all('td')
        if len(tds) > 0:
            out = []
            for data in tds:
                out.append(data.text)
            print(" ".join(out))

if __name__ == "__main__":
    site = 'https://internetowykantor.pl/kursy-walut/'
    fh = urllib.request.urlopen(site)
    content = fh.read()
    soup = BeautifulSoup(content,'html5lib')
    tAll = soup.find_all('table')
    print_table(tAll[0])

