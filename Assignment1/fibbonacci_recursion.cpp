#include <iostream>
#include <vector>
#include <string>

using namespace std;

long long int fibbo(int n){
    if(n==0 or n==1){
        return n;
    }
    long long int smalloutput = fibbo(n-1) + fibbo(n-2);
    return smalloutput;
}   

int main(){

    //int n = 100;
    //cin>>n;
    
    for(int i = 0;i<41;i++){
        cout<<i+1<<":"<<fibbo(i)<<endl;
    }
    return 0;
}