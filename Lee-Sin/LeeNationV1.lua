if GetObjectName(myHero) ~= "Lee Sin" then return end

require('OpenPredict')

print("LeeNation // By:Crafia")

local LeeQ = {delay = 0.25, speed = 1800, width = 65, range = 1100} 

local LeeMenu = Menu("LeeNation", "LeeNation")

  LeeMenu:Menu("Combo", "Combo")
  LeeMenu.Combo:Boolean("useQ", "Use Q", true)
  LeeMenu.Combo:Boolean("useE", "Use E", true)
  LeeMenu.Combo:Boolean("useR", "Use R", true)
  LeeMenu.Combo:Boolean("useTiamat", "Use Tiamat", true)
  LeeMenu.Combo:Boolean("useHydra", "Use Ravenous Hydra", true)
  LeeMenu.Combo:Boolean("useTitanic", "Use Titanic Hydra", true)
  LeeMenu.Combo:Boolean("useYoum", "Use Youmuu's Ghostblade", true)

OnTick(function()

    if IOW:Mode() == "Combo" then
       
        local target = GetCurrentTarget() 
         
        if ValidTarget(target,LeeQ.range) and CanUseSpell(myHero,_Q) == READY and LeeMenu.Combo.useQ:Value() then
                        
            local qPred = GetPrediction(target,LeeQ)
                         
            if qPred and qPred.hitChance >= 0.25 then 
                CastSkillShot(_Q,qPred.castPos)
            end
        end
       
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_R) == READY and LeeMenu.Combo.useR:Value() then
          CastTargetSpell(target,_R)
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_Q) == READY and LeeMenu.Combo.useQ:Value() then
          CastSpell(_Q)
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_E) == READY and LeeMenu.Combo.useE:Value() then
          CastSpell(_E)
        end 

         if GetItemSlot(myHero, 3077) > 0 and IsReady(GetItemSlot(myHero, 3077)) and LeeMenu.Combo.useTiamat:Value() then
       CastSpell(GetItemSlot(myHero, 3077))
      end
    if GetItemSlot(myHero, 3074) > 0 and IsReady(GetItemSlot(myHero, 3074)) and LeeMenu.Combo.useHydra:Value() then
       CastSpell(GetItemSlot(myHero, 3074))
      end
    if GetItemSlot(myHero, 3748) > 0 and IsReady(GetItemSlot(myHero, 3748)) and LeeMenu.Combo.useTitanic:Value() then
       CastSpell(GetItemSlot(myHero, 3748))
      end 
    if GetItemSlot(myHero, 3142) > 0 and IsReady(GetItemSlot(myHero, 3142)) and LeerMenu.Combo.useYoum:Value() then
       CastSpell(GetItemSlot(myHero, 3142))
      end    
    end
end)
  
LeeMenu:SubMenu("Skin Changer", "Skin Changer")
  skinMeta = {["LeeSin"] = {"Classic", "Traditional", "Acolyte", "Dragon Fist", "Muay Thai", "Pool Party", "SKT T1", "Chroma1", "Chroma2", "Chroma3", "Knockout"}},
  LeeMenu.Skin Changer:DropDown('skin', myHero.charName.. " Skins", 1, skinMeta[myHero.charName],function(model)
        HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") 
    end,
true)
