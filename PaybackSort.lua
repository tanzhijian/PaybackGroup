local function HideFirstPartyMember()
    if CompactPartyFrameMember1 then
        CompactPartyFrameMember1:Hide()
    end
end

-- 注册事件，当玩家进入世界时调用函数
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", HideFirstPartyMember)
