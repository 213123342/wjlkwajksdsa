local asdasdad = loadstring(game:HttpGet("https://raw.githubusercontent.com/keosgoodd/wjlkwajksdsa/main/weirdo_hub_ui_lib"))()

local ainnfdfs = asdasdad.Load("Weirdo Hub;")

local WGTAGAGAYAYAY = ainnfdfs.AddPage("Silent Aim")
WGTAGAGAYAYAY.AddLabel("Don't Change The Prediction Unless You Know What You Are Doing!")
WGTAGAGAYAYAY.AddButton("Silent Aim", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/notslumpxxx/WierdoHubCommunityUI/main/ReUploaded%23002"))()
end)

local asdasdausduashd = ainnfdfs.AddPage("Player")

asdasdausduashd.AddButton("Force Reset", function()
		for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v:Destroy()
			end
		end
end)


FLYMODE = 'Default'
FLYSPEED = 20
asdasdausduashd.AddButton("Fly ( X )", function()
	if FLYMODE == 'Default' then
		local plr = game.Players.LocalPlayer
		local Humanoid = plr.Character:FindFirstChildWhichIsA('Humanoid')
		local mouse = plr:GetMouse()
		localplayer = plr
		if workspace:FindFirstChild("Core") then
			workspace.Core:Destroy()
		end
		local Core = Instance.new("Part")
		Core.Name = "Core"
		Core.Size = Vector3.new(0.05, 0.05, 0.05)
		spawn(function()
			Core.Parent = workspace
			local Weld = Instance.new("Weld", Core)
			Weld.Part0 = Core
			Weld.Part1 = localplayer.Character.LowerTorso
			Weld.C0 = CFrame.new(0, 0, 0)
		end)
		workspace:WaitForChild("Core")
		local torso = workspace.Core
		flying = true
		local speed=FLYSPEED
		local keys={a=false,d=false,w=false,s=false}
		local e1
		local e2
		local function start()
			local pos = Instance.new("BodyPosition",torso)
			local gyro = Instance.new("BodyGyro",torso)
			pos.Name="EPIXPOS"
			pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
			pos.position = torso.Position
			gyro.maxTorque = Vector3.new(15e15, 15e15, 15e15)
			gyro.cframe = torso.CFrame
			repeat
				wait()
				Humanoid.PlatformStand=true
				local new=gyro.cframe - gyro.cframe.p + pos.position
				if not keys.w and not keys.s and not keys.a and not keys.d then
					speed=FLYSPEED
				end
				if keys.w then
					new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
					speed=speed
				end
				if keys.s then
					new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
					speed=speed
				end
				if keys.d then
					new = new * CFrame.new(speed,0,0)
					speed=speed
				end
				if keys.a then
					new = new * CFrame.new(-speed,0,0)
					speed=speed
				end
				if speed>FLYSPEED then
					speed=FLYSPEED
				end
				pos.position=new.p
				if keys.w then
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed),0,0)
				elseif keys.s then
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed),0,0)
				else
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame
				end
			until flying == false
			if gyro then gyro:Destroy() end
			if pos then pos:Destroy() end
			flying=false
			Humanoid.PlatformStand=false
			speed=FLYSPEED
		end
		e1=mouse.KeyDown:connect(function(key)
			if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
			if key=="w" then
				keys.w=true
			elseif key=="s" then
				keys.s=true
			elseif key=="a" then
				keys.a=true
			elseif key=="d" then
				keys.d=true
			elseif key=="x" then
				if flying==true then
					flying=false
				else
					flying=true
					start()
				end
			end
		end)
		e2=mouse.KeyUp:connect(function(key)
			if key=="w" then
				keys.w=false
			elseif key=="s" then
				keys.s=false
			elseif key=="a" then
				keys.a=false
			elseif key=="d" then
				keys.d=false
			end
		end)
		start()
	else
		repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		local mouse = game.Players.LocalPlayer:GetMouse()
		repeat wait() until mouse
		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Head
		local flying = false
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 5000
		local speed = 5000
		function Fly()
			local bg = Instance.new("BodyGyro", torso)
			bg.P = 9e4
			bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			bg.cframe = torso.CFrame
			local bv = Instance.new("BodyVelocity", torso)
			bv.velocity = Vector3.new(0,0.1,0)
			bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
			repeat wait()
				plr.Character:FindFirstChildWhichIsA('Humanoid').PlatformStand = true
				if ctrl.l + ctrl.r ~= 100000 or ctrl.f + ctrl.b ~= 10000 then
					speed = speed+.0+(speed/maxspeed)
					if speed > maxspeed then
						speed = maxspeed
					end
				elseif not (ctrl.l + ctrl.r ~= 5 or ctrl.f + ctrl.b ~= 5) and speed ~= 5 then
					speed = speed-5
					if speed > 5 then
						speed = -2
					end
				end
				if (ctrl.l + ctrl.r) ~= 5 or (ctrl.f + ctrl.b) ~= 5 then
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
					lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
				elseif (ctrl.l + ctrl.r) == 5 and (ctrl.f + ctrl.b) == 5 and speed ~= 5 then
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				else
					bv.velocity = Vector3.new(0,0.1,0)
				end
				bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
			until not flying
			ctrl = {f = 0, b = 0, l = 0, r = 0}
			lastctrl = {f = 0, b = 0, l = 0, r = 0}
			speed = 5
			bg:Destroy()
			bv:Destroy()
			plr.Character:FindFirstChildWhichIsA('Humanoid').PlatformStand = false
		end
		mouse.KeyDown:connect(function(key)
			if key:lower() == "x" then
				if flying then flying = false
				else
					flying = true
					Fly()
				end
			elseif key:lower() == "w" then
				ctrl.f = FLYSPEED
			elseif key:lower() == "s" then
				ctrl.b = -FLYSPEED
			elseif key:lower() == "a" then
				ctrl.l = -FLYSPEED
			elseif key:lower() == "d" then
				ctrl.r = FLYSPEED
			end
		end)
		mouse.KeyUp:connect(function(key)
			if key:lower() == "w" then
				ctrl.f = 0
			elseif key:lower() == "s" then
				ctrl.b = 0
			elseif key:lower() == "a" then
				ctrl.l = 0
			elseif key:lower() == "d" then
				ctrl.r = 0
			end
		end)
		Fly()
	end
end)
asdasdausduashd.AddButton("Fly Type", function()
    	if FLYMODE == 'Default' then
		FLYMODE = 'IY'
	game.StarterGui:SetCore("SendNotification", {
	Title = "",
	Text = 'Fly ( Glitchy ) / Reset To Change.',
	Duration = 2,
    })
	else
		FLYMODE = 'Default'
	game.StarterGui:SetCore("SendNotification", {
	Title = "Weirdo Hub; x Venus",
	Text = 'Default Fly / Reset To Change.',
	Duration = 2,
    })
	end
end)

asdasdausduashd.AddButton("Fly Speed [+]", function()
	FLYSPEED = FLYSPEED + 1
	game.StarterGui:SetCore("SendNotification", {
	Title = "Weirdo Hub;",
    Text = " [+] The Fly Speed Is Now, " ..(tostring(FLYSPEED))..".",
	Duration = 1,
})
end)

asdasdausduashd.AddButton("Fly Speed [-]", function()
    FLYSPEED = FLYSPEED - 1
    game.StarterGui:SetCore("SendNotification", {
	Title = "Weirdo Hub;",
    Text = " [-] The Fly Speed Is Now, " ..(tostring(FLYSPEED))..".",
	Duration = 1,
})
end)

asdasdausduashd.AddButton("SuperHuman (Z)", function()
    superhuman = false
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)
		if key == "z" and superhuman == false then
			superhuman = true
			game.Players.LocalPlayer.Character.Humanoid.Name = "Humz"
            game.Players.LocalPlayer.Character.Humz.WalkSpeed = 150
            game.Players.LocalPlayer.Character.Humz.JumpPower = 250
        elseif key == "z" and superhuman == true then
			superhuman = false
			game.Players.LocalPlayer.Character.Humz.WalkSpeed = 16
			game.Players.LocalPlayer.Character.Humz.JumpPower = 50
			game.Players.LocalPlayer.Character.Humz.Name = "Humanoid"
		end
	end)
end)

asdasdausduashd.AddButton("Editable SuperHuman ( Y )", function()
    superhumann = false
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)
		if key == "y" and superhumann == false then
			superhumann = true
			game.Players.LocalPlayer.Character.Humanoid.Name = "Slider"
            game.Players.LocalPlayer.Character.Slider.WalkSpeed = 16
            game.Players.LocalPlayer.Character.Slider.JumpPower = 50
        elseif key == "y" and superhumann == true then
			superhumann = false
			game.Players.LocalPlayer.Character.Slider.WalkSpeed = 16
			game.Players.LocalPlayer.Character.Slider.JumpPower = 50
			game.Players.LocalPlayer.Character.Slider.Name = "Humanoid"
		end
	end)
end)

asdasdausduashd.AddSlider("Editable SuperHuman / WalkSpeed", {Min = 0, Max = 500, Def = 16}, function(qweqwe2wqeweqweqweqweqweqweqweqweqe)
    game.Players.LocalPlayer.Character.Slider.WalkSpeed = qweqwe2wqeweqweqweqweqweqweqweqweqe
end)

asdasdausduashd.AddSlider("Editable SuperHuman / JumpPower", {Min = 0, Max = 1000, Def = 50}, function(qweqweqw9eqweqieiwe)
    game.Players.LocalPlayer.Character.Slider.JumpPower = qweqweqw9eqweqieiwe
end)

asdasdausduashd.AddButton("Fake Macro ( B )", function()
    speedgli = false
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)
		if key == "b" and speedgli == false then
			speedgli = true
			game.Players.LocalPlayer.Character.Humanoid.Name = "Humzz"
            game.Players.LocalPlayer.Character.Humzz.WalkSpeed = 300
        elseif key == "b" and speedgli == true then
			speedgli = false
			game.Players.LocalPlayer.Character.Humzz.WalkSpeed = 16
			game.Players.LocalPlayer.Character.Humzz.Name = "Humanoid"
		end
	end)
end)

asdasdausduashd.AddButton("Noclip (C)", function()
	noclip = false
	game:GetService("RunService").Stepped:connect(function()
		if noclip then
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
	plr = game.Players.LocalPlayer
	mouse = plr:GetMouse()
	mouse.KeyDown:connect(function(key)
		if key == "c" then
			noclip = not noclip
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
		end
	end)
end)


asdasdausduashd.AddButton("Anti Slow", function()
antislow = true
repeat wait(0.1)
local player = game.Players.LocalPlayer
local DeletePart = player.Character.BodyEffects.Movement:FindFirstChild('NoJumping') or player.Character.BodyEffects.Movement:FindFirstChild('ReduceWalk') or player.Character.BodyEffects.Movement:FindFirstChild('NoWalkSpeed')
if DeletePart then DeletePart:Destroy() end
if player.Character.BodyEffects.Reload.Value == true then player.Character.BodyEffects.Reload.Value = false end
until antislow == false
end)


asdasdausduashd.AddButton("Mask", function()
    local player = game.Players.LocalPlayer
				local WearingMask = player.Character:FindFirstChild('In-gameMask')
				local Humanoid = player.Character:FindFirstChildWhichIsA('Humanoid')
				if not WearingMask then
					local OwnsMask = player.Character:FindFirstChild('Mask') or player.Backpack:FindFirstChild('Mask')
					if OwnsMask then
						local MaskInventory = player.Backpack:FindFirstChild('Mask')
						if MaskInventory then
							Humanoid:EquipTool(MaskInventory)
							wait(0.1)
						end
						OwnsMask:Activate()
					else
						local ItemName = 'Mask'
						local ItemCost = 60
						local ClickDetector = game:GetService("Workspace").Ignored.Shop["[Paintball Mask] - $60"].ClickDetector
						local Location = game:GetService("Workspace").Ignored.Shop["[Paintball Mask] - $60"].Head.Position
						local function buy()
							wait()
							player.Character.HumanoidRootPart.CFrame = CFrame.new(Location)
							fireclickdetector(ClickDetector)
							if not player.Character.LeftHand:FindFirstChild('LeftWrist') then
								player.Character.LeftHand.Position = player.Character.LeftLowerArm.Position
								player.Character.RightHand.Position = player.Character.RightLowerArm.Position
							end
						end
						repeat buy() until player.Backpack:FindFirstChild(ItemName) or player.DataFolder.Currency.Value <= ItemCost or player.Character:FindFirstChild(ItemName)
						player.Character.HumanoidRootPart.CFrame = NamePos
						if not player.Character.LeftHand:FindFirstChild('LeftWrist') then
							player.Character.LeftHand.Position = player.Character.LeftLowerArm.Position
							player.Character.RightHand.Position = player.Character.RightLowerArm.Position
						end
					end

				else
					local MaskVisible = player.Character:FindFirstChild('In-gameMask'):FindFirstChild('Handle')
					if MaskVisible then
						MaskVisible:Destroy()
					end
				end
end)

asdasdausduashd.AddButton("Anonymous", function()
	pcall(function()
		game.Players.LocalPlayer.Character.Shirt:Destroy()
		game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
		game.Players.LocalPlayer.Character.Humanoid.HealthDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.Humanoid.NameDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.RightUpperLeg.Size = Vector3.new(0,0,0)
		game.Players.LocalPlayer.Character.RightUpperLeg.Massless = true
		game.Players.LocalPlayer.Character.RightUpperLeg.CanCollide = false

		asdasd = true

		while asdasd == true do 
			pcall(function()  
				game.Players.LocalPlayer.Character.RightUpperLeg.RightHipRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
				game.Players.LocalPlayer.Character.RightUpperLeg.CFrame = CFrame.new(0, 100000.4736328125, 0)
			end)
			wait()
		end
	end)
	wait(0.10)
	pcall(function()
		game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
		game.Players.LocalPlayer.Character.Pants:Destroy()
		game.Players.LocalPlayer.Character.Humanoid.HealthDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.Humanoid.NameDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.LeftUpperLeg.Size = Vector3.new(0,0,0)
		game.Players.LocalPlayer.Character.LeftUpperLeg.Massless = true
		game.Players.LocalPlayer.Character.LeftUpperLeg.CanCollide = false

		asdasd = true

		while asdasd == true do 
			pcall(function()  
				game.Players.LocalPlayer.Character.LeftUpperLeg.LeftHipRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
				game.Players.LocalPlayer.Character.LeftUpperLeg.CFrame = CFrame.new(0, 100000.4736328125, 0)
			end)
			wait()
		end
	end)
	wait(0.10)
	pcall(function()
		game.Players.LocalPlayer.Character.Head.Neck:Destroy()
		game.Players.LocalPlayer.Character.UpperTorso.NeckAttachment:Destroy()
		game.Players.LocalPlayer.Character.Humanoid.HealthDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.Humanoid.NameDisplayDistance = math.huge
		game.Players.LocalPlayer.Character.Head.Size = Vector3.new(0,0,0)
		game.Players.LocalPlayer.Character.Head.Massless = true
		game.Players.LocalPlayer.Character.Head.CanCollide = false

		asdasd = true

		while asdasd == true do 
			pcall(function()  
				game.Players.LocalPlayer.Character.Head.NeckRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
				game.Players.LocalPlayer.Character.UpperTorso.NeckRigAttachment.CFrame =  CFrame.new(0, 100000.4736328125, 0)
				game.Players.LocalPlayer.Character.Head.CFrame = CFrame.new(0, 100000.4736328125, 0)
			end)
			wait()
		end
	end)
end)

local dsfsdfsdfsdfsdfaWsdsdad = ainnfdfs.AddPage("Teleports")

dsfsdfsdfsdfsdfaWsdsdad.AddLabel("Waypoints")


dsfsdfsdfsdfsdfaWsdsdad.AddButton("AdminBase", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-729.89501953125, -39.654216766357, -885.79998779297)
end)


dsfsdfsdfsdfsdfaWsdsdad.AddButton("AdminGuns #1", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-872.63488769531, -32.649208068848, -532.40045166016)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("AdminGuns #2", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-810.33892822266, -39.649211883545, -933.86071777344)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("AdminHangout", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1009.374, -53.154, -1014.02)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("AdminJail", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-799.534, -40.649, -839.368)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Bank", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-485.668, 23.631, -285.169)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Bank Roof", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-468.723, 38.031, -286.021)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Basketball Court", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-932.195, 21.1, -481.737)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Boxing", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-236.006, 23.151, -1120.531)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Casino", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-905, 19.25, -142.75)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Cemetery", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(190.56588745117, 21.749992370605, 27.322988510132)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Church", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(205.77447509766, 23.7799949646, -59.920375823975)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Club", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-262.34463500977, 23.522811889648, -499.6611328125)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("DH Fitness", function()
	game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-75.794998168945, 22.700284957886, -633.71997070313)
end)
	
dsfsdfsdfsdfsdfaWsdsdad.AddButton("DH Kicks", function()
	game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-205.59103393555, 21.845796585083, -409.92074584961)
end)
	
dsfsdfsdfsdfsdfaWsdsdad.AddButton("DH Klips", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7.0170149803162, 21.749996185303, -105.73072814941)
end)
	

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Fire Station", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-129.52, 26.812, -114.456)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Flower Shop", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-71.061767578125, 23.144777297974, -323.15124511719)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Food Shack #1", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-342.74331665039, 23.680646896362, -297.6901550293)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Food Shack #2", function()
	game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(298.42929077148, 49.280658721924, -610.31072998047)
end)


dsfsdfsdfsdfsdfaWsdsdad.AddButton("Furniture #1", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-490.37777709961, 21.849847793579, -108.88053131104)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Furniture #2", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-624.314453125, 23.245740890503, -260.44833374023)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Gas Station", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(595.377, 49.000, -264.222)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("GreenScreen Area", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-506.33642578125, 48.602363586426, -213.86831665039)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Gunshop #1", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-582, 8.3147783279419, -739.01501464844)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Gunshop #2", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.6549987793, 48.070491790771, -622.24700927734)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("High School", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-531.16064453125, 21.874992370605, 269.4602355957)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Hospital", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(98.829124450684, 22.799991607666, -485.57116699219)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Jail Area #1", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-294.16198730469, 21.799936294556, -111.71600341797)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Jail Area #2", function()
	game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-294.09582519531, 21.797946929932, -69.033515930176)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Jail Area #3", function()
	game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-331.52569580078, 21.74800491333, -91.514602661133)
end)


dsfsdfsdfsdfsdfaWsdsdad.AddButton("Mobile Home", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-951.15283203125, -1.2344611883163, 467.71234130859)
end)


dsfsdfsdfsdfsdfaWsdsdad.AddButton("Movies", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1005.7873535156, 25.100023269653, -133.55313110352)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Phone Store", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-120.12100219727, 21.901559829712, -870.42498779297)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Playground", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-247.33399963379, 22.149866104126, -756.50299072266)
end)


dsfsdfsdfsdfsdfaWsdsdad.AddButton("Police Station", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-267.78082275391, 21.799951553345, -113.97263336182)
end)


dsfsdfsdfsdfsdfaWsdsdad.AddButton("Sewers", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112.62200164795, -26.750036239624, -277.3210144043)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Sewer Station", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-423.14276123047, -21.000005722046, 65.835586547852)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Skate Park", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-791.34893798828, 21.99981880188, -501.31112670898)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Taco Shop", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(551.8681640625, 51.06139755249, -494.22760009766)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Train Station", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(612.94427490234, 47.999992370605, -106.67445373535)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("UFO Spot", function()
game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(71.565002441406, 138.99995422363, -690.33001708984)
end)


dsfsdfsdfsdfsdfaWsdsdad.AddLabel("Extra Waypoints")

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Best Highschool Hiding Spot", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-495.40979003906, 22.48122215271, 378.34582519531)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Building Near Bank #1 N", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-322.31817626953, 80.214508056641, -271.78900146484)
end)

dsfsdfsdfsdfsdfaWsdsdad.AddButton("Building Near Bank #2 E", function()
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-440.64288330078, 80.475311279297, -220.69586181641)
end)
dsfsdfsdfsdfsdfaWsdsdad.AddButton("Empty Pool", function()
    game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-845.99987792969, 21.800006866455, -280.29000854492)
    end)
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Playground Food Shack", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-278.38232421875, 22.649866104126, -804.705078125)
    end)
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Police Station Area #2", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-245.13682556152, 21.799953460693, -91.411743164063)
    end)
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Police Station Area #3", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264.81039428711, 21.799951553345, -74.137733459473)
    end)
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Safe AFK #1", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(310.38958740234, 48.004989624023, -883.97509765625)
    end)
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Safe AFK #2", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-861.56481933594, -39.404216766357, -1132.5791015625)
    end)
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Safe AFK #3", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-833.5869140625, -3.6492006778717, -680.61407470703)
    end)
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Safe AFK #4 / BEST!", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(204.69744873047, 38.249988555908, 200000.09375)
    end)
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Unnamed Building #1", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(438.80780029297, 54.557632446289, -733.51055908203)
    end)
    
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Unnamed Building #2", function()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-104.86197662354, 28.310289382935, -1125.8115234375)
    end)
    
    dsfsdfsdfsdfsdfaWsdsdad.AddLabel("Save and Load")
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Save", function()
        plr = game:GetService('Players').LocalPlayer
            X1 = plr.Character:FindFirstChild('HumanoidRootPart').CFrame.X
            Y1 = plr.Character:FindFirstChild('HumanoidRootPart').CFrame.Y
            Z1 = plr.Character:FindFirstChild('HumanoidRootPart').CFrame.Z
    end)
    
    dsfsdfsdfsdfsdfaWsdsdad.AddButton("Load", function()
        plr = game:GetService('Players').LocalPlayer
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(X1,Y1+5,Z1)
    end)

	local asdadasdasdguttutyuttuythjdzufiuigdfugudfg = ainnfdfs.AddPage("Buy")

for _, v in pairs(workspace.Ignored.Shop:GetChildren()) do
	asdadasdasdguttutyuttuythjdzufiuigdfugudfg.AddButton(v.Name, function()
		local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		local k = game.Workspace.Ignored.Shop[v.Name]
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
		if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
			wait(.2)
			fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
		end
	end)
end

    local fwaiofhoaihgoiahgowa = ainnfdfs.AddPage("Combat")
    
	
	fwaiofhoaihgoiahgowa.AddButton("FreeFist V1 ( U )", function()
	local localPlayer       = game:GetService("Players").LocalPlayer;
	local localCharacter    = localPlayer.Character
	local Mouse             = localPlayer:GetMouse();
	local FistControl       = false
	local LeftFist          = localCharacter.LeftHand;
	local RightFist         = localCharacter.RightHand;


	-- // Services
	local uis = game:GetService("UserInputService");

	-- // Coroutine Loop + Functions
	local loopFunction = function()
		LeftFist.CFrame  = CFrame.new(Mouse.Hit.p);
		RightFist.CFrame = CFrame.new(Mouse.Hit.p);
	end;

	local Loop

	local Start = function()
		Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
	end;

	local Pause = function()
		Loop:Disconnect()
	end;

	-- // Hotkeys
	Mouse.KeyDown:connect(function(key)
		if key == "u" then
			if (FistControl == false) then
				FistControl = true;
				Start();
				pcall(function()
					localCharacter.RightHand.RightWrist:Remove();
					localCharacter.LeftHand.LeftWrist:Remove();
				end);
			elseif (FistControl == true) then
				FistControl = false;
				Pause();
				local rightwrist  = Instance.new("Motor6D");
				rightwrist.Name   = "RightWrist";
				rightwrist.Parent = localCharacter.RightHand;
				rightwrist.C0     = CFrame.new(1.18422506e-07, -0.5009287, -6.81715525e-18, 1, 0, 0, 0, 1, 0, 0, 0, 1);
				rightwrist.C1     = CFrame.new(3.55267503e-07, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1);
				rightwrist.Part0  = localCharacter.RightLowerArm;
				rightwrist.Part1  = localCharacter.RightHand;

				local leftwrist   = Instance.new("Motor6D");
				leftwrist.Name    = "LeftWrist";
				leftwrist.Parent  = localCharacter.LeftHand;
				leftwrist.C0      = CFrame.new(0.000475466368, -0.5009287, 7.59417072e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1);
				leftwrist.C1      = CFrame.new(0.000475821638, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1);
				leftwrist.Part0   = localCharacter.LeftLowerArm;
				leftwrist.Part1   = localCharacter.LeftHand;
			end;
		end;
	end);
end)

    fwaiofhoaihgoiahgowa.AddButton("FreeFist V2 ( T )", function()
        local player = game.Players.LocalPlayer
        local localPlayer       = game:GetService("Players").LocalPlayer;
        local localCharacter    = localPlayer.Character
        local Mouse             = localPlayer:GetMouse();
        local FistControl       = false
        local LeftFist          = localCharacter.LeftHand;
        local RightFist         = localCharacter.RightHand;


    for i,v in next, workspace:GetDescendants() do
        if v:IsA'Seat' then
            v:Destroy()
        end
    end
    pcall(function()
        player.Character.LeftHand.LeftWrist:Destroy();
        player.Character.RightHand.RightWrist:Destroy();
    end);
    local loopFunction = function()
        player.Character.LeftHand.CFrame  = CFrame.new(Mouse.Hit.p);
        player.Character.RightHand.CFrame = CFrame.new(Mouse.Hit.p);
    end;        
    local Loop
    local Start = function()
        Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
    end;         
    local Pause = function()
        Loop:Disconnect()
    end;
        Mouse.KeyDown:connect(function(key)
            if key == "t" then
            if FistControl == false then
                FistControl = true;
                Start();
            elseif FistControl == true then
                FistControl = false;
                Pause();
                player.Character.LeftHand.CFrame  = player.Character.LeftLowerArm.CFrame
                player.Character.RightHand.CFrame = player.Character.RightLowerArm.CFrame
            end;
        end;
    end)
end)

fwaiofhoaihgoiahgowa.AddButton("Anti Stomp", function()
    pcall(
        function()
            if tostring(game.PlaceId) == "2788229376" then
                local corepackages = game:GetService "CorePackages"
                local localplayer = game:GetService "Players".LocalPlayer
                local run = game:GetService "RunService"
                run:BindToRenderStep(
                    "rrrrrrrrrrr",
                    2000,
                    function()
                        pcall(
                            function()
        if localplayer.Character.Humanoid.Health <= 5 then
        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v:Destroy()
            end
        end
end
end)
end)
end
end)
end)
fwaiofhoaihgoiahgowa.AddToggle("Reach", false, function(bool)
local player = game.Players.LocalPlayer
    fistreac = false
if bool then
        fistreac = true
        while fistreac == true do
				wait()
				local success, err = pcall(function()
					if player.Character.BodyEffects.Attacking.Value == true then
						for i,v in pairs(game:GetService('Players'):GetChildren()) do
							if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.LeftHand.Position).Magnitude <= 50 then
								if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
									if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild('Handle') then
										firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle, v.Character.UpperTorso, 0)
									else
										firetouchinterest(game.Players.LocalPlayer.Character['RightHand'], v.Character.UpperTorso, 0)
										firetouchinterest(game.Players.LocalPlayer.Character['LeftHand'], v.Character.UpperTorso, 0)
										firetouchinterest(game.Players.LocalPlayer.Character['RightFoot'], v.Character.UpperTorso, 0)
										firetouchinterest(game.Players.LocalPlayer.Character['LeftFoot'], v.Character.UpperTorso, 0)
										firetouchinterest(game.Players.LocalPlayer.Character['RightLowerLeg'], v.Character.UpperTorso, 0)
										firetouchinterest(game.Players.LocalPlayer.Character['LeftLowerLeg'], v.Character.UpperTorso, 0)
									end
								end
							end
						end
					end
				end)
		end
else
    fistreac = false
end
end)
fwaiofhoaihgoiahgowa.AddButton("Auto Stomp ( H )", function()
    autostomp = false
    game:GetService("RunService").Stepped:connect(function()
        if autostomp then
            game.ReplicatedStorage.MainEvent:FireServer("Stomp")
        end
    end)
    plr = game.Players.LocalPlayer
    mouse = plr:GetMouse()
    mouse.KeyDown:connect(function(key)
        if key == "h" then
            autostomp = not autostomp
            game.ReplicatedStorage.MainEvent:FireServer("Stomp")
        end
    end)
end)

local qweqwewqweq = ainnfdfs.AddPage("Animations")


qweqwewqweq.AddButton("Toy Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Mage Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Elder Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Ninja Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Zombie Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	
	
	
	qweqwewqweq.AddButton("Stylish Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616140816"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Robot Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Bubbly Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
		Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
		Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=909997997"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Cartoony Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Superhero Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Astronaut Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Levitation Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Knight Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Pirate Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Vampire Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Werewolf Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Old School Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "rbxassetid://5319828216"
		Animate.idle.Animation2.AnimationId = "rbxassetid://5319831086"
		Animate.walk.WalkAnim.AnimationId = "rbxassetid://5319847204"
		Animate.run.RunAnim.AnimationId = "rbxassetid://5319844329"
		Animate.jump.JumpAnim.AnimationId = "rbxassetid://5319841935"
		Animate.climb.ClimbAnim.AnimationId = "rbxassetid://5319816685"
		Animate.fall.FallAnim.AnimationId = "rbxassetid://5319839762"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	
	
	qweqwewqweq.AddButton("Rthro Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
		Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=2510196951"
		Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=2510197257"
		Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=2510202577"
		Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=2510198475"
		Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=2510197830"
		Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=2510192778"
		Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=2510195892"
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)
	
	qweqwewqweq.AddButton("Ud'zal Animation", function()
	local Animate = game.Players.LocalPlayer.Character.Animate
			Animate.idle.Animation1.AnimationId = "rbxassetid://3303162274"
			Animate.idle.Animation2.AnimationId = "rbxassetid://3303162549"
			Animate.walk.WalkAnim.AnimationId = "rbxassetid://3303162967"
			Animate.run.RunAnim.AnimationId = "rbxassetid://3236836670"
			Animate.jump.JumpAnim.AnimationId = "rbxassetid://2510197830"
			Animate.fall.FallAnim.AnimationId = "rbxassetid://2510195892"
			Animate.climb.ClimbAnim.AnimationId = "rbxassetid://2510192778"
	game.Players.LocalPlayer.Character.Humanoid.Jump = true
	end)

	

qweqwewqweq.AddLabel("Animation Combonations")
qweqwewqweq.AddButton("Zombie Animation + Werewolf", function()
local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)




qweqwewqweq.AddButton("Barbie Animation", function()
local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616136790"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616138447"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616146177"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616139451"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616133594"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616134815"
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end)


local wj0aohg098gh0gy109tujhg1 = ainnfdfs.AddPage("Credits")

wj0aohg098gh0gy109tujhg1.AddLabel("Developer Information")

wj0aohg098gh0gy109tujhg1.AddButton("Made By : gunna#5015 and slump#3267", function()
end)

wj0aohg098gh0gy109tujhg1.AddLabel("Discord Information")

wj0aohg098gh0gy109tujhg1.AddButton("Discord ( Click To Copy )", function()
	game.StarterGui:SetCore("SendNotification", {
	Title = "Discord",
    Text = "Copied To Clipboard!",
	Duration = 1,
})
    setclipboard("https://discord.gg/RJNaVaAWxK")
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/e korblox" then
game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
game.Players.LocalPlayer.Character.RightLeg:Destroy()
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/e headless" then
local player = game.Players.LocalPlayer
        player.Character.Head:BreakJoints()
        player.Character.Head.Position = Vector3.new(0,999999999999,0)
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/e rejoin" then
if (#game:GetService("Players"):GetPlayers() <= 1) then
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    else
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
        end
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/e forcereset" then
                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v:Destroy()
            end
        end
    end
end)

modids = { 
	2395790708, -- Keo aka wydkid
	1489134213, -- Spotzs
	2489809711, -- Pablo
        2236988529, -- Tink
	
	
	}
	
	function whubdis()
		for _,Player in pairs(game:GetService('Players'):GetChildren()) do
			if table.find(modids, Player.UserId) then
				if Player.Character then
					if Player.Character.Parent.Name == 'Players' then 
						Player.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[⭐]' .. Player.DisplayName)
					end
				end
			else
				if Player.Character then
					if Player.Character.Parent.Name == 'Players' then
						if not Player.Character.UpperTorso:FindFirstChild('OriginalSize') then
							Player.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[😎]' .. Player.DisplayName)
						end
					end
				end
			end
		end
	end
	local success,err = pcall(whubdis)
	return modids 
