#include <iostream>
#include <vector>
#include <string>

using namespace std;

long double fibbo(int n){
    long double small1 = 1;
    long double small2 = 1;
    long double ans = 0;
    if(n==1){
        return small1;
    }
    else if(n==2){
        return small2;
    }
    for(int i=3;i<=n;i++){
        ans = small1 + small2;
        small1 = small2;
        small2 = ans;
    }
    return ans;
}

int main(){
    // int n;
    // cin>>n;
    for(int i = 0;i<100;i++){
        cout<<i+1<<":"<<fibbo(i)<<endl;
    }
    return 0;
}