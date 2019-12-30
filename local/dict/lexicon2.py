from string import maketrans

def main():
	w = open("nonsilence_phones.txt","w+")
	w2 = open("lexicon2.txt","w+")
	r = open("uttids.txt","r")
	trans = open("transcription.txt","r")
	lex = open("lexicon.txt","r")
	diction = set()
	for i in lex:
		i = (' '.join(i.split())).split()
		for j in range(1,len(i)):
			diction.add(i[j])
	a = list(diction)
	a.sort()
	for item in a:
		w.write(item + '\n')
		w2.write(item + ' ' + item + '\n')

if __name__ == "__main__":
	main()
