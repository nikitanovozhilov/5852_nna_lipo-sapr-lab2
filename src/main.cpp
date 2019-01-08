#include <string>
#include <iostream>
#include <pcrecpp.h>
#include "MacrosFinder.h"

int main(int argc, char* argv[]) 
	{
		MacrosFinder Finder;
		std::cout << Finder.FindMacros() << std::endl;
		return 0;
	}