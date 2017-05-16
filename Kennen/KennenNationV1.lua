if GetObjectName(myHero) ~= "Kennen" then return end

require('OpenPredict')

print("KennenNation // By:Crafia")

local KenQ = {delay = 0.25, speed = 1700, width = 50, range = 1050} 

local KenMenu = Menu("KennenNation", "KennenNation")

  KenMenu:Menu("Combo", "Combo")
  KenMenu.Combo:Boolean("useQ", "Use Q", true)
  KenMenu.Combo:Boolean("useR", "Use W", true)
  KenMenu.Combo:Boolean("useE", "Use E", true)
  KenMenu.Combo:Boolean("useR", "Use R", true)
  KenMenu.Combo:Boolean("useCut", "Use Bilgewater Cutlass", true)  
  KenMenu.Combo:Boolean("useGun", "Use Hextech Gunblade", true)
  KenMenu.Combo:Boolean("useHex", "Use Hextech Protobelt-01", true)

OnTick(function()

    if IOW:Mode() == "Combo" then
       
        local target = GetCurrentTarget() 
         
        if ValidTarget(target,KenQ.range) and CanUseSpell(myHero,_Q) == READY and KenMenu.Combo.useQ:Value() then
                        
            local qPred = GetPrediction(target,KenQ)
                         
            if qPred and qPred.hitChance >= 0.25 then 
                CastSkillShot(_Q,qPred.castPos)
            end
        end
       
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_E) == READY and KenMenu.Combo.useE:Value() then
          CastSpell(_E)
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_R) == READY and KenMenu.Combo.useR:Value() then
          CastSpell(_R)
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_W) == READY and KenMenu.Combo.useW:Value() then
          CastSpell(_W)
        end 

        local protobelt = GetItemSlot(myHero, 3152)
        if protobelt > 0 and IsReady(protobelt) and KenMenu.Combo.useHex:Value() then
         CastSkillShot(protobelt, target)
        end
        if GetItemSlot(myHero, 3146) > 0 and IsReady(GetItemSlot(myHero, 3146)) and KenMenu.Combo.useGun:Value() then
          CastTargetSpell(target, GetItemSlot(myHero, 3146))
        end
        if GetItemSlot(myHero, 3144) > 0 and IsReady(GetItemSlot(myHero, 3144)) and KenMenu.Combo.useCut:Value() then
          CastTargetSpell(target, GetItemSlot(myHero, 3144)) 
      end    
    end
end)
  
KenMenu:SubMenu("Skin Changer", "Skin Changer")
  skinMeta = {["Kennen"] = {"Classic", "Deadly", "Swamp Master", "Karate", "Kennen M.D.", "Arctic Ops", "Blood Moon"}},
  KenMenu.Skin Changer:DropDown('skin', myHero.charName.. " Skins", 1, skinMeta[myHero.charName],function(model)
        HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") 
    end,
true)
