require('OpenPredict')
if GetObjectName(myHero) ~= "Trundle" then return end

local ver = 3
function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New version found! " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/Quackyy/TrundleScript/master/Trundle%20-%20The%20Troll.lua", SCRIPT_PATH .. "Trundle - The Troll.lua", function() PrintChat("Update Complete, please 2x F6!") return end)
    else
        PrintChat("No updates found!")
    end
end

    local EStats = { delay = 0.025, speed = math.huge, width = 225, range = 1000}
    
    local TrundleMenu = Menu("TrundleNation", "TrundleNation")
TrundleMenu:SubMenu("Gapclose", "Gapclose")
TrundleMenu.Gapclose:Boolean("GCW", "Use W", true)
TrundleMenu.Gapclose:Boolean("GCE", "Use E", true)

function Mode()
    if _G.IOW_Loaded and IOW:Mode() then
        return IOW:Mode()
        elseif _G.PW_Loaded and PW:Mode() then
        return PW:Mode()
        elseif _G.DAC_Loaded and DAC:Mode() then
        return DAC:Mode()
        elseif _G.AutoCarry_Loaded and DACR:Mode() then
        return DACR:Mode()
        elseif _G.SLW_Loaded and SLW:Mode() then
        return SLW:Mode()
        elseif _G.GoSWalkLoaded and _G.GoSWalk.CurrentMode == 0 then
        return "Combo"
        elseif _G.GoSWalkLoaded and _G.GoSWalk.CurrentMode == 1 then
        return "Harass"
        elseif _G.GoSWalkLoaded and _G.GoSWalk.CurrentMode == 2 then
        return "LaneClear"
        elseif _G.GoSWalkLoaded and _G.GoSWalk.CurrentMode == 3 then
        return "LastHit"
        else
        return ""
    end
end
 
  OnTick(function()
  
    local target = GetCurrentTarget()
    local movePos = GetPrediction(GetCurrentTarget(),{delay = 0.5, speed = math.huge, width = 50, range = math.huge}).castPos
  
  if Mode() == "Combo" then 
    if TrundleMenu.Gapclose.GCW:Value() and Ready(_W) and ValidTarget(target, 1000) then
      if GetDistance(myHero, target) > 340 and GetDistance(myHero, target) < 1000 and GetDistance(movePos) > GetDistance(target) then
        CastSkillShot(_W, target)
      end 
    end
  
    if TrundleMenu.Gapclose.GCE:Value() and Ready(_E) and ValidTarget(target, 1000) then
      if GetDistance(myHero, target) > 360 and GetDistance(myHero, Target) < 800 and GetDistance(movePos) > GetDistance(target) then
        local EPredE = GetCircularAOEPrediction(target, EStats)
        CastSkillShot(_E, EPredE.castPos)
      end
    end   
  end 
end)

OnProcessSpellComplete(function(unit, spell)
  if unit == myHero and spell.name:lower():find("attack") and IOW and IOW:Mode() == "Combo" then
    if IsReady(_Q) then
      CastSpell(_Q)
      return
    end
    if GetItemSlot(myHero, 3077) > 0 and IsReady(GetItemSlot(myHero, 3077)) then
       CastSpell(GetItemSlot(myHero, 3077))
       return
    end
    if GetItemSlot(myHero, 3074) > 0 and IsReady(GetItemSlot(myHero, 3074)) then
       CastSpell(GetItemSlot(myHero, 3074))
       return
    end
   if GetItemSlot(myHero, 3748) > 0 and IsReady(GetItemSlot(myHero, 3748)) then
       CastSpell(GetItemSlot(myHero, 3748))
       return
    end
  end
end)

TrundleMenu:SubMenu("SkinChanger", "SkinChanger")

local skinMeta = {["Trundle"] = {"Classic", "Lil'Slugger", "Junkyard", "Traditional", "Constable"}}
TrundleMenu.SkinChanger:DropDown('skin', myHero.charName.. " Skins", 1, skinMeta[myHero.charName], HeroSkinChanger, true)
TrundleMenu.SkinChanger.skin.callback = function(model) HeroSkinChanger(myHero, model - 1) print(skinMeta[myHero.charName][model] .." ".. myHero.charName .. " Loaded!") end
 

