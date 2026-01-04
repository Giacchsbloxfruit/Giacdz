-- ===== SERVICES =====
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LP = Players.LocalPlayer
local CommF = ReplicatedStorage.Remotes.CommF_

-- ===== CONFIG =====
local SPEED = 200
local STEP = 40

-- ===== GET LEVEL =====
local function GetLevel()
    return LP.Data.Level.Value
end

-- ===== CHECK QUEST =====
local function HasQuest()
    local gui = LP.PlayerGui:FindFirstChild("Main")
    if not gui then return false end
    return gui.Quest.Visible
end

-- ===== SAFE TWEEN (KHÔNG RỚT NƯỚC) =====
local function TweenTo(cf)
    local char = LP.Character or LP.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    local start = hrp.Position
    local target = Vector3.new(cf.Position.X, start.Y, cf.Position.Z)
    local dist = (target - start).Magnitude
    local steps = math.max(1, math.floor(dist / STEP))

    for i = 1, steps do
        local pos = start:Lerp(target, i / steps)
        local t = (hrp.Position - pos).Magnitude / SPEED

        TweenService:Create(
            hrp,
            TweenInfo.new(t, Enum.EasingStyle.Linear),
            {CFrame = CFrame.new(pos)}
        ):Play()

        task.wait(t)
    end
end

-- ===== AUTO TAKE / RETAKE QUEST =====
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if HasQuest() then return end

            local lv = GetLevel()
            local team = LP.Team and LP.Team.Name
            if not team then return end

            -- LEVEL 1–9
            if lv <= 9 then
                if team == "Pirates" then
                    TweenTo(CFrame.new(1058.968, 12.666, 1551.814))
                    task.wait(0.3)
                    CommF:InvokeServer("StartQuest", "BanditQuest1", 1)

                elseif team == "Marines" then
                    TweenTo(CFrame.new(-2708.5769, 23.4660, 2105.3479))
                    task.wait(0.3)
                    CommF:InvokeServer("StartQuest", "MarineQuest", 1)
                end

            -- LEVEL 10–14 (MONKEY)
            elseif lv >= 10 and lv <= 14 then
                TweenTo(CFrame.new(-1598.089, 35.55, 153.377))
                task.wait(0.3)
                CommF:InvokeServer("StartQuest", "JungleQuest", 1)
            end
        end)
    end
end)
