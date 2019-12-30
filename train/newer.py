def main():
	w = open("uttids1.txt","w+")
	r = open("uttids.txt","r")
	r1 = r.readlines()
	for i in r1:
		s = ' ' + i[13] + i[14] + "\n"
		w.write(i.splitlines()[0][13:19] + '\n')

if __name__ == "__main__":
	main()
