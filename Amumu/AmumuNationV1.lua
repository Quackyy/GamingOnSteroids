if GetObjectName(myHero) ~= "Amumu" then return end

--Prediction for SkillShots
require('OpenPredict')

--Starting Message
print("AmumuNation // By:Vikk")

--Q Spell Data
local AmuQ = {delay = 0.25, speed = 2000, width = 90, range = 1100} 

--Principal Menu
local AmuMenu = Menu("AmumuNation", "AmumuNation")

--Combo Menu  
  AmuMenu:Menu("Combo", "Combo")
  AmuMenu.Combo:Boolean("useQ", "Use Q", true)
  AmuMenu.Combo:Boolean("useW", "Use E", true)
  AmuMenu.Combo:Boolean("useE", "Use E", true)
  AmuMenu.Combo:Boolean("useR", "Use R", true)
  AmuMenu.Combo:Slider("ultX","Ult on X enemies around", 3, 1, 5, 1)

--Items Menu  
  AmuMenu:Menu("Items", "Items")
  AmuMenu.Items:Boolean("useCut", "Use Bilgewater Cutlass", true)  
  AmuMenu.Items:Boolean("useGun", "Use Hextech Gunblade", true)
  AmuMenu.Items:Boolean("useProto", "Use Hextech Protobelt-01", true)

--Combo Tables
OnTick(function()

    if IOW:Mode() == "Combo" then
       
        local target = GetCurrentTarget() 
         
        if ValidTarget(target,AmuQ.range) and CanUseSpell(myHero,_Q) == READY and AmuMenu.Combo.useQ:Value() then
                        
            local qPred = GetPrediction(target,AmuQ)
                         
            if qPred and qPred.hitChance >= 0.25 then 
                CastSkillShot(_Q,qPred.castPos) --Bandage Toss/Q
            end
        end
       
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_E) == READY and AmuMenu.Combo.useE:Value() then
          CastSpell(_E) --Tantrum/E
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_W) == READY and AmuMenu.Combo.useW:Value() then
          CastSpell(_W) --Despair/W
        end
        
        local protobelt = GetItemSlot(myHero, 3152)
        if protobelt > 0 and IsReady(protobelt) and AmuMenu.Items.useProto:Value() then
         CastSkillShot(protobelt, target) --Hextech Protobelt 01
        end
        
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_R) == READY and AmuMenu.Combo.useR:Value() then
          CastSpell(_R) --Curse of the Sad Mummy/R
        end 

        if GetItemSlot(myHero, 3146) > 0 and IsReady(GetItemSlot(myHero, 3146)) and AmuMenu.Items.useGun:Value() then
          CastTargetSpell(target, GetItemSlot(myHero, 3146)) --Hextech GunBlade
        end
        if GetItemSlot(myHero, 3144) > 0 and IsReady(GetItemSlot(myHero, 3144)) and AmuMenu.Items.useCut:Value() then
          CastTargetSpell(target, GetItemSlot(myHero, 3144)) --Bilgewater Cutlass
        end
    end
end)
  
--Amumu Skin Changer
AmuMenu:SubMenu("Skin Changer", "Skin Changer")
  skinMeta = {["Amumu"] = {"Classic", "Pharaoh", "Vancouver", "Emumu", "Re-Gifted", "Almost Prom King", "Little Knight", "Sad Robot", "Surprise Party"}},
  AmuMenu.Skin Changer:DropDown('skin', myHero.charName.. " Skins", 1, skinMeta[myHero.charName],function(model)
        HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") 
    end,
true)
