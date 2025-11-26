-- 恶魔中心 - UIKit风格改造版
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/FUEx0f3G"))()

-- UIKit风格配置
local UIKit = {
    Colors = {
        Primary = Color3.fromRGB(0, 122, 255),      -- iOS蓝色
        Secondary = Color3.fromRGB(88, 86, 214),    -- 紫色
        Background = Color3.fromRGB(242, 242, 247), -- 浅灰背景
        Card = Color3.fromRGB(255, 255, 255),       -- 卡片白色
        Text = Color3.fromRGB(0, 0, 0),             -- 黑色文字
        Subtext = Color3.fromRGB(142, 142, 147),    -- 灰色副文字
        Separator = Color3.fromRGB(198, 198, 200)   -- 分隔线
    },
    
    Fonts = {
        Title = Enum.Font.SourceSansBold,
        Body = Enum.Font.SourceSans,
        Detail = Enum.Font.SourceSansLight
    }
}

-- 创建UIKit风格窗口
local Window = OrionLib:MakeWindow({
    Name = "恶魔中心 - UIKit", 
    HidePremium = false, 
    SaveConfig = true,
    IntroText = "UIKit风格界面",
    ConfigFolder = "恶魔脚本UIKit",
    BackgroundColor = UIKit.Colors.Background,
    Theme = "UIKit"
})

-- 添加UIKit样式函数
function ApplyUIKitStyle(element, style)
    if style == "card" then
        element.BackgroundColor3 = UIKit.Colors.Card
    elseif style == "primary" then
        element.BackgroundColor3 = UIKit.Colors.Primary
    elseif style == "secondary" then
        element.BackgroundColor3 = UIKit.Colors.Secondary
    end
end

-- 主页标签 - UIKit风格
local HomeTab = Window:MakeTab({
    Name = "🏠 主页",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- 主页内容
HomeTab:AddSection({
    Name = "欢迎使用"
})

HomeTab:AddParagraph("恶魔中心 UIKit版", "现代化iOS风格界面设计")

HomeTab:AddSection({
    Name = "系统信息"
})

-- 状态显示卡片
local StatusCard = HomeTab:AddSection({
    Name = "📊 系统状态"
})

HomeTab:AddParagraph("帧率", "正在检测...")
HomeTab:AddParagraph("内存使用", "正在检测...")
HomeTab:AddParagraph("连接状态", "🟢 正常")

HomeTab:AddSection({
    Name = "快速设置"
})

HomeTab:AddToggle({
    Name = "🌙 暗色模式",
    Default = false,
    Callback = function(Value)
        if Value then
            -- 切换到暗色主题
            UIKit.Colors.Background = Color3.fromRGB(28, 28, 30)
            UIKit.Colors.Card = Color3.fromRGB(44, 44, 46)
            UIKit.Colors.Text = Color3.fromRGB(255, 255, 255)
        else
            -- 切换到亮色主题
            UIKit.Colors.Background = Color3.fromRGB(242, 242, 247)
            UIKit.Colors.Card = Color3.fromRGB(255, 255, 255)
            UIKit.Colors.Text = Color3.fromRGB(0, 0, 0)
        end
    end
})

-- 玩家功能标签 - UIKit风格
local PlayerTab = Window:MakeTab({
    Name = "👤 玩家",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

PlayerTab:AddSection({
    Name = "移动设置"
})

PlayerTab:AddSlider({
    Name = "🚶 移动速度",
    Min = 16,
    Max = 200,
    Default = 16,
    Color = UIKit.Colors.Primary,
    Increment = 1,
    ValueName = "速度",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end    
})

PlayerTab:AddSlider({
    Name = "🦘 跳跃高度",
    Min = 50,
    Max = 200,
    Default = 50,
    Color = UIKit.Colors.Secondary,
    Increment = 1,
    ValueName = "高度",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end    
})

PlayerTab:AddSection({
    Name = "视觉设置"
})

PlayerTab:AddToggle({
    Name = "🌙 夜视模式",
    Default = false,
    Callback = function(Value)
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

PlayerTab:AddToggle({
    Name = "👻 穿墙模式",
    Default = false,
    Callback = function(Value)
        if Value then
            Noclip = true
            Stepped = game.RunService.Stepped:Connect(function()
                if Noclip == true then
                    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
                else
                    Stepped:Disconnect()
                end
            end)
        else
            Noclip = false
        end
    end
})

-- 功能脚本标签
local ScriptsTab = Window:MakeTab({
    Name = "⚡ 功能",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

ScriptsTab:AddSection({
    Name = "飞行功能"
})

ScriptsTab:AddButton({
    Name = "🕊️ 飞行模式 V3",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/U27yQRxS'))()
    end    
})

ScriptsTab:AddButton({
    Name = "🧭 踏空行走",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
    end
})

ScriptsTab:AddSection({
    Name = "视觉功能"
})

ScriptsTab:AddButton({
    Name = "🔍 透视功能",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()
    end    
})

ScriptsTab:AddButton({
    Name = "🎨 光影效果 V4",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
    end
})

-- 游戏专用标签
local GamesTab = Window:MakeTab({
    Name = "🎮 游戏",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

GamesTab:AddSection({
    Name = "Doors"
})

GamesTab:AddButton({
    Name = "🚪 Doors 脚本",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/whXp1Ca2"))()
    end    
})

GamesTab:AddButton({
    Name = "🎯 Doors 微山版",
    Callback = function()
        loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\117\72\72\112\56\102\122\83"))()
    end
})

GamesTab:AddSection({
    Name = "其他游戏"
})

GamesTab:AddButton({
    Name = "💪 力量传奇",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/harisiskandar178/Roblox-Script/main/Muscle%20Legend"))()
    end    
})

GamesTab:AddButton({
    Name = "🏎️ 极速传奇",
    Callback = function()
        loadstring(game:HttpGet('\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\111\121\115\99\112\47\98\101\116\97\47\109\97\105\110\47\37\69\57\37\56\48\37\57\70\37\69\53\37\66\65\37\65\54\37\69\55\37\56\50\37\66\56\37\69\56\37\66\53\37\66\55\46\108\117\97'))()
    end
})

-- 设置标签
local SettingsTab = Window:MakeTab({
    Name = "⚙️ 设置",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

SettingsTab:AddSection({
    Name = "界面设置"
})

SettingsTab:AddDropdown({
    Name = "🎨 主题颜色",
    Default = "蓝色",
    Options = {"蓝色", "紫色", "绿色", "橙色", "红色"},
    Callback = function(Value)
        if Value == "蓝色" then
            UIKit.Colors.Primary = Color3.fromRGB(0, 122, 255)
        elseif Value == "紫色" then
            UIKit.Colors.Primary = Color3.fromRGB(88, 86, 214)
        elseif Value == "绿色" then
            UIKit.Colors.Primary = Color3.fromRGB(52, 199, 89)
        elseif Value == "橙色" then
            UIKit.Colors.Primary = Color3.fromRGB(255, 149, 0)
        elseif Value == "红色" then
            UIKit.Colors.Primary = Color3.fromRGB(255, 59, 48)
        end
    end    
})

SettingsTab:AddSection({
    Name = "系统设置"
})

SettingsTab:AddButton({
    Name = "🔄 重新加载脚本",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "系统提示",
            Content = "正在重新加载脚本...",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end    
})

SettingsTab:AddButton({
    Name = "🗑️ 清除配置",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "确认清除",
            Content = "确定要清除所有配置吗？",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

SettingsTab:AddSection({
    Name = "关于"
})

SettingsTab:AddParagraph("版本信息", "恶魔中心 UIKit版 v2.0")
SettingsTab:AddParagraph("开发者", "小瑜 (@x1aoy55)")
SettingsTab:AddButton({
    Name = "📞 联系支持",
    Callback = function()
        setclipboard("2207654215")
        OrionLib:MakeNotification({
            Name = "联系信息",
            Content = "QQ号已复制到剪贴板",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

-- 防挂机功能
local function AntiAfk()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end

-- 初始化完成提示
OrionLib:MakeNotification({
    Name = "欢迎使用",
    Content = "恶魔中心 UIKit版已加载完成！",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- 启动防挂机
AntiAfk()

-- 初始化OrionLib
OrionLib:Init()
