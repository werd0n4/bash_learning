#! /bin/bash

tee main.cpp <<input
#include <iostream>
#include <vector>
#include "MyClass.cpp"

//main function
int main() {
    std::cout << "Hello World!" << std::endl;

    // Do some work
    // ...
    // end
    std::cout << "My birthday is 30-04-1997 and my brother's is 16-12-1991" << std::endl;
    std::cout << "Today is 24-05-2020" << std::endl;

    return 0;
}
input