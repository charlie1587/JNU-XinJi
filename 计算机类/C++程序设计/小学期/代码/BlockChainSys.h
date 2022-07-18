#ifndef BLOCK_CHAIN_SYS_H
#define BLOCK_CHAIN_SYS_H

#include "BlockChain.h"

class BlockChainSys {
	// 指针永远处于最新状态
	Block* Bptr;        // 区块链
	LightBlock* LBptr;  // 轻量级区块链
	// 增量信息
	int dnU, dnLU, dnFU, dnM, dnS, dGas;
	// 信息
	int nU, nLU, nFU, nM, nS;
	string sUser;// 用户头哈希
	string sStuff;// 物品头哈希
	string sTrade;// 交易头哈希
	vector<FullUser> Vfuser;
	vector<LightUser> Vluser;
	vector<Miner> Vminer;
	vector<Stuff> Vstuff; // 所有的物品
	vector<Trade> Vtrade; // 所有的交易
	int t;                // 系统处于的时间
public:
	BlockChainSys();
	void PrintInformation();    // 打印信息
	void HelpInformation();     // 指令集
	void Create();              // 创建
	void Tradeb();              // 交易
	void AddInformation();      // 加工物品
	void ls();                  // 展示对应表
	void StuffHis();            // 产品溯源
};

#endif