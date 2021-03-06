local collectionService = game:GetService("CollectionService")

local module = {}

local function playMapSound(sound)
	--assert(sound:IsA("Sound"), "Non-sound tagged as a mapSound: "..sound:GetFullName())

	if sound:IsA("Sound") then
		sound:Play()
	end;
end

collectionService:GetInstanceAddedSignal("mapSound"):Connect(playMapSound)
for _, sound in pairs(collectionService:GetTagged("mapSound")) do
	playMapSound(sound)
end

function module.init(Modules)
	local network = Modules.network
	network:create("effects_requestEffect", "RemoteEvent")
end

return module