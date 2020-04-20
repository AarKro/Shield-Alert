local function shieldAlert_shouldAlert () 
  local localizedClass, englishClass, classIndex = UnitClass("player");
  local currentSpec = GetSpecialization()

  return classIndex == 1 and currentSpec ~= 3 and IsEquippedItemType("Shields")
end 

local function shieldAlert_alert ()
  if shieldAlert_shouldAlert() then
    RaidNotice_AddMessage(RaidWarningFrame, "!!! UNEQUIP YOUR SHIELD YOU IDIOT !!!", ChatTypeInfo["RAID_WARNING"])
    PlaySoundFile(567397)

    C_Timer.After(2, shieldAlert_alert)
  end
end

local shieldAlert_frame = CreateFrame("frame")
shieldAlert_frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
shieldAlert_frame:RegisterEvent("UNIT_INVENTORY_CHANGED")
shieldAlert_frame:SetScript("OnEvent", shieldAlert_alert)
