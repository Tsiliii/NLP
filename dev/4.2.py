from string import maketrans

def main():
	w = open("text1.txt","w+")
	r = open("uttids.txt","r")
	trans = open("transcription.txt","r")
	lex = open("lexicon.txt","r")
	diction = {}
	for i in lex:
		i = (' '.join(i.split())).split()
		temp = 'sil '		
		for j in range(1,len(i)-1):
			temp = temp + i[j] + ' '
		temp = temp + i[len(i)-1] + ' sil'
		diction.update({i[0].lower():temp})
	r1 = r.readlines()
	trans1 = trans.readlines()
	for i in r1:
		s = ' ' + str(trans1[int(i[16] + i[17]+i[18]) - 1]) + "\n"	
		s = s.replace('.',' ').replace('!',' ').replace('?',' ').replace(':',' ').replace(',',' ').replace('-',' ')
		s = (' '.join(s.split())).split()	
		temp = ''
		for j in s:
			temp = temp + diction[j.lower()] + ' '
		temp = '<s> ' + temp + '</s>' + '\n'
		w.write(temp)		
if __name__ == "__main__":
	main()
