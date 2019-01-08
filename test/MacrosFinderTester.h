#ifndef TESTER_H
#define TESTER_H

#include <cppunit/extensions/TestFactoryRegistry.h>
#include <cppunit/ui/text/TextTestRunner.h>
#include <cppunit/extensions/HelperMacros.h>
#include "../src/MacrosFinder.h"

class MacrosFinderTester : public CppUnit::TestCase
	{
		public:
			void TestFindMacros() 
			{
				const char* ErrorMessage = "MacrosFinder::FindMacros (arg == stdin) : 'NORMcrNOT NORMcrTRUE' expected";
				
				MacrosFinder Finder;
				string List = Finder.FindMacros();
				string ExpectedList = "NORM\nNOT_NORM\nTRUE";
				
				CPPUNIT_ASSERT_MESSAGE(ErrorMessage, List == ExpectedList);
			};
			
			CPPUNIT_TEST_SUITE( MacrosFinderTester );
			CPPUNIT_TEST( TestFindMacros );
			CPPUNIT_TEST_SUITE_END();
	};

CPPUNIT_TEST_SUITE_REGISTRATION( MacrosFinderTester );

#endif