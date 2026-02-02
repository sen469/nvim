local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {
	s("kyopuro", {
		t({
			"#include <bits/stdc++.h>",
			"using namespace std;",
			"",
			"#define all(x) x.begin(), x.end()",
			"#define rall(x) x.rbegin(), x.rend()",
			"#define INF 1001001001",
			"#define INFF 1001001001001001001",
			"using ll = long long;",
			"using ull = unsigned long long;",
			"using ld = long double;",
			"using i128 = __int128_t;",
			"using vi = vector<int>;",
			"using vvi = vector<vi>;",
			"using vl = vector<ll>;",
			"using vvl = vector<vl>;",
			"using vs = vector<string>;",
			"using vvs = vector<vs>;",
			"using vc = vector<char>;",
			"using vvc = vector<vc>;",
			"using vb = vector<bool>;",
			"using vvb = vector<vb>;",
			"using vd = vector<double>;",
			"using vvd = vector<vd>;",
			"template <typename T> inline bool chmin(T &a,T b){if(a>b){a=b;return true;} return false;}",
			"template <typename T> inline bool chmax(T &a,T b){if(a<b){a=b;return true;} return false;}",
			"",
			"// #include <atcoder/all>",
			"// using namespace atcoder;",
			"",
			"",
			"int main()",
			"{",
			"\tcin.tie(nullptr);",
			"\tios_base::sync_with_stdio(false);",
			"",
			"\t"
		}),
		i(0),
		t({
			"",
			"",
			"",
			"",
			"",
			"\treturn (0);",
			"}"
		}),
	}),

	s("dxdy", {
		t({
			"const int dx[4] = {1, 0, -1, 0};",
			"const int dy[4] = {0, 1, 0, -1};",
			"",
		})
	}),

	s("else", t({"else", ""})),
	s("else if", t({"else if", ""})),
	s("do", fmt([[
	do
	{{
		{}
	}} while ({});
	]], { i(1), i(2) })),

	s("UF", {
		t({
			"class UnionFind",
			"{",
			"public:",
			"\tvector<int> par, rank, siz;",
			"",
			"\tUnionFind(int n) : par(n, -1), rank(n, 0), siz(n, 1)",
			"\t{}",
			"",
			"\tint root(int x)",
			"\t{",
			"\t\tif (par[x] == -1) return x;",
			"\t\telse return par[x] = root(par[x]);",
			"\t}",
			"",
			"\tbool same(int x, int y)",
			"\t{",
			"\t\treturn root(x) == root(y);",
			"\t}",
			"",
			"\tbool merge(int x, int y)",
			"\t{",
			"\t\tint rx = root(x), ry = root(y);",
			"\t\tif (rx == ry) return false;",
			"",
			"\t\tif (rank[rx] < rank[ry]) swap(rx, ry);",
			"\t\tpar[ry] = rx;",
			"\t\tif (rank[rx] == rank[ry]) rank[rx]++;",
			"\t\tsiz[rx] += siz[ry];",
			"",
			"\t\treturn true;",
			"\t}",
			"",
			"\tint size(int x)",
			"\t{",
			"\t\treturn siz[root(x)];",
			"\t}",
			"};",
			"",
		})
	}),

	s("rle", {
		t({
			"/* encode: ランレングス圧縮を行う */",
			"vector<pair<char, int>> encode(const string& str) {",
			"\tint n = (int)str.size();",
			"\tvector<pair<char, int>> ret;",
			"\tfor (int l = 0; l < n;) {",
			"\t\tint r = l + 1;",
			"\t\tfor (; r < n && str[l] == str[r]; r++) {}",
			"\t\tret.push_back({str[l], r - l});",
			"\t\tl = r;",
			"\t}",
			"\treturn ret;",
			"}",
			"",
			"/* decode: ランレングス圧縮の復元を行う */",
			"string decode(const vector<pair<char, int>>& code) {",
			"\tstring ret = \"\";",
			"\tfor (auto p : code) {",
			"\t\tfor (int i = 0; i < p.second; i++) {",
			"\t\t\tret.push_back(p.first);",
			"\t\t}",
			"\t}",
			"\treturn ret;",
			"}",
			"",
		})
	}),

	s("sieve", {
		t({
			"vector<int> isprime;",
			"vector<int> Eratosthenes(int n)",
			"{",
			"\tisprime.resize(n, 1);",
			"\tvector<int> res;",
			"\tisprime[0] = isprime[1] = 0;",
			"\tfor (ll p = 2; p < n; p++)",
			"\t{",
			"\t\tif (isprime[p])",
			"\t\t{",
			"\t\t\tres.push_back(p);",
			"\t\t\tfor (int q = 2 * p; q <= n; q += p)",
			"\t\t\t\tisprime[q] = 0;",
			"\t\t}",
			"\t}",
			"\treturn (res);",
			"}",
		})
	}),

	s("ipow", {
		t({
			"template<typename T>",
			"T ipow(T a, long long b){",
			"\tT res = 1;",
			"\twhile(b > 0){",
			"\t\tif(b & 1) res *= a;",
			"\t\ta *= a;",
			"\t\tb >>= 1;",
			"\t}",
			"\treturn (res);",
			"}",
			"",
		})
	}),
})
