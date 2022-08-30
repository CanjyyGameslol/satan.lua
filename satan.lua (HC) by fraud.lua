
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Splix"))()


local window = library:new({
    textsize = 13.5,
    font = Enum.Font.RobotoMono,
    name = "satan.lua | fraud#0948", --name
    color = Color3.fromRGB(255, 0, 0) --ui main color accent
}) -- 225,58,81

local tab = window:page({ --makes the tab
    name = "Aiming"
})

local tab1 = window:page({ --makes the tab
    name = "Misc"
})

local tab2 = window:page({ --makes the tab
    name = "Visuals"
})

local tab3 = window:page({ --makes the tab
    name = "Teleport"
})


local section3 = tab1:section({  --creates the section
    name = "Player Exploits", --name ofc 
    side = "left", --what side you want it to be on bla bla
    size = 185 --change size of secter
})

local section4 = tab2:section({  --creates the section
    name = "World & Gun Visuals", --name ofc 
    side = "left", --what side you want it to be on bla bla
    size = 125 --change size of secter
})

local section7 = tab2:section({  --creates the section
    name = "ESP", --name ofc 
    side = "right", --what side you want it to be on bla bla
    size = 125 --change size of secter
})

local section5 = tab3:section({  --creates the section
    name = "Teleport To Player", --name ofc 
    side = "left", --what side you want it to be on bla bla
    size = 100 --change size of secter
})


local section2 = tab:section({  --creates the section
    name = "Camlock", --name ofc 
    side = "left", --what side you want it to be on bla bla
    size = 175 --change size of secter
})


getgenv().tpuser = ""
section5:textbox({
    name = "Teleport",
    def = "",
    placeholder = "Enter Username",
    callback = function(value)
        getgenv().tpuser = value
    end
})

section5:button({
    name = "Teleport",
    callback = function()
        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
    local pl2 = getgenv().tpuser
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    wait(0.1)

    pl.CFrame = game.Players[pl2].Character.HumanoidRootPart.CFrame
    end
})

local ESP = loadstring(game:HttpGet("https://pastebin.com/raw/U2HwmEyF"))()

section7:toggle({
    name = "Enable ESP",
    def = false,
    callback = function(bool)
        ESP.Enabled = bool
    end
})

section7:toggle({
    name = "ESP Boxes",
    def = false,
    callback = function(bool)
        ESP.Boxes = bool
    end
})

section7:toggle({
    name = "ESP Names",
    def = false,
    callback = function(bool)
        ESP.Names = bool
    end
})

section7:toggle({
    name = "ESP Tracers",
    def = false,
    callback = function(bool)
        ESP.Tracers = bool
    end
})

getgenv().sped = false
getgenv().AntiAim2 = false
getgenv().jitter = false
getgenv().autoreload = false
getgenv().cframe = false
getgenv().BlatantAA = false
local Jit = math.random(30, 90)
local Angle = 60
local speedvalue = 0.50
game:GetService("RunService").Heartbeat:Connect(
    function()
        
        if sped then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(555), 0)
        end
        if AntiAim2 then

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.999, 0)
            wait(0.2)
        end

        if jitter then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position) *
            CFrame.Angles(0, math.rad(Angle) + math.rad((math.random(1, 2) == 1 and Jit or -Jit)), 0)
        end
        if autoreload then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                if
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild(
                        "Ammo"
                    )
                 then
                    if
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild(
                            "Ammo"
                        ).Value <= 0
                     then
                        game:GetService("ReplicatedStorage").MainEvent:FireServer(
                            "Reload",
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                        )
                    end
                end
            end
        end
        if cframe then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
                    v:Destroy()
                end
            end
            game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
                repeat
                    wait()
                until game.Players.LocalPlayer.Character
                char.ChildAdded:Connect(function(child)
                    if child:IsA("Script") then 
                        wait(0.1)
                        if child:FindFirstChild("LocalScript") then
                            child.LocalScript:FireServer()
                        end
                    end
                end)
            end)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
            game.Players.LocalPlayer.Character.Humanoid.MoveDirection * speedvalue
            end
            if BlatantAA then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * -250
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(555), 0)
                end
    end)
    
section3:toggle({
    name = "Spinbot AA",
    def = false,
    callback = function(bool)

        getgenv().sped = bool
        
    end
})

section3:toggle({
    name = "Slingshot AA",
    def = false,
    callback = function(bool)

        getgenv().AntiAim2 = bool
        
    end
})

section3:toggle({
    name = "Jitter AA",
    def = false,
    callback = function(bool)

        getgenv().jitter = bool
        
    end
})

section3:toggle({
    name = "Blatant AA",
    def = false,
    callback = function(bool)

        getgenv().BlatantAA = bool
        
    end
})


section3:toggle({
    name = "CFrame",
    def = false,
    callback = function(bool)

        getgenv().cframe = bool
        
    end
})

section3:toggle({
    name = "Auto Reload",
    def = false,
    callback = function(bool)

        getgenv().autoreload = bool
        
    end
})


getgenv().Aimbot = { 
    Enabled = false,
    Smoothness = 0.005,
    Smoothing = false,
    AirshotFunc = false,
    AirshotPart = "RightFoot",
    AimPart = "HumanoidRootPart",
    Predicting = 1.2,
    Key = Enum.KeyCode.Q,
    Toggled
}


function x(tt,tx,cc)
    game.StarterGui:SetCore("SendNotification", {
        Title = tt;
        Text = tx;
        Duration = cc;
        Icon = "rbxthumb://type=Asset&id=7262533709&w=150&h=150";
    })
end

local CurrentCamera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local LocalPlayer = game.Players.LocalPlayer
local Plr

function FindClosestPlayer()
    local ClosestDistance, ClosestPlayer = math.huge, nil;
    for _, Player in next, game:GetService("Players"):GetPlayers() do
        local ISNTKNOCKED = Player.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
        local ISNTGRABBED = Player.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil

        if Player ~= LocalPlayer then
            local Character = Player.Character
            if Character and Character.Humanoid.Health > 1 and ISNTKNOCKED and ISNTGRABBED then
                local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart
                                                                                             .Position)
                if IsVisibleOnViewPort then
                    local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
                    if Distance < ClosestDistance then
                        ClosestPlayer = Player
                        ClosestDistance = Distance
                    end
                end
            end
        end
    end
    return ClosestPlayer, ClosestDistance
end



    game:GetService("UserInputService").InputBegan:Connect(function(keygo)
           if (keygo.KeyCode == getgenv().Aimbot.Key) then
               Toggled = not Toggled
               if Toggled then
               Plr =  FindClosestPlayer()
end
         end
           
end)
game:GetService("RunService").RenderStepped:Connect(function()
if getgenv().Aimbot.Smoothing and getgenv().Aimbot.Enabled and Toggled == true then
    local Main = CFrame.new(workspace.CurrentCamera.CFrame.p, Plr.Character[getgenv().Aimbot.AimPart].Position + Plr.Character[getgenv().Aimbot.AimPart].Velocity*getgenv().Aimbot.Predicting/10)
                                 workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(Main, getgenv().Aimbot.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            elseif getgenv().Aimbot.Smoothing == false and getgenv().Aimbot.Enabled and Toggled == true then
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, Plr.Character[getgenv().Aimbot.AimPart].Position + Plr.Character[getgenv().Aimbot.AimPart].Velocity*getgenv().Aimbot.Predicting/10)
                            end

end)

if getgenv().Aimbot.AirshotFunc == true then
    
                if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                    getgenv().Aimbot.AimPart = getgenv().Aimbot.AirshotPart
                else
                    Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
                        if new == Enum.HumanoidStateType.Freefall then
                        getgenv().Aimbot.AimPart = getgenv().Aimbot.AirshotPart
                        else
                            getgenv().Aimbot.AimPart = getgenv().Aimbot.AimPart
                        end
                    end)
                end
            end

section2:toggle({
    name = "Enable Camlock [Q]",
    def = false,
    callback = function(bool)
        getgenv().Aimbot.Enabled = bool
    end
})

section2:toggle({
    name = "Airshot Function",
    def = false,
    callback = function(bool)
        getgenv().Aimbot.AirshotFunc = bool
    end
})

section2:textbox({
    name = "Prediction",
    def = "1.3",
    placeholder = "Enter Prediction",
    callback = function(value)
        getgenv().Aimbot.Predicting = value
    end
})

section2:toggle({
    name = "Smoothing",
    def = false,
    callback = function(bool)
        getgenv().Aimbot.Smoothing = bool
    end
})

section2:textbox({
    name = "Smoothness",
    def = "0.0365",
    placeholder = "Enter Smoothness Amount",
    callback = function(value)
        getgenv().Aimbot.Smoothness = value
    end
})

section3:button({
    name = "AutoClicker (B)",
    callback = function()
        local time = 0.01 --decrease if too slow increase if too fast

        click = false
        m = game.Players.LocalPlayer:GetMouse()
        m.KeyDown:connect(function(key)
        if key == "b" then
        if click == true then click = false
        elseif
        click == false then click = true
        
        while click == true do 
        wait(time)
        mouse1click()
        end
        end
        end
        end)
    end
})

section4:colorpicker(
    {
        name = "Ambient",
        cpname = nil,
        def = Color3.fromRGB(255, 255, 255),
        callback = function(value)
            game:GetService("Lighting").ColorCorrection.TintColor = value
        end
    }
)

section4:colorpicker(
    {
        name = "Gun Chams",
        cpname = nil,
        def = Color3.fromRGB(255, 255, 255),
        callback = function(value)
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
                if v:IsA('BasePart') then
                    v.Material = 'ForceField'
                    v.Color = value
                end
            end
        end
    }
)

getgenv().satamount = ""

section4:textbox({
    name = "Saturation",
    def = "0",
    placeholder = "Enter Saturation Amount",
    callback = function(value)
        getgenv().satamount = value
        game:GetService("Lighting").ColorCorrection.Saturation = getgenv().satamount
    end
})
