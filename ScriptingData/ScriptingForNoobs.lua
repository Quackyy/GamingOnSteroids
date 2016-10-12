--Put down this code and the name of your champion
if GetObjectName(myHero) ~= "ChampName" then return end

--If your champ has skillshots just put this here, if it doesnt just remove it.
require('OpenPredict')

--Starting Message.
--Example : 
print("Enjoy ChampNation // By:Vikk")

--Example for a Q Skill* - You can search the abilities stats in a league champ Wikia.
local ChampQ = {delay = 0.25, speed = 2000, width = 70, range = 500} 

--Main Menu Tab
local ChampMenu = Menu("KledNation", "KledNation")

--Menu Options / No R Usage in the Combo for now
  KledMenu:Menu("Combo", "Combo")
  KledMenu.Combo:Boolean("useQ", "Use Q", true)
  KledMenu.Combo:Boolean("useW", "Use W", true)
  KledMenu.Combo:Boolean("useE", "Use E", true)
  KledMenu.Combo:Boolean("useTiamat", "Use Tiamat", true)
  KledMenu.Combo:Boolean("useHydra", "Use Ravenous Hydra", true)
  KledMenu.Combo:Boolean("useTitanic", "Use Titanic Hydra", true)
  KledMenu.Combo:Boolean("useBOTRK", "Use BladeOfTheRuinedKing", true)
  KledMenu.Combo:Boolean("useCut", "Use Bilgewater Cutlass", true)  
  KledMenu.Combo:Boolean("useYoum", "Use Youmuu's Ghostblade", true)
  
--ComboTables=Items/Spells
OnTick(function()

    if IOW:Mode() == "Combo" then
       
        local target = GetCurrentTarget() 
             
        if GetItemSlot(myHero, 3142) > 0 and IsReady(GetItemSlot(myHero, 3142)) and KledMenu.Combo.useYoum:Value() then
          CastSpell(GetItemSlot(myHero, 3142))  --Youumu's Ghostblade
        end
        if ValidTarget(target,KledQ.range) and CanUseSpell(myHero,_Q) == READY and KledMenu.Combo.useQ:Value() then
          CastSkillShot(_Q)  --Casting Q as a SkillShot
        end                   
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_E) == READY and KledMenu.Combo.useE:Value() then
          CastSkillShot(_E)  --Casting E as a SkillShot
        end       
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_W) == READY and KledMenu.Combo.useW:Value() then
          CastSpell(_W)  --Casting R as a Spell
        end 
        if GetItemSlot(myHero, 3077) > 0 and IsReady(GetItemSlot(myHero, 3077)) and KledMenu.Combo.useTiamat:Value() then
          CastSpell(GetItemSlot(myHero, 3077))  --Tiamat
        end
        if GetItemSlot(myHero, 3074) > 0 and IsReady(GetItemSlot(myHero, 3074)) and KledMenu.Combo.useHydra:Value() then
          CastSpell(GetItemSlot(myHero, 3074))  --Raveneous Hydra
        end
        if GetItemSlot(myHero, 3748) > 0 and IsReady(GetItemSlot(myHero, 3748)) and KledMenu.Combo.useTitanic:Value() then
          CastSpell(GetItemSlot(myHero, 3748))  --Titanic Hydra
        end 
        if GetItemSlot(myHero, 3153) > 0 and IsReady(GetItemSlot(myHero, 3153)) and KledMenu.Combo.useBOTRK:Value() then
          CastTargetSpell(target, GetItemSlot(myHero, 3153))  --Blade Of The Ruined King
        end        
        if GetItemSlot(myHero, 3144) > 0 and IsReady(GetItemSlot(myHero, 3144)) and KledMenu.Combo.useCut:Value() then
          CastTargetSpell(target, GetItemSlot(myHero, 3144))  --Bilgewater Cutlass  
        end
       end
    end
end)
  
--SkinChanger
KledMenu:SubMenu("SkinChanger", "SkinChanger")

local skinMeta = {["Kled"] = {"Classic", "Sir"}},
KledMenu.SkinChanger:DropDown('skin', myHero.charName.. " Skins", 1, skinMeta[myHero.charName], HeroSkinChanger, true)
KledMenu.SkinChanger.skin.callback = function(model) HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") end
 
