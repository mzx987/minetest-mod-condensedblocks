--[[
Condensed Blocks

Created by mzx987
]]



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

--Load config
local path = minetest.get_modpath("condensedblocks")
dofile(path.."/config.txt")

-----------
--Main Loop
-----------

for i = 1, #blockList do

  local node = minetest.registered_nodes["default:"..blockList[i]]
  print("[Condensed Blocks] Creating "..node["description"].."... ") --Used for debugging purposes.
  
  --Checks to see if the node is glass (used to prevent X-Ray blocks)
  local glass = {}
  if node["drawtype"] == "glasslike" or node["drawtype"] == "glasslike_framed_optional" then
    glass = {"glasslike", "light", true} else glass = {"normal", "none", false}
  end
  
  for conVal = 1, condensedblocks_multiplier do

    minetest.register_node("condensedblocks:"..blockList[i].."_x"..conVal, {
      tiles = {"default_"..imageList[i]..".png^condensedblocks_x"..conVal..".png"},
      description = node["description"].." x"..conVal.." ("..(9 ^ conVal)..")",
      drawtype = glass[1],
      paramtype = glass[2],
      sunlight_propagates = glass[3],
      groups = {cracky=1, stone=1, oddly_breakable_by_hand=1},
      sounds = default.node_sound_stone_defaults(),
    })

---------
--Recipes
---------

    if conVal == 1 then
      minetest.register_craft({
        output = "condensedblocks:"..blockList[i].."_x1 1",
        recipe = {
          {"default:"..blockList[i], "default:"..blockList[i], "default:"..blockList[i]},
          {"default:"..blockList[i], "default:"..blockList[i], "default:"..blockList[i]},
          {"default:"..blockList[i], "default:"..blockList[i], "default:"..blockList[i]},
        }
      })
      
      minetest.register_craft({
        type = "shapeless",
        output = "default:"..blockList[i].." 9",
        recipe = {"condensedblocks:"..blockList[i].."_x1"},
      })
    
    else
      minetest.register_craft({
        output = "condensedblocks:"..blockList[i].."_x"..conVal.." 1",
        recipe = {
          {"condensedblocks:"..blockList[i].."_x"..(conVal - 1), "condensedblocks:"..blockList[i].."_x"..(conVal - 1), "condensedblocks:"..blockList[i].."_x"..(conVal - 1)},
          {"condensedblocks:"..blockList[i].."_x"..(conVal - 1), "condensedblocks:"..blockList[i].."_x"..(conVal - 1), "condensedblocks:"..blockList[i].."_x"..(conVal - 1)},
          {"condensedblocks:"..blockList[i].."_x"..(conVal - 1), "condensedblocks:"..blockList[i].."_x"..(conVal - 1), "condensedblocks:"..blockList[i].."_x"..(conVal - 1)},
        }
      })

      minetest.register_craft({
        type = "shapeless",
        output = "condensedblocks:"..blockList[i].."_x"..(conVal - 1).." 9",
        recipe = {"condensedblocks:"..blockList[i].."_x"..conVal},
      })
    end
  end
end

print("[Condensed Blocks] Blocks loaded sucessfully!")