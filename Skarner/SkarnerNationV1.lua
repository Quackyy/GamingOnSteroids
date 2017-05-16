if GetObjectName(myHero) ~= "Skarner" then return end

require('OpenPredict')

print("SkarnerNation // By:Crafia")

local SkarnerE = {delay = 0.25, speed = 1500, width = 70, range = 1000} 

local SkarnerMenu = Menu("SkarnerNation", "SkarnerNation")

  SkarnerMenu:Menu("Combo", "Combo")
  SkarnerMenu.Combo:Boolean("useQ", "Use Q", true)
  SkarnerMenu.Combo:Boolean("useW", "Use W", true)
  SkarnerMenu.Combo:Boolean("useE", "Use E", true)
  SkarnerMenu.Combo:Boolean("useR", "Use R", true)
  SkarnerMenu.Combo:Boolean("useTiamat", "Use Tiamat", true)
  SkarnerMenu.Combo:Boolean("useHydra", "Use Ravenous Hydra", true)
  SkarnerMenu.Combo:Boolean("useTitanic", "Use Titanic Hydra", true)
  SkarnerMenu.Combo:Boolean("useBOTRK", "Use BladeOfTheRuinedKing", true)
  SkarnerMenu.Combo:Boolean("useCut", "Use Bilgewater Cutlass", true)  
  SkarnerMenu.Combo:Boolean("useYoum", "Use Youmuu's Ghostblade", true)

OnTick(function()

    if IOW:Mode() == "Combo" then
       
        local target = GetCurrentTarget() 
         
        if ValidTarget(target,SkarnerE.range) and CanUseSpell(myHero,_E) == READY and SkarnerMenu.Combo.useE:Value() then
                        
            local ePred = GetPrediction(target,SkarnerE)
                         
            if ePred and ePred.hitChance >= 0.25 then 
                CastSkillShot(_E,ePred.castPos)
            end
        end
       
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_W) == READY and SkarnerMenu.Combo.useW:Value() then
          CastSpell(_W) 
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_Q) == READY and SkarnerMenu.Combo.useE:Value() then
          CastSpell(_Q)
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_R) == READY and SkarnerMenu.Combo.useR:Value() then
          CastTargetSpell(target,_R)
        end

         if GetItemSlot(myHero, 3077) > 0 and IsReady(GetItemSlot(myHero, 3077)) and SkarnerMenu.Combo.useTiamat:Value() then
       CastSpell(GetItemSlot(myHero, 3077))
      end
    if GetItemSlot(myHero, 3074) > 0 and IsReady(GetItemSlot(myHero, 3074)) and SkarnerMenu.Combo.useHydra:Value() then
       CastSpell(GetItemSlot(myHero, 3074))
      end
    if GetItemSlot(myHero, 3748) > 0 and IsReady(GetItemSlot(myHero, 3748)) and SkarnerMenu.Combo.useTitanic:Value() then
       CastSpell(GetItemSlot(myHero, 3748))
      end 
    if GetItemSlot(myHero, 3153) > 0 and IsReady(GetItemSlot(myHero, 3153)) and SkarnerMenu.Combo.useBOTRK:Value() then
       CastTargetSpell(target, GetItemSlot(myHero, 3153))
      end
    if GetItemSlot(myHero, 3142) > 0 and IsReady(GetItemSlot(myHero, 3142)) and SkarnerMenu.Combo.useYoum:Value() then
       CastSpell(GetItemSlot(myHero, 3142))
      end    
    if GetItemSlot(myHero, 3144) > 0 and IsReady(GetItemSlot(myHero, 3144)) and SkarnerMenu.Combo.useCut:Value() then
       CastTargetSpell(target, GetItemSlot(myHero, 3144)) 
      end
    end
end)
  
SkarnerMenu:SubMenu("SkinChanger", "SkinChanger")
  skinMeta = {["Skarner"] = {"Classic", "Sandscourge", "Earthrune", "Battlecast Alpha", "Guardian of the Sands"}}
  SkarnerMenu.SkinChanger:DropDown('skin', myHero.charName.. " Skins", 1, skinMeta[myHero.charName],function(model)
        HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") 
    end,
true)
