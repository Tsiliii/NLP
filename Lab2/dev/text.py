def main():
	w = open("text.txt","w+")
	r = open("uttids.txt","r")
	trans = open("transcription.txt","r")
	r1 = r.readlines()
	trans1 = trans.readlines()
	for i in r1:
		s = ' ' + str(trans1[int(i[16] + i[17]+i[18]) - 1]) + "\n"
		w.write(i.splitlines()[0] + s)

if __name__ == "__main__":
	main()
