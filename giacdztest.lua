-- ===== SERVICES =====
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LP = Players.LocalPlayer
local CommF = ReplicatedStorage.Remotes.CommF_
local Enemies = workspace:WaitForChild("Enemies")

-- ===== CORE VARS =====
local Root
local function UpdateRoot()
    local char = LP.Character or LP.CharacterAdded:Wait()
    Root = char:WaitForChild("HumanoidRootPart")
end
UpdateRoot()
LP.CharacterAdded:Connect(UpdateRoot)

-- ===== SETTINGS =====
local SPEED = 200
local STEP = 40
local ATTACK_DISTANCE = 30
local LOOP_DELAY = 0.15

-- ===== SAFE TWEEN =====
local function TweenTo(cf)
    local start = Root.Position
    local target = Vector3.new(cf.Position.X, start.Y, cf.Position.Z)
    local dist = (target - start).Magnitude
    local steps = math.max(1, math.floor(dist / STEP))
    for i = 1, steps do
        local pos = start:Lerp(target, i/steps)
        local t = (Root.Position - pos).Magnitude / SPEED
        TweenService:Create(Root, TweenInfo.new(t, Enum.EasingStyle.Linear), {CFrame = CFrame.new(pos)}):Play()
        task.wait(t)
    end
end

-- ===== EQUIP MELEE =====
local function EquipMelee()
    local char = LP.Character
    if not char then return end
    if char:FindFirstChildOfClass("Tool") then return end
    for _,tool in pairs(LP.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            char.Humanoid:EquipTool(tool)
            break
        end
    end
end

-- ===== FIND ENEMY =====
local function GetNearestEnemy(names)
    local best
    local minDist = math.huge
    for _,mon in pairs(Enemies:GetChildren()) do
        if mon:FindFirstChild("HumanoidRootPart")
        and mon:FindFirstChild("Humanoid")
        and mon.Humanoid.Health > 0 then
            for _,n in pairs(names) do
                if mon.Name == n then
                    local d = (Root.Position - mon.HumanoidRootPart.Position).Magnitude
                    if d < minDist then
                        minDist = d
                        best = mon
                    end
                end
            end
        end
    end
    return best
end

-- ===== "KILL" LOGIC BASED ON GIACYEUEM STYLE =====
local function DoFight(mon)
    if not mon then return end

    -- LOCK POSITION:
    if not mon:GetAttribute("Locked") then
        mon:SetAttribute("Locked", mon.HumanoidRootPart.CFrame)
    end

    -- bring to locked
    local lockedCF = mon:GetAttribute("Locked")
    mon.HumanoidRootPart.CFrame = lockedCF
    mon.HumanoidRootPart.CanCollide = false
    mon.Humanoid.WalkSpeed = 0

    -- equip melee
    EquipMelee()

    -- tele ABOVE enemy
    Root.CFrame = lockedCF * CFrame.new(0, 30, 0)

    -- damage trigger
    for i=1,3 do
        Root.CFrame = lockedCF * CFrame.new(0, 30, 0)
        task.wait(0.03)
    end
end

-- ===== AUTO LOOP =====
task.spawn(function()
    while task.wait(LOOP_DELAY) do

        local lv = LP.Data.Level.Value
        local team = LP.Team and LP.Team.Name

        local target

        -- SEA 1
        if lv <= 9 then
            if team == "Pirates" then
                target = GetNearestEnemy({"Bandit"})
            elseif team == "Marines" then
                target = GetNearestEnemy({"Trainee"})
            end
        elseif lv >= 10 and lv <= 14 then
            target = GetNearestEnemy({"Monkey"})
        end

        -- fight if near
        if target then
            DoFight(target)
        end

    end
end)
