#include<iostream>
#include<map>
#define N 969
using namespace std;

string A[N],B[N];
int a[N],b[N];
int w[N];
int cnt=0;
int main(){
    map<string,int> M;
    for(int i=0;i<N;i++){
        cin>>A[i]>>B[i]>>w[i];
        if(M.count(A[i])==0)M[A[i]]=cnt++;
        if(M.count(B[i])==0)M[B[i]]=cnt++;
        a[i]=M[A[i]];
        b[i]=M[B[i]];
    }
    for(int i=0;i<N;i++){
        cout<<a[i]<<"\t"<<b[i]<<"\t"<<w[i]<<endl;
    }
}