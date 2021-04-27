TARGET=flp20-log
SOURCE=inputParser.pl hamCircle.pl
ARCHIVE=flp-log-xlanic04.zip
GOAL=start

default:
	swipl -q --goal=${GOAL} -o ${TARGET} -c ${SOURCE} 
	./flp20-log < ./test/0.in

pack:
	zip -r ${ARCHIVE} README Makefile hamCircle.pl test

clean:
	rm ${TARGET} ${ARCHIVE}