-- ABDM:R GUI

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "ABDM:R GUI", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Values
_G.banknote = true
_G.AutoKill = true


-- Functions

function banknote()
    while _G.banknote == true do
        wait(0.2)
        local player = game.Players.LocalPlayer
        local character = player.Character
        local banknotes = game.workspace:GetDescendants()
        for _, obj in ipairs(banknotes) do
            if obj.Name == "Banknote" and obj:IsA("Model") and obj:FindFirstChild("Handle") then
                character:WaitForChild("HumanoidRootPart").CFrame = obj.Handle.CFrame
            end
        end

function AutoKill()
    while _G.AutoKill == true do
        wait()
        local player = game.Players.LocalPlayer
        local character = player.Character
        local entities = game:GetService("Workspace").Entities:GetChildren()
        for _, entity in ipairs(entities) do
            if entity ~= character then
                for _, v in ipairs(entity:GetChildren()) do
                    if v:IsA("Humanoid") then
                        v.Health = 0
                    end
                end
-- Tabs
local Tab = Window:MakeTab({
	Name = "Autofarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Toggles
Tab:AddToggle({
	Name = "Banknote Autofarm",
	Default = false,
	Callback = function(Value)
        _G.banknote = value
		banknote()
	end    
})

Tab:AddToggle({
	Name = "AutoKill Entities",
	Default = false,
	Callback = function(Value)
        _G.AutoKill = value
		AutoKill()
	end   
})    





end
OrionLib:Init()