local function HidePlayerRaidFrame()
    C_Timer.After(1, function()
        local numGroupMembers = GetNumGroupMembers()
        for i = 1, numGroupMembers do
            local raidFrame = _G["CompactRaidFrame" .. i]
            if raidFrame and raidFrame.unit and UnitIsUnit(raidFrame.unit, "player") then
                raidFrame:Hide()
                break
            end
        end
    end)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:SetScript("OnEvent", HidePlayerRaidFrame)
