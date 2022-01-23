#include <iostream>
#include <vector>
#include <string>

using namespace std;

long double arr[101];
long double fibbo(int n){
    if(n==0 || n==1){
        return n;
    }
    if(arr[n] != -1){
        return arr[n];
    }
    arr[n] = fibbo(n-1) +fibbo(n-2);
    return arr[n];

}   

int main(){
    for(int i = 0;i<101;i++){
        arr[i] = -1;
    }
    int n = 100;
    //cin>>n;
    for(int i = 0;i<n;i++){
        cout<<i+1<<":"<<fibbo(i)<<endl;
    }
    return 0;
}