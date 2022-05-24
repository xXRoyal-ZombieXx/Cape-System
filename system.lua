--// UI Libraries \\--
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "QOL Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "QOLHub"})
--// Variables \\--
local plr = game.Players.LocalPlayer
--// Functions \\--
local function addCape()
    local cdid = 7094980593
    local BottomCapePart = Instance.new("Part",plr.Character)
    BottomCapePart.Name = "BottomCapePart"
    BottomCapePart.Size = Vector3.new(.1,.1,.1)
    local CapeHeadPart = Instance.new("Part",plr.Character)
    CapeHeadPart.Size = Vector3.new(.1,.1,.1)
    CapeHeadPart.Name = "CapeHeadPart"
    local a = Instance.new("Attachment")
    a.Name = "CapeAttachment"
    a.Position = Vector3.new(0, -2.5, 1.5)
    a.Orientation = Vector3.new(0, 0, 90)
    a.Parent = plr.Character.UpperTorso
    local b = Instance.new("Attachment")
    b.Name = "CapeAtch"
    b.Position = Vector3.new(0, .8, 0.4)
    b.Orientation = Vector3.new(0,0,90)
    b.Parent = plr.Character.UpperTorso
    local bal = Instance.new("Attachment",BottomCapePart)
    bal.Name = "bal"
    bal.Position = Vector3.new(0,0.125,0)
    bal.Orientation = Vector3.new(0,0,90)
    local cat = Instance.new("Attachment",CapeHeadPart)
    cat.Name = "cat"
    CapeHeadPart.cat.Position = Vector3.new(0,0,0.5)
    Instance.new("Beam",CapeHeadPart)
    CapeHeadPart.Beam.Attachment0 = CapeHeadPart.cat
    CapeHeadPart.Beam.Attachment1 = BottomCapePart.bal
    CapeHeadPart.Beam.Texture = "http://www.roblox.com/asset/?id="..cdid
    CapeHeadPart.Beam.Width0 = 2
    CapeHeadPart.Beam.Width1 = 2
    Instance.new("AlignOrientation",BottomCapePart)
    BottomCapePart.AlignOrientation.Attachment0 = BottomCapePart.bal
    BottomCapePart.AlignOrientation.Attachment1 = plr.Character.UpperTorso.CapeAttachment
    BottomCapePart.AlignOrientation.Responsiveness = 20
    Instance.new("AlignPosition",BottomCapePart)
    BottomCapePart.AlignPosition.Attachment0 = BottomCapePart.bal
    BottomCapePart.AlignPosition.Attachment1 = a
    BottomCapePart.AlignPosition.Position = a.WorldPosition
    BottomCapePart.AlignPosition.Responsiveness = 15
    Instance.new("BodyGyro",BottomCapePart)
    local const = Instance.new("RigidConstraint")
    const.Attachment0 = CapeHeadPart.cat
    const.Attachment1 = b
    const.Parent = CapeHeadPart
    CapeHeadPart.Anchored = false
    BottomCapePart.Anchored = false
    BottomCapePart.CanCollide = false
    BottomCapePart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    CapeHeadPart.CanCollide = false
    BottomCapePart.Parent = plr.Character
    CapeHeadPart.Parent = plr.Character
    BottomCapePart.Transparency = 1
    CapeHeadPart.Transparency = 1
end
--// UI Setup \\--
local Cosmetics = Window:MakeTab({
	Name = "Cosmetics",
	Icon = "rbxassetid://8944553355",
	PremiumOnly = false
})
addCape()
plr.CharacterAdded:Connect(addCape)
Cosmetics:AddLabel("Cape System")
Cosmetics:AddToggle({
	Name = "Cape",
	Default = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.CapeHeadPart.Beam.Enabled = Value
	end    
})
Cosmetics:AddTextbox({
	Name = "Roblox Decal Id",
	Default = "9703290951",
	TextDisappear = true,
	Callback = function(Value)
	    print(Value)
		game.Players.LocalPlayer.Character.CapeHeadPart.Beam.Texture = "rbxassetid://"..Value
	end	  
})
Cosmetics:AddTextbox({
	Name = "Light Emission",
	Default = "0",
	TextDisappear = true,
	Callback = function(Value)
	    print(Value)
		game.Players.LocalPlayer.Character.CapeHeadPart.Beam.LightEmission = tonumber(Value)
	end	  
})
Cosmetics:AddTextbox({
	Name = "Light Influence",
	Default = "0",
	TextDisappear = true,
	Callback = function(Value)
	    print(Value)
		game.Players.LocalPlayer.Character.CapeHeadPart.Beam.LightInfluence = tonumber(Value)
	end	  
})
Cosmetics:AddTextbox({
	Name = "Texture Length",
	Default = "0",
	TextDisappear = true,
	Callback = function(Value)
	    print(Value)
		game.Players.LocalPlayer.Character.CapeHeadPart.Beam.TextureLength = tonumber(Value)
	end	  
})
Cosmetics:AddTextbox({
	Name = "Texture Speed",
	Default = "0",
	TextDisappear = true,
	Callback = function(Value)
	    print(Value)
		game.Players.LocalPlayer.Character.CapeHeadPart.Beam.TextureSpeed = tonumber(Value)
	end	  
})
Cosmetics:AddTextbox({
	Name = "Transparency",
	Default = "0",
	TextDisappear = true,
	Callback = function(Value)
	    print(Value)
		game.Players.LocalPlayer.Character.CapeHeadPart.Beam.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, tonumber(Value)),NumberSequenceKeypoint.new(1, tonumber(Value))}
	end	  
})

