def main():
	w = open("wav.scp","w+")
	r = open("uttids","r")
	r1 = r.readlines()
	for i in r1:
		s = ' /home/tsilipc/kaldi/egs/usc/data/wav/' + i[0] + i[1] + '/usctimit_ema_' + i[0] + i[1] + '_' + i[3] + i[4] + i[5] + '.wav' + "\n"
		w.write(i.splitlines()[0] + s)

if __name__ == "__main__":
	main()
