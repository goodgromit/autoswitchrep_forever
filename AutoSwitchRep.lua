-- 평판이 바뀌면 평판 바(추적 중인 평판)를 그 평판으로 자동 전환한다.
-- FACTION_STANDING_CHANGED 이벤트가 바뀐 평판의 ID를 직접 주므로 그 ID로 바로 전환한다.

local frame = CreateFrame("Frame")
frame:RegisterEvent("FACTION_STANDING_CHANGED")
frame:SetScript("OnEvent", function(_, _, factionID)
	-- 채팅 잠금(보스전 등) 중에는 값이 secret일 수 있어 읽지 않는다
	if not factionID or issecretvalue(factionID) or factionID == 0 then return end

	-- 이미 추적 중인 평판이면 아무것도 하지 않는다
	local watched = C_Reputation.GetWatchedFactionData()
	if watched and watched.factionID == factionID then return end

	C_Reputation.SetWatchedFactionByID(factionID)
end)
