TARGET=flp20-log
SOURCE=main.pl
#SRC=verify.pl
GOAL=start
#GOAL=go

default:
	swipl -q -g ${GOAL} -o ${TARGET} -c ${SRC}
	./flp20-log < in3