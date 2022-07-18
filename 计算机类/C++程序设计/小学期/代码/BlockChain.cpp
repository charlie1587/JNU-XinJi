
#include "BlockChain.h"
#include <iostream>


User::User(double bal) {
	nonce = 0;
	balance = bal;
	storageRoot = "";
}

void User::AddNonce() {
	nonce++;
}

string User::ToString() {
	string strnon = to_string(nonce);
	string strbal = to_string(balance);
	return strnon + strbal + storageRoot;
}

double User::GetBalance() {
	return balance;
}

void User::ChangeBalance(double b) {
	balance = b;
}

FullUser::FullUser(double bal,string str):User(bal) {
	mB = NULL;
	name = str;
}

void FullUser::UpdateBook(Block* nmb) {
	mB = nmb;
}

void FullUser::ShowInformation() {
	cout << name << " "<<GetBalance() << endl;
}

LightUser::LightUser(double bal, string str) :User(bal) {
	mLB = NULL;
	name = str;
}

Miner::Miner(double c,double bal):User(bal) {
	comp = c;
	mB = NULL;
}

double Miner::GetComp() {
	return comp;
}
void Miner::UpdateBook(Block* bptr) {
	mB = bptr;
}

Stuff::Stuff(int c, string n) {
	code = c;
	name = n;
}

Stuff::Stuff(int c, string n, int u, int t) {
	code = c;
	name = n;
	string str= "t = ";
	str += to_string(t);
	str += " user";
	str += to_string(u);
	str += " create this stuff.";
	Info.push_back(str);

}

void Stuff::AddInfo(string str) {
	Info.push_back(str);
}

string Stuff::ToString() {
	string str=to_string(code)+name;
	for (int i = 0; i < Info.size(); i++)str += Info[i];
	return str;
}

void Stuff::ShowBriefInfo() {
	cout << code << " " << name << endl;
}

void Stuff::ShowAllInfo() {
	cout << "------------------------Stuff "<<name<<"-------------------------" << endl;
	for (int i = 0; i < Info.size(); i++)
		cout << Info[i] << endl;
	cout << "-----------------------------------------------------------" << endl;
}

Block::Block(Block& b2) {
	t = b2.t;
	MerUser = b2.MerUser;
	MerStuff = b2.MerStuff;
	MerTrade = b2.MerTrade;
	before = b2.before;
}

LightBlock::LightBlock(LightBlock& b2) {
	t = b2.t;
	LightUser = b2.LightUser;
	LightStuff = b2.LightStuff;
	LightTrade = b2.LightTrade;
	before = b2.before;
}

void Block::SetTime(int ti) {
	t = ti;
}

void LightBlock::SetTime(int ti) {
	t = ti;
}
void Block::InputUser(User u) {
	MerUser.Insert(u);
}
string Block::GetUserHead() {
	if (MerUser.GetSize() != 0)
		return MerUser.GetHead();
	else return "";
}

void Block::InputStuff(Stuff s) {
	MerStuff.Insert(s);
}
string Block::GetStuffHaed() {
	if (MerStuff.GetSize() != 0)
		return MerStuff.GetHead();
	else return "";
}

void Block::InputTrade(Trade t) {
	MerTrade.Insert(t);
}

string Block::GetTradeHead() {
	if (MerTrade.GetSize() != 0)
		return MerTrade.GetHead();
	else return "";
}

void Block::SetBefore(Block* bptr) {
	before = bptr;
}

Trade::Trade(int u1, int u2, int s, double g) {
	uid1 = u1;
	uid2 = u2;
	id = s;
	gas = g;
}

string Trade::ToString() {
	string str = to_string(uid1) + to_string(uid2) + to_string(id) + to_string(gas);
	return str;
}