#include <iostream>
#include <vector>
#include <string>

using namespace std;

long double arr[101];

long double fibbo(int n){
    arr[0] = 0;
    arr[1] = 1;
    if(n == 0 or n==1){
        //arr[n] = n; 
        return n;
    }
    else if(arr[n] != -1){
        return arr[n];
    }
    else{
        int i = 1;
        long double small2 = 0;
        long double small1 = 1;
        long double ans = 0;
        while(i<=n){
            while(arr[i] != -1){
                small1 = arr[i];
                small2 = arr[i-1];
                i++;
            }
            
            ans = small1 + small2;
            arr[i] = ans;
            small2 = small1;
            small1 = ans;
            i++;  
        }
    return arr[n];
    }
}

int main(){
    // int n;
    // cin>>n;
    for(int i =0;i<101;i++){
        arr[i] = -1;
    }
    for(int i = 0;i<100;i++){
        cout<<i+1<<":"<<fibbo(i)<<endl;
    }
    return 0;
}