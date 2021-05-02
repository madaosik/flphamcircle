TARGET=flp20-log
SOURCE=inputParser.pl hamCycle.pl main.pl
GOAL=start

TEST_MODULE=testModule.pl
TEST_GOAL=test
ARCHIVE=flp-log-xlanic04.zip


default:
	@swipl -q --goal=${GOAL} -o ${TARGET} -c ${SOURCE} 
	@./flp20-log < ./testIn/0.in

test:
	@echo "\e[1;35mUNIT TESTS\e[0m \n"
	@swipl -q --goal=${TEST_GOAL} -o ${TARGET} -c ${SOURCE} ${TEST_MODULE}
	@./flp20-log
	@echo "\e[1;35m----------------------------------------------------------\e[0m \n"
	@swipl -q --goal=${GOAL} -o ${TARGET} -c ${SOURCE}
	@echo "\e[1;35mOVERALL TESTS WITH DIFFERENT GRAPH INPUTS\e[0m \n"
	@./test_runner		

pack:
	zip -r ${ARCHIVE} README Makefile hamCycle.pl inputParser.pl main.pl test_runner testModule.pl testIn testOut

clean:
	rm ${TARGET} ${ARCHIVE}