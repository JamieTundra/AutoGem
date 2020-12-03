SLASH_AUTOGEM1 = '/autogem'
SLASH_AUTOGEM2 = '/ag'
SLASH_AUTOGEM3 = '/autogem crit'
SLASH_AUTOGEM4 = '/ag crit'
SLASH_AUTOGEM5 = '/autogem vers'
SLASH_AUTOGEM6 = '/ag vers'
SLASH_AUTOGEM7 = '/autogem haste'
SLASH_AUTOGEM8 = '/ag haste'
SLASH_AUTOGEM9 = '/autogem mastery'
SLASH_AUTOGEM10 = '/ag mastery'

local crit = 173127
local vers = 173129
local haste = 173128
local mastery = 173130
local slotIDs = { 1, 2, 3, 5, 6, 7, 8, 9 , 10, 11, 12, 13, 14, 15, 16, 17, 18 }
 

local function GemAll(i,z)
	for key, value in pairs(slotIDs) do
    SocketInventoryItem(value)
		if (GetNumSockets() == 1) then
		PickupContainerItem(i,z)
		ClickSocketButton(1)
		AcceptSockets()
		CloseSocketInfo()
		end
	end
end

local function GetGem(gemType)
	local itemID = 0
	local found = false
	if (gemType == "crit") then
		itemID = crit
	elseif (gemType == "vers") then
		itemID = vers
	elseif(gemType == "haste") then
		itemID = haste
	elseif(gemType == "mastery") then
		itemID = mastery
	end
	for i = 0, NUM_BAG_SLOTS do
		for z = 1, GetContainerNumSlots(i) do
			if GetContainerItemID(i, z) == itemID then
				found = true
				GemAll(i,z)
				break
			end
		end
	end
	
	if not found then
	DEFAULT_CHAT_FRAME:AddMessage("No gem found in bags!!!");
	end
end


local function GemHandler(gemType)
    if (string.find(gemType, "crit")) then
		GetGem("crit")
    elseif (string.find(gemType, "vers")) then
        GetGem("vers")
	elseif (string.find(gemType, "haste")) then
        GetGem("haste")
	elseif (string.find(gemType, "mastery")) then
        GetGem("mastery")
	else
		DEFAULT_CHAT_FRAME:AddMessage("Please specify a valid stat type");
	end
end

SlashCmdList["AUTOGEM"] = GemHandler;
