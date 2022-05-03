#include<iostream>
#include<queue>
#include<string>
#define f(i,a,b) for(int i=a;i<b;i++) 
using namespace std;
struct JCB{
	string Na;
	int ar,ser,stt,edt,tl,sts;
	double tl_w;
	bool operator<(const JCB& b) const{return ar>b.ar;}
}; 
void Print_jcb(JCB A){
	cout<<A.Na<<"\t"<<A.ar<<"\t"<<A.ser<<"\t";
	cout<<A.stt<<"\t"<<A.edt<<"\t"<<A.tl<<"\t";
	cout<<A.tl_w<<endl;
}
int main(){
	int n,t=0;
	double at,atw;
	cout<<"请输入作业数：\n";cin>>n;
	JCB* J=new JCB[n];
	cout<<"输入作业名字，到达时间，服务时间"<<endl;
	f(i,0,n){
	cin>>J[i].Na>>J[i].ar>>J[i].ser;J[i].sts=0;}
	while(1){
		priority_queue<JCB> P;
		f(i,0,n)if(J[i].ar<=t&&J[i].sts==0)P.push(J[i]);
		JCB jcb=P.top();
		int ct;
		f(i,0,n)if(J[i].Na==jcb.Na)ct=i;
		J[ct].stt=t;
		J[ct].edt=t+J[ct].ser;
		J[ct].tl=J[ct].edt-J[ct].ar;
		J[ct].tl_w=1.0*J[ct].tl/J[ct].ser;
		J[ct].sts=1;
		bool flag=false;
		f(i,0,n) if(J[i].sts==0){
			t=J[ct].edt;
			flag=true;
			break;
		}
		if(!flag)break;
	}
	cout<<"名字\t服务时间\t开始时间\t结束时间\t周转时间\t带权周转时间"<<endl;
	f(i,0,n){
	Print_jcb(J[i]);at=at+J[i].tl;atw+=J[i].tl_w;
	}
	cout<<"平均周转时间："<<1.0*at/n<<endl;
	cout<<"平均带权周转时间："<<atw/n<<endl;
} 
