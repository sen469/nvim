local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local events = require("luasnip.util.events")

ls.add_snippets("cpp", {
	s("kr", { t({
            "// #include <atcoder/all>",
            "// using namespace atcoder;",
            "// #include \"lib/all\"",
            "// using namespace kyopro;",
            "// 998244353 1000000007 2147483647 4294967295 9223372036854775807 18446744073709551615",
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "template<class... T>",
            "void input(T&... vars) { (cin >> ... >> vars); }",
            "#define INT(...) int __VA_ARGS__; input(__VA_ARGS__)",
            "#define LL(...) long long __VA_ARGS__; input(__VA_ARGS__)",
            "#define STR(...) string __VA_ARGS__; input(__VA_ARGS__)",
            "#define rep1(n) for (int __ = 0; __ < (int)(n); ++__)",
            "#define rep2(i, n) for (int i = 0; i < (int)(n); ++i)",
            "#define rep3(i, a, b) for (int i = (int)(a); i < (int)(b); ++i)",
            "#define rep(...) GET_MACRO(__VA_ARGS__, rep3, rep2, rep1)(__VA_ARGS__)",
            "#define rrep1(n) for (int __ = (int)(n) - 1; __ >= 0; --__)",
            "#define rrep2(i, n) for (int i = (int)(n) - 1; i >= 0; --i)",
            "#define rrep3(i, a, b) for (int i = (int)(b) - 1; i >= (int)(a); --i)",
            "#define rrep(...) GET_MACRO(__VA_ARGS__, rrep3, rrep2, rrep1)(__VA_ARGS__)",
            "#define GET_MACRO(_1, _2, _3, NAME, ...) NAME",
            "#define all(x) x.begin(), x.end()",
            "#define rall(x) x.rbegin(), x.rend()",
            "#define Min(x) *min_element(all(x))",
            "#define Max(x) *max_element(all(x))",
            "#define vec vector",
            "#ifdef SEN469",
            "#include \"lib/debug/debug.hpp\"",
            "#else",
            "#define dg(...)",
            "#endif",
            "#define INF 1001001001",
            "#define INFF 1001001001001001001LL",
            "#define RESET \"\\033[0m\"",
            "#define RED \"\\033[31m\"",
            "#define GREEN \"\\033[32m\"",
            "#define YELLOW \"\\033[33m\"",
            "#define BLUE \"\\033[34m\"",
            "#define MAGENTA \"\\033[35m\"",
            "#define CYAN \"\\033[36m\"",
            "#define WHITE \"\\033[37m\"",
            "using ll = long long;",
            "using ull = unsigned long long;",
            "using ld = long double;",
            "using i128 = __int128_t;",
            "template<typename T> using vv = vec<vec<T>>;",
            "template<typename T> using vvv = vec<vec<vec<T>>>;",
            "template<typename T> bool chmin(T& a, const T& b){ return a > b ? a = b, 1 : 0; }",
            "template<typename T> bool chmax(T& a, const T& b){ return a < b ? a = b, 1 : 0; }",
            "template<typename T, typename U> bool chmin(T& a, const U& b){ return a > b ? a = b, 1 : 0; }",
            "template<typename T, typename U> bool chmax(T& a, const U& b){ return a < b ? a = b, 1 : 0; }",
            "void YN(bool b) { cout << (b ? \"YES\" : \"NO\") << endl; }",
            "void Yn(bool b) { cout << (b ? \"Yes\" : \"No\") << endl; }",
            "void yn(bool b) { cout << (b ? \"yes\" : \"no\") << endl; }",
            "template<typename T>",
            "istream &operator>>(istream &is, vec<T> &v)",
            "{",
            "\tfor (int i = 0; i < (int)v.size(); i++)",
            "\t\tis >> v[i];",
            "\treturn (is);",
            "}",
            "template<typename T>",
            "ostream &operator<<(ostream &os, vec<T> &v)",
            "{",
            "\tfor (int i = 0; i < (int)v.size(); i++)",
            "\t\tos << v[i] << (i == (int)v.size() - 1 ? \"\" : \" \");",
            "\treturn (os);",
            "}",
            "",
            "int main()",
            "{",
        }),
        i(0, nil, {
            node_callbacks = {
                [events.enter] = function()
                    -- カーソルを挿入後にカーソルの場所を画面上部にする
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>zt", true, false, true), "n", true)
                end
            }
        }),
        t({
            "",
            -- "",
            "\treturn (0);",
            "}"
        }),
    }),

	s("dxdy", {
		t({
			"const int dx[8] = {1, 0, -1, 0, 1, 1, -1, -1};",
			"const int dy[8] = {0, 1, 0, -1, 1, -1, 1, -1};",
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
	]], { i(2), i(1) })),

    s("ipow", {
		t({
			"template<typename T>",
			"T ipow(T a, long long b)",
			"{",
			"\tT ret = 1;",
			"\twhile (b > 0)",
			"\t{",
			"\t\tif (b & 1)",
			"\t\t\tret *= a;",
			"\t\ta *= a;",
			"\t\tb >>= 1;",
			"\t}",
			"\treturn (ret);",
			"}",
			"",
		})
	}),
	s("try", {
			t({
				"try",
				"{",
				"\t"
			}),
			i(1, "/* statements */"),
			t({
				"",
				"}",
				"catch ("
			}),
			i(2, "const std::exception& e"),
			t({
				")",
				"{",
				"\t"
			}),
			i(0),
			t({
				"",
				"}"
			}),
	}),
})
