if GetObjectName(myHero) ~= "Evelynn" then return end

print("Enjoy EveNation // By:Vikk")

local EveQ = {delay = 0.25, speed = 2000, width = 70, range = 500} 

local EveMenu = Menu("EveNation", "EveNation")

  EveMenu:Menu("Combo", "Combo")
  EveMenu.Combo:Boolean("useQ", "Use Q", true)
  EveMenu.Combo:Boolean("useW", "Use W", true)
  EveMenu.Combo:Boolean("useE", "Use E", true)
  EveMenu.Combo:Boolean("useR", "Use R", true)
  EveMenu.Combo:Boolean("useCut", "Use Bilgewater Cutlass", true)  
  EveMenu.Combo:Boolean("useGun", "Use Hextech Gunblade", true)
  EveMenu.Combo:Boolean("useHex", "Use Hextech Protobelt-01", true)
  
OnTick(function()

    if IOW:Mode() == "Combo" then
       
        local target = GetCurrentTarget() 
         
        if ValidTarget(target,EveQ.range) and CanUseSpell(myHero,_Q) == READY and EveMenu.Combo.useQ:Value() then
          CastSpell(_Q)
        end                
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_W) == READY and EveMenu.Combo.useW:Value() then
          CastSpell(_W) 
        end   
        if ValidTarget(target,GetRange(myHero) + GetHitBox(target)) and CanUseSpell(myHero,_E) == READY and EveMenu.Combo.useE:Value() then
          CastTargetSpell(target,_E)
        end       
        local protobelt = GetItemSlot(myHero, 3152)
        if protobelt > 0 and IsReady(protobelt) and EveMenu.Combo.useHex:Value() then
         CastSkillShot(protobelt, target)
        end
        if ValidTarget(target,GetCastRange(myHero, _R)) and Ready(_R) and EveMenu.Combo.useR:Value() then
         CastSkillShot(_R,target)
        end
        if GetItemSlot(myHero, 3146) > 0 and IsReady(GetItemSlot(myHero, 3146)) and EveMenu.Combo.useGun:Value() then
          CastTargetSpell(target, GetItemSlot(myHero, 3146))
        end
        if GetItemSlot(myHero, 3144) > 0 and IsReady(GetItemSlot(myHero, 3144)) and EveMenu.Combo.useCut:Value() then
          CastTargetSpell(target, GetItemSlot(myHero, 3144)) 
        end
    end
end)
  
EveMenu:SubMenu("SkinChanger", "SkinChanger")

local skinMeta = {["Evelynn"] = {"Classic", "Shadow", "Masquerade", "Tango", "Safecracker"}},
EveMenu.SkinChanger:DropDown('skin', myHero.charName.. " Skins", 1, skinMeta[myHero.charName], HeroSkinChanger, true)
EveMenu.SkinChanger.skin.callback = function(model) HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") end
 
