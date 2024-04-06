local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local rep = extras.rep
local m = require("luasnip.extras").m
local l = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix


ls.add_snippets("javascript", {
  s("ternary", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
  }),
  s("arf", {
    t("("), i(1), t(") => "), i(0, "body")
  }),
  s("async arf", {
    t("async ()"), t({ " => {", "\t" }), i(0, "logic"), t { "", "}" }
  }),
  s("async func", {
    t("async function "),
    i(1, "fun_name"),
    t("("), i(2, "params"),
    t(")"),
    t({ " {", "\t" }),
    i(0, "logic"), t { "", "}" }
  }),


  s("try", {
    t({ "try{ ", "\t" }),
    i(0),
    t({ "", "} catch(error) {", "\t" }),
    t({ "", "}" }),
  }),
})
ls.add_snippets("javascriptreact", {
  -- s("example3", fmt([[
  -- if <> then
  --   <>
  -- end
  -- ]], {
  --   -- i(1) is at nodes[1], i(2) at nodes[2].
  --   i(1, "not now"), i(2, "when")
  -- }, {
  --   delimiters = "<>"
  -- })),
  s("sfc", fmt([[
  function {a}() {{
    return(
    {b}
    )
  }}
  export default {a}
  ]], {
    a = i(1), b = i(2)
  }, {
    repeat_duplicates = true
  })),
  s("component", fmt(
    [[
    <{componentname} />
    ]],
    { componentname = i(0) }
  ))
})


ls.add_snippets("javascript", {
  s("expressMethod", fmt(
    [[
    .{method}('{url}', {async} (req, res) => {{
      res.json({{msg: '{response}'}})
    }})
  ]],
    { method = i(1), url = i(2), async = i(3), response = i(0) }
  )),

  s("expressRouter", fmt(
    [[
    import {{ Router }} from 'express'

    const {routerName} = Router()

    {routerName}
      .{method}('{url}', {async} (req, res) => {{
        res.json({{msg: '{response}'}})
      }})


    export default {routerName}
    ]],
    { routerName = i(1), method = i(2), url = i(3), async = i(4), response = i(0) },
    { repeat_duplicates = true }
  )),
  s("schema", fmt(
    [[
    import {{ Schema, model }} from 'mongoose'

    const {schemaName} = new Schema(
      {{
        {props}
      }},
      {{
        timestamps: true,
        versionKey: false,
      }},
    );


    export default model("{modelName}", {schemaName})
    ]],
    { schemaName = i(1), props = i(0), modelName = i(2) },
    { repeat_duplicates = true }
  )),
  s("export async const", fmt(
    [[
      export const {constname} = async ({params}) => {{{logic}}}
    ]],
    { constname = i(1), params = i(2), logic = i(0) }
  )),

  s("trig", {
    i(1), c(2, {
    sn(nil, { i(1),
      t "can access the argnode :)",
      f(function(args)
        return args[1]
      end, ai(1))
    }),
    t "sample_text"
  })
  })
})


ls.add_snippets("astro", {
  s('import', fmt(
    [[
    import {functionality} from '{module}'
    ]],
    { functionality = i(1), module = i(0) }
  ))
})
-- ls.add_snippets("astro", {
--   s("ternary", fmt(
--     [[
--     import {fun} from '{module}'
--     ]]
--   )),
-- })
