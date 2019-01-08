#include <string>
#include <iostream>
#include <pcrecpp.h>
#include "MacrosFinderTester.h"

int main(int argc, char* argv[]) 
	{
		CppUnit::Test *test = CppUnit::TestFactoryRegistry::getRegistry().makeTest();
		CppUnit::TextTestRunner runner;
		runner.addTest(test);
		
		runner.run();
	}