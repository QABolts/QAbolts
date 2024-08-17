from robot.running import TestSuiteBuilder
from robot.model import SuiteVisitor
import json


class TestCasesFinder(SuiteVisitor):
    def __init__(self):
        self.tests = []

    def visit_test(self, test):
        self.tests.append(test)


builder = TestSuiteBuilder()
testsuite = builder.build('tests/')
finder = TestCasesFinder()
testsuite.visit(finder)
i = 0
tests_in_file = 20
file_number = 1
tests_list = []
while i < len(finder.tests):
    
    
    
    testcases_list = open (f'tests_list_{file_number}.bat','w', encoding='utf8')
    specific_tests = ""
    for test in finder.tests[i:i+tests_in_file]:
        specific_tests+=f' -t \'{test.name}\' '
    tests_list.append(specific_tests)
    testcases_list.write(f'pabot --testlevelsplit --processes {tests_in_file} --listener resources/libs/robotListener.py {specific_tests} tests')

    # testcases_list.write('\n'.join([test.name for test in finder.tests[i:i+tests_in_file]]))
    i+=tests_in_file
    file_number+=1
print (json.dumps(tests_list))
# testcases_list = open (f'tests_list.txt','w', encoding='utf8')
# testcases_list.write('\n'.join([test.name for test in finder.tests]))