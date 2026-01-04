-- ===== SERVICES =====
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer
local CommF = ReplicatedStorage.Remotes.CommF_

-- ===== CORE =====
local Enemies = workspace:WaitForChild("Enemies")
local Root

local function UpdateChar()
    local char = LP.Character or LP.CharacterAdded:Wait()
    Root = char:WaitForChild("HumanoidRootPart")
end
UpdateChar()
LP.CharacterAdded:Connect(UpdateChar)

-- ===== SETTINGS =====
local SPEED = 200
local STEP = 40
local ATTACK_DISTANCE = 20
local ATTACK_DELAY = 0.18
local AUTO_KILL = true

-- ===== SAFE TWEEN (KHÔNG RỚT NƯỚC) =====
local function TweenTo(cf)
    local start = Root.Position
    local target = Vector3.new(cf.Position.X, start.Y, cf.Position.Z)
    local dist = (target - start).Magnitude
    local steps = math.max(1, math.floor(dist / STEP))

    for i = 1, steps do
        local pos = start:Lerp(target, i / steps)
        local t = (Root.Position - pos).Magnitude / SPEED
        TweenService:Create(
            Root,
            TweenInfo.new(t, Enum.EasingStyle.Linear),
            {CFrame = CFrame.new(pos)}
        ):Play()
        task.wait(t)
    end
end

-- ===== EQUIP MELEE (Ô 1) =====
local function EquipMelee()
    local char = LP.Character
    if not char then return end

    if char:FindFirstChildOfClass("Tool") then return end

    local bp = LP.Backpack:GetChildren()
    if bp[1] then
        char.Humanoid:EquipTool(bp[1])
    end
end

-- ===== ATTACK ONCE (GÂY DAME THẬT) =====
local function AttackOnce()
    local char = LP.Character
    if not char then return end
    local tool = char:FindFirstChildOfClass("Tool")
    if tool then
        tool:Activate()
    end
end

-- ===== CHECK ALIVE =====
local function Alive(mon)
    local hum = mon:FindFirstChild("Humanoid")
    return hum and hum.Health > 0
end

-- ===== AUTO KILL CORE =====
local function Kill(mon)
    if not mon or not Alive(mon) then return end
    local hrp = mon:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    -- khóa vị trí quái (anti văng)
    if not mon:GetAttribute("LockPos") then
        mon:SetAttribute("LockPos", hrp.CFrame)
    end
    hrp.CFrame = mon:GetAttribute("LockPos")

    EquipMelee()

    -- đứng trên đầu quái
    Root.CFrame = hrp.CFrame * CFrame.new(0, 25, 0)

    -- gây dame
    AttackOnce()
end

-- ===== FIND TARGET (BANDIT / MONKEY) =====
local function GetTarget()
    for _, mon in pairs(Enemies:GetChildren()) do
        if mon:FindFirstChild("HumanoidRootPart") and Alive(mon) then
            local name = mon.Name
            if name == "Bandit" or name == "Monkey" then
                if (Root.Position - mon.HumanoidRootPart.Position).Magnitude <= ATTACK_DISTANCE then
                    return mon
                end
            end
        end
    end
end

-- ===== AUTO KILL LOOP =====
task.spawn(function()
    while task.wait(ATTACK_DELAY) do
        if AUTO_KILL and Root then
            local target = GetTarget()
            if target then
                Kill(target)
            end
        end
    end
end)

-- ===== TAKE QUEST (SEA 1) =====
local function TakeQuest()
    local lv = LP.Data.Level.Value
    local team = LP.Team
    if not team then return end

    -- BANDIT (1–9)
    if lv <= 9 then
        if team.Name == "Pirates" then
            TweenTo(CFrame.new(1058.968, 12.666, 1551.814))
            task.wait(0.3)
            CommF:InvokeServer("StartQuest", "BanditQuest1", 1)
        elseif team.Name == "Marines" then
            TweenTo(CFrame.new(-2708.5769, 23.4660, 2105.3479))
            task.wait(0.3)
            CommF:InvokeServer("StartQuest", "MarineQuest", 1)
        end

    -- MONKEY (10–14)
    elseif lv >= 10 and lv <= 14 then
        TweenTo(CFrame.new(-1598.08911, 35.5501175, 153.377838))
        task.wait(0.3)
        CommF:InvokeServer("StartQuest", "JungleQuest", 1)
    end
end

-- ===== RUN =====
TakeQuest()