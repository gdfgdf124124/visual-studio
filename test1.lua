local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local colors = {
    SchemeColor = Color3.fromRGB(153,50,204),
    Background = Color3.fromRGB(32,32,32),
    Header = Color3.fromRGB(48,48,48),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(44,44,44)
}
local window = Library.CreateLib("ABDM:R GUI v1.6", colors)

local Tab1 = window:NewTab("Main")
local Tab1Section = Tab1:NewSection("AutoFarm")
local Tab25Section = Tab1:NewSection("Teleports")
local Tab26Section = Tab1:NewSection("NormalShop")
local Tab27Section = Tab1:NewSection("TrowelShop")
local Tab28Section = Tab1:NewSection("AwesomeMachine/SPIN")
local Tab8 = window:NewTab("FUNNY")
local Tab8Section = Tab8:NewSection("Sounds")
local Tab2 = window:NewTab("CAKE EVENT")
local Tab2Section = Tab2:NewSection("Cake Raid")
local Tab3 = window:NewTab("LocalPlayer")
local Tab3Section = Tab3:NewSection("LocalPlayer")
local Tab4 = window:NewTab("Extras")
local Tab4Section = Tab4:NewSection("EXTRAS")
local Tab5 = window:NewTab("Credits")
local Tab5Section = Tab5:NewSection("Credits for RobloxVBC")

--Values
local autofarmEnabled = false 
local autokillEnabled = false
local TeleportActive = false
local MaxTeleportRange = 1000

--Functions
local function banknoteAutofarm()
    while autofarmEnabled do
        wait(0.2)
        local player = game.Players.LocalPlayer
        local character = player.Character
        local banknotes = game.workspace:GetDescendants()
        for _, obj in ipairs(banknotes) do
            if obj.Name == "Banknote" and obj:IsA("Model") and obj:FindFirstChild("Handle") then
                character:WaitForChild("HumanoidRootPart").CFrame = obj.Handle.CFrame
            end
        end
    end
end

local function autokill()
    while autokillEnabled do
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
            end
        end
    end
end

local function TeleportHandles()
    while TeleportActive do 
        wait(0.1)
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character then return end
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        local handleToTeleport = nil
        local minDistance = MaxTeleportRange
        for _, tool in ipairs(workspace:GetDescendants()) do
            if tool:IsA("Tool") and tool:FindFirstChild("Handle") and tool.Parent ~= character then
                local handlePosition = tool.Handle.Position
                local distance = (handlePosition - character.HumanoidRootPart.Position).magnitude
                if distance < minDistance then
                    handleToTeleport = tool.Handle
                    minDistance = distance
                end
            end
        end
        if handleToTeleport then
            rootPart.CFrame = CFrame.new(handleToTeleport.Position)
        end
    end
end

--BUTTONS
Tab1Section:NewToggle("Banknote Autofarm", "Banknote Farm", function(toggleState)
    autofarmEnabled = toggleState
    if autofarmEnabled then
        banknoteAutofarm()
    end
end)

Tab1Section:NewToggle("Autokill Entities", "Kill entities around you", function(toggleState)
    autokillEnabled = toggleState
    if autokillEnabled then
        autokill()
    end
end)

Tab1Section:NewToggle("AutoFarm Items", "farm items around you", function(toggleState)
    TeleportActive = toggleState
    if TeleportActive then
        TeleportHandles()
    end
end)

Tab25Section:NewButton("Teleport to ItemLog", "teleports you", function()
    local player = game.Players.LocalPlayer
local character = player.Character

if character then
    local rootPart = character:FindFirstChild("HumanoidRootPart") 
    if rootPart then
        local targetCFrame = CFrame.new(278.078949, 290.730347, -293.537323)
        rootPart.CFrame = targetCFrame
    end
end
end)

Tab25Section:NewButton("Teleport to Jotaro Arena/Bridge", "teleports you", function()
    local player = game.Players.LocalPlayer
local character = player.Character

if character then
    local rootPart = character:FindFirstChild("HumanoidRootPart") 
    if rootPart then
        local targetCFrame = CFrame.new(-57.7641602, 88.6534119, 2142.20264)
        rootPart.CFrame = targetCFrame
    end
end
end)

Tab26Section:NewButton("Purchase Arrow £0", "purchases items", function()
local args ={
    [1] = "NormalShop",
    [2] = "Arrow"
}
game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
end)

Tab26Section:NewButton("Purchase Rokakaka £0", "purchases items", function()
    local args ={
        [1] = "NormalShop",
        [2] = "Rokakaka"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
end)

Tab26Section:NewButton("Purchase Shiny Arrow £15,000", "purchases items", function()
    local args ={
        [1] = "NormalShop",
        [2] = "ShinyArrow"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
end)

Tab27Section:NewButton("Purchase Trowel £3,500", "purchases items", function()
    local args ={
        [1] = "TrowelShop",
        [2] = "Trowel"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
end)

Tab27Section:NewButton("Purchase Cosmetic Cat Ticket £250", "purchases items", function()
    local args ={
        [1] = "TrowelShop",
        [2] = "CatTicket"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
end)

Tab27Section:NewButton("Purchase PIPIS £50,000", "purchases items", function()
    local args ={
        [1] = "TrowelShop",
        [2] = "PIPIS"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
end)

Tab27Section:NewButton("Purchase Renbyte's Arrow £2,500,000", "purchases items", function()
    local args ={
        [1] = "TrowelShop",
        [2] = "RenArrow"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
end)

Tab27Section:NewButton("Purchase Leo's Diary £3,000,000", "purchases items", function()
    local args ={
        [1] = "TrowelShop",
        [2] = "LEODiary"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
end)

Tab27Section:NewButton("Purchase Cake £5,000,000", "purchases items", function()
    local args ={
        [1] = "TrowelShop",
        [2] = "Cake"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Purchase"):FireServer(unpack(args))
end)

Tab28Section:NewButton("Purchase Normal Spin £100,000", "purchases items", function()
    local args ={
        [1] = "Spin"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("AwesomeMachine"):WaitForChild("Spin"):FireServer(unpack(args))
end)

Tab28Section:NewButton("Purchase Requiem Spin £12,500,000", "purchases items", function()
    local args ={
        [1] = "Requiem Spin"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("AwesomeMachine"):WaitForChild("Spin"):FireServer(unpack(args))
end)

Tab8Section:NewButton("Vegeta Song", "reproduce a sound", function()
    local args ={
        [1] = game:GetService("Players").LocalPlayer.Character.Head,
        [2] = "rbxassetid://13906818489",
        [3] = 10,
        [4] = 1,
        [5] = 0
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Taunt"):FireServer(unpack(args))
end)

Tab8Section:NewButton("Obey WEEGEE", "reproduce a sound", function()
    local args ={
        [1] = game:GetService("Players").LocalPlayer.Character.Head,
        [2] = "rbxassetid://181266147",
        [3] = 10,
        [4] = 10,
        [5] = 0
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Taunt"):FireServer(unpack(args))
end)

Tab8Section:NewButton("Mama Mia", "reproduce a sound", function()
    local args ={
        [1] = game:GetService("Players").LocalPlayer.Character.Head,
        [2] = "rbxassetid://1205895814",
        [3] = 10,
        [4] = 10,
        [5] = 0
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Taunt"):FireServer(unpack(args))
end)

Tab8Section:NewButton("Very Dark Edgy Laugh", "reproduce a sound", function()
    local args ={
        [1] = game:GetService("Players").LocalPlayer.Character.Head,
        [2] = "rbxassetid://4109723310",
        [3] = 10,
        [4] = 10,
        [5] = 0
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Taunt"):FireServer(unpack(args))
end)

Tab8Section:NewButton("Divine Justice", "reproduce a sound", function()
    local args ={
        [1] = game:GetService("Players").LocalPlayer.Character.Head,
        [2] = "rbxassetid://11982940588",
        [3] = 10,
        [4] = 10,
        [5] = 0
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Taunt"):FireServer(unpack(args))
end)

Tab2Section:NewButton("Teleport to Safe Place", "teleports you", function()
    local player = game.Players.LocalPlayer
local character = player.Character
character:WaitForChild("HumanoidRootPart").CFrame = game.Workspace.NPCs.c00lkidd.Head.CFrame
end)


Tab2Section:NewButton("Teleport to Colosseum", "teleports you", function()
    local player = game.Players.LocalPlayer
local character = player.Character

if character then
    local rootPart = character:FindFirstChild("HumanoidRootPart") 
    if rootPart then
        local targetCFrame = CFrame.new(2546.14771, 27006.0762, 2063.51221)
        rootPart.CFrame = targetCFrame
    end
end
end)

Tab3Section:NewSlider("Walkspeed", "Changes the walkspeed value of your character", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Tab3Section:NewSlider("Jumppower", "Changes the jumppower value of your character", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Tab4Section:NewButton("Infinite Yield", "Loads Infinite Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Tab4Section:NewButton("CMD-X", "Loads CMD-X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
end)

Tab4Section:NewButton("RemoteSPY", "Loads RemoteSPY", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
end)

Tab4Section:NewButton("ServerHop", "changes server", function()
    --Server Hop Script cr.Magma Hub Src
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    --[[
    local File = pcall(function()
        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
    end)
    if not File then
        table.insert(AllIDs, actualHour)
        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
    end
    ]]
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end

    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end

    Teleport()
end)
