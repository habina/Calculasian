from bs4 import BeautifulSoup
from urllib.request import urlopen
page = urlopen("https://www.youtube.com/user/calculasianofficial/videos")
soup = BeautifulSoup(page)
allA = soup.findAll('a')
myset = set()
for links in allA:
	a = links.get('href')
	if 'watch' in a:
		myset.add(a[9:20])
print(myset)






