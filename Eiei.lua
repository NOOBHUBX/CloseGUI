-- Gui to Lua
-- Version: 3.2

-- Instances:

local NOOBHUB_Icon = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Main = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

function dragify(Frame)
	dragToggle = nil
	dragSpeed = .25 -- You can edit this.
	dragInput = nil
	dragStart = nil
	dragPos = nil

	function updateInput(input)
		Delta = input.Position - dragStart
		Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if (input.UserInputState == Enum.UserInputState.End) then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end)
end

do  local uia =  game:GetService("CoreGui").RobloxGui.Modules:FindFirstChild("NOOBHUB_Icon")  if uia then uia:Destroy() end end

NOOBHUB_Icon.Name = "NOOBHUB_Icon"
NOOBHUB_Icon.Parent = game:GetService("CoreGui").RobloxGui.Modules
NOOBHUB_Icon.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = NOOBHUB_Icon
Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Background.BackgroundTransparency = 1.000
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.474936545, 0, 0.0579896159, 0)
Background.Size = UDim2.new(0, 44, 0, 41)
dragify(Main)

Main.Name = "Main"
Main.Parent = Background
Main.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
Main.BackgroundTransparency = 0.400
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(-0.00681830524, 0, -0.000552991522, 0)
Main.Size = UDim2.new(0, 44, 0, 41)
Main.Image = "http://www.roblox.com/asset/?id=12377500818"

UICorner.Parent = Main

Toggle = false 

Main.MouseButton1Click:Connect(function()
	if Toggle == false then
		_G.UI.Enabled = false
	else
		_G.UI.Enabled = true
        end
	    Toggle = not Toggle
end)

spawn(function()
    while wait(.1) do
    pcall(function()
    for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if v.Name == "Rayfield" then
            _G.UI = v
        elseif v:FindFirstChild("Rayfield-Old") then
            local ui = v:FindFirstChild("Rayfield-Old")
            ui:Destroy()
                end
            end
        end)
    end
end)
