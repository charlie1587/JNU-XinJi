#ifndef BLOCK_CHAIN_H
#define BLOCK_CHAIN_H

#include "md5.h"
#include <iostream>
#include <vector>

using namespace std;
struct Block;
struct LightBlock;

// 用户基类
class User {
	int nonce;         // 执行交易次数
	double balance;    // 持币数量
	string storageRoot;// Merkle树的根节点的值
public:
	User(double bal);
	double GetBalance();         // 得到币
	void ChangeBalance(double b);// 更改币
	void AddNonce();             // 增加交易次数
	string ToString(); // 把所有信息变为string
};
// 完整用户
class FullUser :public User {
	Block* mB;       // 完整区块链
	string name;
public:
	FullUser(double bal,string str);
	void ShowInformation();
	void UpdateBook(Block* nmb);
};
// 轻量级用户
class LightUser :public User {
	LightBlock* mLB; // 轻量级区块链
	string name;
public:
	LightUser(double bal, string str);
};
// 矿工
class Miner :public User {
	double comp;  // 算力
	Block* mB;    // 存储的区块链
public:
	Miner(double c, double bal);
	double GetComp();
	void UpdateBook(Block* bptr);
};
// 交易
class Trade {
	int uid1, uid2, id;
	double gas;         // 交易费用
public:
	Trade(int u1, int u2, int s, double g);
	string ToString();
};
// 物品
class Stuff {
	int code;         // 唯一编号（Merkle树位置）
	string name;      // 名字
	vector<string> Info; // 产品链
public:
	Stuff(int c, string n);
	Stuff(int c, string n, int u, int t);// 用户创建物品
	void AddInfo(string str);            // 添加信息
	void ShowAllInfo();                  // 展示所有信息
	void ShowBriefInfo();                // 展示概要
	string ToString();
};


// Merkle
template<class T>
class MerkleTree{
	vector<T> Vdata;               // 存放数据
	vector<vector<string> > MT;    // 存放Merkle树结构
public:
	MerkleTree();                       // 初始化
	MerkleTree(MerkleTree &M);          // 拷贝构造
	void Insert(T data);                // 插入
	void Change(int indx, T newData);   // 改变节点值
	void Update();                      // 更新
	string GetHead();                   // 返回头节点哈希
	int GetSize();                      // 返回节点个数
};

// 完整区块
class Block {
	int t;                      // 时间
	MerkleTree<User> MerUser;   // 用户树
	MerkleTree<Stuff> MerStuff; // 物品树
	MerkleTree<Trade> MerTrade; // 交易树
	Block* before;
public:
	Block() { t = 0; before = NULL; };
	Block(Block& b2);           // 深拷贝
	void SetTime(int ti);       // 设置时间
	void InputUser(User u);     // 插入用户
	string GetUserHead();       // 返回用户树头节点哈希
	void InputStuff(Stuff s);   // 插入物品
	string GetStuffHaed();      // 得到物品树头节点哈希
	void InputTrade(Trade t);   // 插入交易
	string GetTradeHead();      // 得到交易树头节点哈希
	void SetBefore(Block* bptr);// 写入前节点
};
// 轻量级区块
class LightBlock {
	int t;             // 时间
	string LightUser;  // 用户
	string LightStuff; // 物品
	string LightTrade; // 交易
	LightBlock* before;         // 深拷贝
public:
	LightBlock() { t = 0; before = NULL; };
	LightBlock(LightBlock& lb2);
	void SetTime(int ti);
};

//----------------------------------------------------------------------//
//----------------------------------------------------------------------//

template<class T>
MerkleTree<T>::MerkleTree() {

}

template<class T>
MerkleTree<T>::MerkleTree(MerkleTree& M) {
	this->Vdata = M.Vdata;
	this->MT = M.MT;
}

template<class T>
void MerkleTree<T>::Insert(T data) {
	Vdata.push_back(data);
	Update();
}

template<class T>
void MerkleTree<T>::Update() {
	int dataLength = Vdata.size();
	// 清空原来的树
	MT.clear();
	// 创建新底层
	vector<string> Leaf;
	for (int i = 0; i < dataLength; i++)Leaf.push_back(MD5(Vdata[i].ToString()).toStr());
	MT.push_back(Leaf);
	// 向上整合
	while (Leaf.size() > 1) {
		vector<string> NewLeaf;
		for (int i = 0; i + 1 < Leaf.size(); i += 2) {
			string newStr = Leaf[i] + Leaf[i + 1];
			NewLeaf.push_back(MD5(newStr).toStr());
		}
		// 如果是奇数，把剩余节点的MD5向上传递
		if (Leaf.size() % 2 == 1)NewLeaf.push_back(MD5(Leaf[Leaf.size() - 1]).toStr());
		MT.push_back(NewLeaf);
		Leaf = NewLeaf;
	}

}

template<class T>
void MerkleTree<T>::Change(int indx,T newData) {
	Vdata[indx] = newData;
	Update();
}

template<class T>
string MerkleTree<T>::GetHead() {
	return MT[MT.size() - 1][0];
}

template<class T>
int MerkleTree<T>::GetSize() {
	return Vdata.size();
}

#endif