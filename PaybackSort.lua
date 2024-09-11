local function HideFirstRaidFrame()
    C_Timer.After(5, function()
        if CompactRaidFrame1 then
            CompactRaidFrame1:Hide()
        else
            print("CompactRaidFrame1 not found")
        end
    end)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", HideFirstRaidFrame)
