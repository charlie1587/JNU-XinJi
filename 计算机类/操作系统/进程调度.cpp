#include<iostream>
#include<string>
#include<queue> 
using namespace std;
#define f(i,a,b) for(int i=a;i<b;i++) 
struct PCB{
	string Na; //名字 
	int P,Ar,Rt,Rta,Sta;        
    //优先数到达时间 运行时间 已运行时间 状态（0运行 1就绪 2完成 ） 
	bool operator<(const PCB& b) const{return P<b.P;}
}; 
priority_queue<PCB> Q; //就绪队列
void Print_PCB(PCB A);
bool fc(PCB* P,int n,int ti); 
int main(){
	int n;            // 进程数 
	cout<<"请输入进程数："<<endl;cin>>n;
	PCB* P=new PCB[n];// PCB结构 
	cout<<"请输入进程名字、优先数、到达时间、需要运行时间："<<endl;
	f(i,0,n){ // 输入信息 
		cin>>P[i].Na>>P[i].P>>P[i].Ar>>P[i].Rt;
		P[i].Rta=0;P[i].Sta=2;
	}
	f(i,0,100)if(fc(P,n,i))break;
} 
void Print_PCB(PCB A){
	cout<<"-----------------------"<<endl;
	cout<<"进程名称："<<A.Na<<endl;
	cout<<"优先数："<<A.P<<endl;
	cout<<"到达时间："<<A.Ar<<endl;
	cout<<"需运行时间："<<A.Rt<<endl;
	cout<<"已运行时间："<<A.Rta<<endl;
	cout<<"状态:"; 
	if(A.Sta==1) cout<<"运行"<<endl;
	else if(A.Sta==2) cout<<"就绪"<<endl;
	else cout<<"完成"<<endl; 
}
bool fc(PCB* P,int n,int ti){
	// 若进程已经到达且未完成，加入就绪队列 
	f(i,0,n)if(P[i].Ar<=ti&&P[i].Sta!=3)Q.push(P[i]);	
	PCB temp=Q.top();	// 得到最高优先级 
	int ct;
	f(i,0,n)if(P[i].Na==temp.Na)ct=i;
	P[ct].Sta=1; // 成为运行状态 
	Q.pop();           // 弹出队列首 
	cout<<"****************"<<"时刻"<<ti<<"********************"<<endl;
	cout<<"当前正在运行的程序为："<< temp.Na<<endl;        // 运行 
	cout<<"就绪队列：";                                      // 就绪队列 
	while(!Q.empty()){
		PCB t=Q.top();
		cout<<t.Na<<" ";
		Q.pop();
	}
	cout<<endl; 
	f(i,0,n)Print_PCB(P[i]); // 打印状态 
	P[ct].Rta+=1;         // 运行时间+1 
	P[ct].P-=1;           // 优先级-1 
	if(P[ct].Rta>=P[ct].Rt) P[ct].Sta=3;// 完成 
	else P[ct].Sta=2;  //就绪状态 	
	f(i,0,n)if(P[i].Sta!=3)return false;// 修改状态 
	cout<<"全部完成！！！"; 
	return true;
}

