if GetObjectName(myHero) ~= "Olaf" then return end

require('OpenPredict')

print("Enjoy OlafNation // By:Vikk")

local OlafQ = {delay = 0.25, speed = 1600, width = 90, range = 1000} 

local OlafMenu = Menu("OlafNation", "OlafNation")
--Combo Menu
  OlafMenu:Menu("Combo", "Combo")
  OlafMenu.Combo:Boolean("useQ", "Use Q", true)
  OlafMenu.Combo:Boolean("useW", "Use W", true)
  OlafMenu.Combo:Boolean("useE", "Use E", true)
  OlafMenu.Combo:Boolean("useR", "Use R", true)
  OlafMenu.Combo:Slider("ultX","Ult on X enemies around", 3, 1, 5, 1)
  OlafMenu.Combo:Boolean("useTiamat", "Use Tiamat", true)
  OlafMenu.Combo:Boolean("useHydra", "Use Ravenous Hydra", true)
  OlafMenu.Combo:Boolean("useTitanic", "Use Titanic Hydra", true)
  OlafMenu.Combo:Boolean("useBOTRK", "Use BladeOfTheRuinedKing", true)
  OlafMenu.Combo:Boolean("useCut", "Use Bilgewater Cutlass", true)  
  OlafMenu.Combo:Boolean("useYoum", "Use Youmuu's Ghostblade", true)

  
-- Harass Menu
  --SoonTM
--Q
  OlafMenu.Combo:Boolean("useQ", "Use Q", true)   
  OlafMenu.Harass:Slider("manaQ","Mana-Manager | Q", 60, 0, 100, 1)
--W
  OlafMenu.Combo:Boolean("useW", "Use W", true) 
  OlafMenu.Harass:Slider("manaW","Mana-Manager | W", 40, 0, 100, 1)
--E
  OlafMenu.Combo:Boolean("useE", "Use E", true)
  OlafMenu.Harass:Slider("manaE","Hp-Manager | E", 20, 0, 100, 1) 
-- KillSteal Menu
 --SoonTM

OnTick(function()

    if IOW:Mode() == "Combo" then
       
        local target = GetCurrentTarget() 
         
        if ValidTarget(target,OlafQ.range) and CanUseSpell(myHero,_Q) == READY and OlafMenu.Combo.useQ:Value() then
                        
            local qPred = GetPrediction(target,OlafQ)
                         
            if qPred and qPred.hitChance >= 0.25 then 
                CastSkillShot(_Q,qPred.castPos)
            end
        end
       
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_W) == READY and OlafMenu.Combo.useW:Value() then
          CastSpell(_W) 
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_E) == READY and OlafMenu.Combo.useE:Value() then
          CastTargetSpell(target,_E)
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_R) == READY and OlafMenu.Combo.useR:Value() then
          CastSpell(_R)
        end

         if GetItemSlot(myHero, 3077) > 0 and IsReady(GetItemSlot(myHero, 3077)) and OlafMenu.Combo.useTiamat:Value() then
       CastSpell(GetItemSlot(myHero, 3077))
      end
    if GetItemSlot(myHero, 3074) > 0 and IsReady(GetItemSlot(myHero, 3074)) and OlafMenu.Combo.useHydra:Value() then
       CastSpell(GetItemSlot(myHero, 3074))
      end
    if GetItemSlot(myHero, 3748) > 0 and IsReady(GetItemSlot(myHero, 3748)) and OlafMenu.Combo.useTitanic:Value() then
       CastSpell(GetItemSlot(myHero, 3748))
      end 
    if GetItemSlot(myHero, 3153) > 0 and IsReady(GetItemSlot(myHero, 3153)) and OlafMenu.Combo.useBOTRK:Value() then
       CastTargetSpell(target, GetItemSlot(myHero, 3153))
      end
    if GetItemSlot(myHero, 3142) > 0 and IsReady(GetItemSlot(myHero, 3142)) and OlafMenu.Combo.useYoum:Value() then
       CastSpell(GetItemSlot(myHero, 3142))
      end    
    if GetItemSlot(myHero, 3144) > 0 and IsReady(GetItemSlot(myHero, 3144)) and OlafMenu.Combo.useCut:Value() then
       CastTargetSpell(target, GetItemSlot(myHero, 3144)) 
      end
    end
end)
  
OlafMenu:SubMenu("SkinChanger", "SkinChanger")

local skinMeta = {["Olaf"] = {"Classic", "Forsaken", "Glacial", "Br", "Pentakill", "Marauder"}},
OlafMenu.SkinChanger:DropDown('skin', myHero.charName.. " Skins", 1, skinMeta[myHero.charName], HeroSkinChanger, true)
OlafMenu.SkinChanger.skin.callback = function(model) HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") end
