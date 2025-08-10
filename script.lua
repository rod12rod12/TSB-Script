-- Ultra-Basic Test
local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

local function FakeDash()
    -- 1. Визуальный обман
    local fakePart = Instance.new("Part")
    fakePart.Size = Vector3.new(5,1,5)
    fakePart.Position = humanoid.Parent.HumanoidRootPart.Position + Vector3.new(0,-3,0)
    fakePart.Transparency = 0.7
    fakePart.Anchored = true
    fakePart.Parent = workspace
    task.wait(0.3)
    fakePart:Destroy()

    -- 2. Физический толчок
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    task.wait(0.1)
    humanoid.Parent.HumanoidRootPart.Velocity = humanoid.Parent.HumanoidRootPart.CFrame.LookVector * 50
end

-- Кнопка
local button = Instance.new("TextButton", game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui"))
button.Text = "Fake DASH"
button.Size = UDim2.new(0.2,0,0.1,0)
button.Position = UDim2.new(0.7,0,0.8,0)
button.MouseButton1Click:Connect(FakeDash)
