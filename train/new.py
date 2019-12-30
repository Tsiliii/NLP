def main():
	w = open("utt2spk.txt","w+")
	r = open("uttids.txt","r")
	r1 = r.readlines()
	for i in r1:
		s = ' ' + i[13] + i[14] + "\n"	
		w.write(i.splitlines()[0] + s)
	
if __name__ == "__main__":
	main()
