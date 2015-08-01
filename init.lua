--List of blocks used from "default" mod.
local blockList = {
"brick", "bronzeblock", "clay",
"coalblock", "cobble", "copperblock",
"desert_cobble", "desert_sand", "desert_stone",
"desert_stone", "diamondblock", "dirt",
"glass", "goldblock", "gravel",
"junglewood", "mese_block", "mossycobble",
"obsidian", "obsidianbrick", "obsidian_glass",
"pinewood", "sand", "sandstone",
"sandstonebrick", "steelblock", "stone",
"stonebrick", "wood"
}

--Oddly enough, some image names differ from node names...
--This table MUST match the blockList table.
local imageList = {
"brick", "bronze_block", "clay",
"coal_block", "cobble", "copper_block",
"desert_cobble", "desert_sand", "desert_stone",
"desert_stone", "diamond_block", "dirt",
"glass", "gold_block", "gravel",
"junglewood", "mese_block", "mossycobble",
"obsidian", "obsidian_brick", "obsidian_glass",
"pinewood", "sand", "sandstone",
"sandstone_brick", "steel_block", "stone",
"stone_brick", "wood"
}

-----------
--Main Loop
-----------

local testNode = minetest.registered_nodes["default:"..blockList[13]]
for k, v in pairs(testNode) do print(k, v) end
print(testNode["drawtype"])

for i = 1, #blockList do
  local node = minetest.registered_nodes["default:"..blockList[i]]
  print("[Condensed Blocks] Creating "..node["description"].."... ")
  
  --Checks to see if the node is glass (used to prevent X-Ray blocks)
  local glass = {}
  if node["drawtype"] == "glasslike" or node["drawtype"] == "glasslike_framed_optional" then
    glass = {"glasslike", "light", true} else glass = {"normal", "none", false}
  end

  minetest.register_node("condensedblocks:"..blockList[i].."_x1", {
    tiles = {"default_"..imageList[i]..".png^condensedblocks_x1.png"},
    description = node["description"].." x1 (9)",
    drawtype = glass[1],
    paramtype = glass[2],
    sunlight_propagates = glass[3],
    groups = {cracky=2, stone=1, oddly_breakable_by_hand=2},
    sounds = default.node_sound_stone_defaults(),
  })

  minetest.register_node("condensedblocks:"..blockList[i].."_x2", {
    tiles = {"default_"..imageList[i]..".png^condensedblocks_x2.png"},
    description = node["description"].." x2 (81)",
    drawtype = glass[1],
    paramtype = glass[2],
    sunlight_propagates = glass[3],
    groups = {cracky=1, stone=1, oddly_breakable_by_hand=1},
    sounds = default.node_sound_stone_defaults(),
  })

  minetest.register_node("condensedblocks:"..blockList[i].."_x3", {
    tiles = {"default_"..imageList[i]..".png^condensedblocks_x3.png"},
    description = node["description"].." x3 (729)",
    drawtype = glass[1],
    paramtype = glass[2],
    sunlight_propagates = glass[3],
    groups = {cracky=1, stone=1, oddly_breakable_by_hand=1},
    sounds = default.node_sound_stone_defaults(),
  })

  minetest.register_node("condensedblocks:"..blockList[i].."_x4", {
    tiles = {"default_"..imageList[i]..".png^condensedblocks_x4.png"},
    description = node["description"].." x4 (6561)",
    drawtype = glass[1],
    paramtype = glass[2],
    sunlight_propagates = glass[3],
    groups = {cracky=1, stone=1, oddly_breakable_by_hand=1},
    sounds = default.node_sound_stone_defaults(),
  })
  
---------
--Recipes
---------
  minetest.register_craft({
    output = "condensedblocks:"..blockList[i].."_x1 1",
    recipe = {
      {"default:"..blockList[i], "default:"..blockList[i], "default:"..blockList[i]},
      {"default:"..blockList[i], "default:"..blockList[i], "default:"..blockList[i]},
      {"default:"..blockList[i], "default:"..blockList[i], "default:"..blockList[i]},
    }
  })

  minetest.register_craft({
    output = "condensedblocks:"..blockList[i].."_x2 1",
    recipe = {
      {"condensedblocks:"..blockList[i].."_x1", "condensedblocks:"..blockList[i].."_x1", "condensedblocks:"..blockList[i].."_x1"},
      {"condensedblocks:"..blockList[i].."_x1", "condensedblocks:"..blockList[i].."_x1", "condensedblocks:"..blockList[i].."_x1"},
      {"condensedblocks:"..blockList[i].."_x1", "condensedblocks:"..blockList[i].."_x1", "condensedblocks:"..blockList[i].."_x1"},
    }
  })

  minetest.register_craft({
    output = "condensedblocks:"..blockList[i].."_x3 1",
    recipe = {
      {"condensedblocks:"..blockList[i].."_x2", "condensedblocks:"..blockList[i].."_x2", "condensedblocks:"..blockList[i].."_x2"},
      {"condensedblocks:"..blockList[i].."_x2", "condensedblocks:"..blockList[i].."_x2", "condensedblocks:"..blockList[i].."_x2"},
      {"condensedblocks:"..blockList[i].."_x2", "condensedblocks:"..blockList[i].."_x2", "condensedblocks:"..blockList[i].."_x2"},
    }
  })

  minetest.register_craft({
    output = "condensedblocks:"..blockList[i].."_x4 1",
    recipe = {
      {"condensedblocks:"..blockList[i].."_x3", "condensedblocks:"..blockList[i].."_x3", "condensedblocks:"..blockList[i].."_x3"},
      {"condensedblocks:"..blockList[i].."_x3", "condensedblocks:"..blockList[i].."_x3", "condensedblocks:"..blockList[i].."_x3"},
      {"condensedblocks:"..blockList[i].."_x3", "condensedblocks:"..blockList[i].."_x3", "condensedblocks:"..blockList[i].."_x3"},
    }
  })

  minetest.register_craft({
    type = "shapeless",
    output = "default:"..blockList[i].." 9",
    recipe = {"condensedblocks:"..blockList[i].."_x1"},
  })

  minetest.register_craft({
    type = "shapeless",
    output = "condensedblocks:"..blockList[i].."_x1 9",
    recipe = {"condensedblocks:"..blockList[i].."_x2"},
  })

  minetest.register_craft({
    type = "shapeless",
    output = "condensedblocks:"..blockList[i].."_x2 9",
    recipe = {"condensedblocks:"..blockList[i].."_x3"},
  })

  minetest.register_craft({
    type = "shapeless",
    output = "condensedblocks:"..blockList[i].."_x3 9",
    recipe = {"condensedblocks:"..blockList[i].."_x4"},
  })

end

print("[Condensed Blocks] Blocks loaded sucessfully!")