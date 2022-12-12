--//Initializing UI
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Island Tribes Destroyer", HidePremium = true, SaveConfig = false, ConfigFolder = "OrionTest", IntroText = "By NightMare", IntroEnabled = true})
--//Notify
OrionLib:MakeNotification({
	Name = "Island Tribes Destroyer Ultimate",
	Content = "Best Script, By NightMare (:",
	Image = "rbxassetid://4483345998",
	Time = 20
})
--//Varibles
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local RunService = game:GetService("RunService")
local workspaces = game:GetService("Workspace")
--//Global Varibles
getgenv().MaxDistance = 50
_G.KillAura = false
_G.Speed = false
_G.AutoSellDiamond = false
_G.AutoSellRuby = false
_G.AutoSellZenyte = false
_G.AutoSellGold = false
_G.AutoSellIron = false
--//Functions
function GetClosestTorso()
   local closest
   local plrtorso = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
   for _,v in pairs(game:GetService("Players"):GetPlayers()) do
       if v.Character and v ~= game:GetService("Players").LocalPlayer then
           local torso = v.Character:FindFirstChild("HumanoidRootPart")
           if torso and (closest == nil or (torso.Position - plrtorso.Position).magnitude < (closest.Position - plrtorso.Position).magnitude) then
                if (torso.Position - plrtorso.Position).magnitude <= getgenv().MaxDistance then
                   closest = torso
             end
          end
       end
    end
   wait()
   return closest
end
--//Tabs
local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Combat = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Visuals = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Mic = Window:MakeTab({
	Name = "Mic",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
--//Section
local CombatFunctions = Combat:AddSection({
	Name = "CombatFunctions"
})
local AlternativeScript = Main:AddSection({
	Name = "MainFunctions"
})
--//Toggles
local Notes = Main:AddSection({
	Name = "Note: When you die RE-Enable Speed"
})

Main:AddToggle({
	Name = "Legit-Speed",
	Default = false,
	Callback = function(Value)
   _G.Speed = Value
        repeat wait(.3)
                if _G.Speed == true then
                for i = 0, 6, 6 do    
                    if LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0.6 then
                        LocalPlayer.Character:TranslateBy(LocalPlayer.Character.Humanoid.MoveDirection)
             end        
          end
       end
      until not _G.Speed
    end
})

local Notes = Main:AddSection({
	Name = "Note: Unequip all your stuff before activating this"
})

local Notes = Main:AddSection({
      Name = "Note: You need freeze by AC and activate this function"
})

local Notes = Main:AddSection({
	Name = "Secret Function (OP)"
})


Main:AddButton({
	Name = "Anti-Cheat-Bypass",
	Default = false,
	Callback = function()
local Character = LocalPlayer.Character
	if Character:FindFirstChildOfClass("Humanoid") then 
		Character:FindFirstChildOfClass("Humanoid"):ChangeState(15) 
	end
	Character:ClearAllChildren()
	local newChar = Instance.new("Model")
	newChar.Parent = workspace
	LocalPlayer.Character = newChar
	wait()
	LocalPlayer.Character = Character
	newChar:Destroy()
end
})

local Notes = Combat:AddSection({
	Name = "Note: You Can't Disable Kill Aura"
})
Combat:AddToggle({
    Name = "Kill-Aura",
	Default = false,
	Callback = function(Value)
    _G.KillAura = Value
if _G.KillAura == true then
 game:GetService("RunService").Stepped:connect(function()
    local Closest = GetClosestTorso()
    if Closest ~= nil then
        local Player = game:GetService("Players"):GetPlayerFromCharacter(Closest.Parent)
    
        -- I took this from dev forum lol
local args = {
    [1] = Player.Character
}
game:GetService("ReplicatedStorage").References.Comm.Events.ToolAction:FireServer(unpack(args))
end
   end)
      end
         end    
})
local AlternativeScript = Combat:AddSection({
	Name = "AlternativeScript"
})
Combat:AddButton({
	Name = "Infinite-Yield",
	Default = false,
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end    
})

local ESP = Visuals:AddSection({
	Name = "World-Visuals"
})
Visuals:AddButton({
	Name = "ESP-PLAYER",
	Default = false,
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FishExploitsYT/ESP/53c5835d974487dad9297200f630e58e45d69427/Good%20ESP.lua"))()
   end
})
Mic:AddToggle({
	Name = "Auto-Sell-Iron",
	Default = false,
	Callback = function(Value)
    _G.AutoSellRuby = Value
    while _G.AutoSellIron do
wait(.1)
local args = {
    [1] = "Resource Trader",
    [2] = 14
}

game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer(unpack(args))
	end 
end   
})
Mic:AddToggle({
	Name = "Auto-Sell-Gold",
	Default = false,
	Callback = function(Value)
    _G.AutoSellGold = Value
    while _G.AutoSellGold do
wait(.1)
local args = {
    [1] = "Resource Trader",
    [2] = 16
}

game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer(unpack(args))
	end 
end   
})

Mic:AddToggle({
	Name = "Auto-Sell-Ruby",
	Default = false,
	Callback = function(Value)
    _G.AutoSellRuby = Value
    while _G.AutoSellRuby do
wait(.1)
local args = {
    [1] = "Resource Trader",
    [2] = 17
}

game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer(unpack(args))
	end 
end   
})

Mic:AddToggle({
	Name = "Auto-Sell-Diamond",
	Default = false,
	Callback = function(Value)
_G.AutoSellDiamond = Value
    while _G.AutoSellDiamond do
wait(.1)
local args = {
    [1] = "Resource Trader",
    [2] = 18
}

game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer(unpack(args))
 	end
end   
})

Mic:AddToggle({
	Name = "Auto-Sell-Zenyte",
	Default = false,
	Callback = function(Value)
_G.AutoSellZenyte = Value
    while _G.AutoSellZenyte do
wait(.1)
local args = {
    [1] = "Resource Trader",
    [2] = 19
}

game:GetService("ReplicatedStorage").References.Comm.Events.TradeTrader:FireServer(unpack(args))
	end
end  
})
OrionLib:Init()
