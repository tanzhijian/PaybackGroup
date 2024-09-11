local function HideFirstRaidFrame()
    C_Timer.After(1, function()
        if CompactRaidFrame1 then
            CompactRaidFrame1:Hide()
        end
    end)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:SetScript("OnEvent", HideFirstRaidFrame)
