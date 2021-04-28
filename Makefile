TARGET=flp20-log
SOURCE=inputParser.pl hamCycle.pl main.pl
GOAL=start

TEST_MODULE=testModule.pl
TEST_GOAL=test
ARCHIVE=flp-log-xlanic04.zip


default:
	swipl -q --goal=${GOAL} -o ${TARGET} -c ${SOURCE} 
	./flp20-log < ./testIn/0.in

test:
	swipl -q --goal=${TEST_GOAL} -o ${TARGET} -c ${SOURCE} ${TEST_MODULE}
	./flp20-log	

pack:
	zip -r ${ARCHIVE} README Makefile hamCircle.pl test

clean:
	rm ${TARGET} ${ARCHIVE}