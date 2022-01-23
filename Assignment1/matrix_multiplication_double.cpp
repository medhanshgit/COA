#include <iostream>
#include <vector>
#include <string>

using namespace std;

double arr1[1000][1000];
double arr2[1000][1000];
double ans[1000][1000];

double sum(int i,int j,int n){
    int s = 0;
    for(int k=1;k<=n;k++){
        s = s + arr1[i][k]*arr2[k][j];
    }
    return s;
}

// int matmult(int n){
//     for(int i = 1;i<=n;i++){
//         for(int j=1;j<=n;j++){
//             ans[i][j] = sum(i,j,n);
//         }
//     }
//     return 0;
// }

int main(){
    struct timespec start, end;
    int n;
    int arr[] = {32, 64, 128, 256,512};
    cout<<"Choose an option"<<endl;
    cout<<"1:32"<<endl;
    cout<<"2:64"<<endl;
    cout<<"3:128"<<endl;
    cout<<"4:256"<<endl;
    cout<<"5:512"<<endl;
    cin>>n;
    int num = arr[n-1];
    //cout<<num;

    timespec_get(&start, TIME_UTC);
    for(int i = 1;i<=num;i++){
        for(int j=1;j<=num;j++){
            arr1[i][j] = rand()%100;
            arr2[i][j] = rand()%100;
        }
    }

    //matmult(num);
    for(int i = 1;i<=num;i++){
        for(int j=1;j<=num;j++){
            ans[i][j] = sum(i,j,num);
        }
    }
    for(int i = 1;i<=num;i++){
        for(int j=1;j<=num;j++){
            cout<<ans[i][j]<<" ";
        }
    }
    timespec_get(&end, TIME_UTC);
    
    double total_time;
    total_time = (end.tv_sec - start.tv_sec) * 1e9;
    total_time = (total_time + (end.tv_nsec - start.tv_nsec)) * 1e-9;
    cout <<endl<< "Total time taken is : " << total_time << "s";

    return 0;
}