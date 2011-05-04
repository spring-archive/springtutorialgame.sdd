local armorDefs = {
Normal = {
	"simplehover",
	"hoverweapon",
	"hovereffects",
	"simpleattackvehicle",
	"attackvehicledoublebarrel",
	"simplewalker",
	"cube",
	"simplefactory",
	"helicopter",
},

}

for categoryName, categoryTable in pairs(armorDefs) do
  local t = {}
  for _, unitName in pairs(categoryTable) do
    t[unitName] = 1
  end
  armorDefs[categoryName] = t
end

return armorDefs