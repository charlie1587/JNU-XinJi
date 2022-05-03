#include<iostream>
#include<queue>
#define f(i,a,b) for(int i=a;i<b;i++) 
#define ct cout
using namespace std;
struct Tb{  // 表格的结构体 
	int num,l,srt,s;// 编号、长度、开始、状态(0未分配，1分配) 
	bool operator < (const Tb& b)const{return l>b.l;} // 重载 < 
};
class B{  // 类 
private:
	int n;    // 分区数 
	Tb* T; // 表 
	priority_queue<Tb> Q; //排序的队列 
public:
	B();          // 输入 
	void Alloc();     // 分配 
	void Free();      // 回收 
	void ShowTable(); // 展示		
};
int main(){
	B Bl;
	while(1){
		ct<<"\n**************************\n";
		ct<<"what do you wang to do?\n";
		ct<<"   1 分配空间\n"<<"   2 释放空间\n";
		ct<<"   3 显示分区说明表\n"<<"   4 退出\n";
		ct<<"you input :   ";
		int tp;cin>>tp;
		if(tp==1)Bl.Alloc();
		else if(tp==2)Bl.Free();
		else if(tp==3)Bl.ShowTable();
		else break;
	} 
}
B::B(){// 读入数据 
	ct<<"请输入分区数：\n";cin>>n;
	T=new Tb[n];
	f(i,0,n){
		ct<<"分区号No."<<i<<":\n"<<"请输入分区长度：";
		cin>>T[i].l;
		ct<<"输入分区起始地址：";
		cin>>T[i].srt;
		T[i].s=0;T[i].num=i;
	}
} 
void B::ShowTable(){ // 展示数据 
	ct<<"\n 区号 \t 长度 \t 始址 \t 状态 \n";
	f(i,0,n){
	printf("|%d\t|%d\t",T[i].num,T[i].l); 
	printf("|%d\t|%d\t\n",T[i].srt,T[i].s); 
	}
}
void B::Alloc(){ //分配 
	f(i,0,n)if(T[i].s==0)Q.push(T[i]);
	int bn,fg=0,cnt=0;
	ct<<"(1) Malloc: how many do you want:(K)   ";
	cin>>bn;
	while(!Q.empty()){
		Tb tp=Q.top();
		Q.pop();
		if(bn<=tp.l&&fg==0){
			ct<<"分配成功,分区号是："<<tp.num<<endl;
			fg=1;
			T[tp.num].s=1;
		}
	}
	if(fg==0)ct<<"分配失败\n";
}
void B::Free(){ // 回收 
	ct<<"(2) Free: where do you want to free:";
	int handle;cin>>handle;
	f(i,0,n)if(T[i].s==1){
		ct<<"释放成功\n";
		T[i].s=0;
		return; 
	}
	ct<<"释放失败\n";
}
