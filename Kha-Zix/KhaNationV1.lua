----------------------Working----------------------
if GetObjectName(myHero) ~= "Kha'Zix" then return end

--Predict for SkillShots
require('OpenPredict')

--Starting Message
print("Enjoy KhaNation // By:Crafia")

--W and E Stats *
local KhaW = {delay = 0.25, speed = 1700, width = 73, range = 1025} 
local KhaE = {delay = 0.25, speed = 1500, width = 300, range = 600} 

--Main Menu Tab
local KhaMenu = Menu("KhaNation", "KhaNation")

--Menu Options / No R Usage in the Combo for now
  KhaMenu:Menu("Combo", "Combo")
  KhaMenu.Combo:Boolean("useQ", "Use Q", true)
  KhaMenu.Combo:Boolean("useW", "Use W", true)
  KhaMenu.Combo:Boolean("useE", "Use E", true)
  KhaMenu.Combo:Boolean("useTiamat", "Use Tiamat", true)
  KhaMenu.Combo:Boolean("useHydra", "Use Ravenous Hydra", true)  
  KhaMenu.Combo:Boolean("useYoum", "Use Youmuu's Ghostblade", true)
  
--ComboTables=Items/Spells
OnTick(function()

    if IOW:Mode() == "Combo" then
       
        local target = GetCurrentTarget() 
             
        if GetItemSlot(myHero, 3142) > 0 and IsReady(GetItemSlot(myHero, 3142)) and KledMenu.Combo.useYoum:Value() then
          CastSpell(GetItemSlot(myHero, 3142))  --Youumu's Ghostblade
        end
        if ValidTarget(target,KhaW(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_W) == READY and KhaMenu.Combo.useW:Value() then
          CastSkillShot(_W)  --Casting W as a SkillShot 
        end
        if ValidTarget(target,KhaE.range) and CanUseSpell(myHero,_E) == READY and KledMenu.Combo.useE:Value() then
          CastSkillShot(_E)  --Casting E as a SkillShot
        end                   
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_E) == READY and KledMenu.Combo.useE:Value() then
          CastTargetSpell(target,_Q)  --Casting Q as a TargetSpell
        end       
        if GetItemSlot(myHero, 3077) > 0 and IsReady(GetItemSlot(myHero, 3077)) and KledMenu.Combo.useTiamat:Value() then
          CastSpell(GetItemSlot(myHero, 3077))  --Tiamat
        end
        if GetItemSlot(myHero, 3074) > 0 and IsReady(GetItemSlot(myHero, 3074)) and KledMenu.Combo.useHydra:Value() then
          CastSpell(GetItemSlot(myHero, 3074))  --Raveneous Hydra
        end
       end
    end
end)
  
--SkinChanger / Working On
KhaMenu:SubMenu("SkinChanger", "SkinChanger")

local skinMeta = {["Khazix"] = {"Classic", "Mecha", "Guardian of the Sands", "Death Blossom"}},
KhaMenu.SkinChanger:DropDown('skin', myHero.charName.. " Skins", 1, skinMeta[myHero.charName], HeroSkinChanger, true)
KhaMenu.SkinChanger.skin.callback = function(model) HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") end
 
