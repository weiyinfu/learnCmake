#include<iostream>
#include"build/conf.h"
using namespace std;
#ifdef USE_MYMATH
void one(){
    cout<<"one"<<endl;
}
#else
void one(){
    cout<<"two"<<endl;
}
#endif
int main(){
    one();
    return 0;
}