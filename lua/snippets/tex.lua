local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local tex_snippets = {
    -- LaTeX テンプレートスニペット
    s("base", {
        t({ "\\documentclass[11pt, a4paper]{jsarticle}", "" }),
        -- 
        t({ "%", "" }),
        t({ "\\setlength{\\textwidth}{\\fullwidth}", "" }),
        t({ "\\setlength{\\textheight}{40\\baselineskip}", "" }),
        t({ "\\addtolength{\\textheight}{\\topskip}", "" }),
        t({ "\\setlength{\\voffset}{-0.2in}", "" }),
        t({ "\\setlength{\\topmargin}{0pt}", "" }),
        t({ "\\setlength{\\headheight}{0pt}", "" }),
        t({ "\\setlength{\\headsep}{0pt}", "" }),
        -- 
        t({ "%", "" }),
        t("\\title{"), i(1, "Courage and Sacrifice"), t({ "}", "" }),
        t({ "", "" }),
        t("\\author{"), i(2, "ssawa"), t({ "}", "" }),
        t({ "\\date{}", "" }),
        t({ "\\begin{document}", "" }),
        t({ "\\maketitle", "" }),
        t({ "", "" }),
        i(0),
        t({ "", "" }),
        t({ "\\end{document}" }),
    }),
}

ls.add_snippets("tex", tex_snippets)
ls.add_snippets("latex", tex_snippets)
ls.add_snippets("plaintex", tex_snippets)

