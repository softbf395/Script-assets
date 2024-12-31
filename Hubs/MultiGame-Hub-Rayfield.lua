if not isfile("key/Key") then
  writefile("key/Key", tostring(game.PlaceId))
else
  appendfile("key/Key", tostring(game.PlaceId))
end
local key = readfile("key/Key")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Multi Game Hub by Aedaniss7",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Multi Game Hub",
   LoadingSubtitle = "by Aedaniss7",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Aedaniss7/RayfieldHubs", -- Create a custom folder for your hub/game
      FileName = "Doors"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "KeyUsed"..game.PlaceId, -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {key} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab = Window:CreateTab("Home", 0) -- Title, Image
local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 500},
   Increment = 1,
   Suffix = "Walkspeed",
   CurrentValue = 16,
   Flag = "WalkspeedUniversalAedanHub", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      local chr=game.Players.LocalPlayer.Character
      if chr then
        local humanoid=chr:FindFirstChildOfClass("Humanoid")
        if humanoid then
          humanoid.WalkSpeed=Value
        end
      end
   end,
})
local gamesSupported={--[[6516141723, 6839171747, 10449761463]] 0}
if not table.find(gamesSupported, game.PlaceId) then
  Rayfield:Notify({
   Title = "Heres the universal options",
   Content = "Game not supported",
   Duration = 6.5,
   Image = "ban",
})
  return
end
