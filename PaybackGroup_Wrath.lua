local function MoveAndHidePlayerRaidFrame()
    C_Timer.After(1, function()
        local numGroupMembers = GetNumGroupMembers()
        local playerFrameIndex
        local playerFrame

        -- 找到玩家的框架
        for i = 1, numGroupMembers do
            local raidFrame = _G["CompactRaidFrame" .. i]
            if raidFrame and raidFrame.unit and UnitIsUnit(raidFrame.unit, "player") then
                playerFrameIndex = i
                playerFrame = raidFrame
                break
            end
        end

        if playerFrame then
            -- 将玩家框架移动到最后一名
            for i = playerFrameIndex, numGroupMembers - 1 do
                local nextFrame = _G["CompactRaidFrame" .. (i + 1)]
                if nextFrame then
                    _G["CompactRaidFrame" .. i] = nextFrame
                end
            end
            _G["CompactRaidFrame" .. numGroupMembers] = playerFrame
            playerFrame:Hide()
        end
    end)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:SetScript("OnEvent", MoveAndHidePlayerRaidFrame)
