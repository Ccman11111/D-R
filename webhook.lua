local HTTPService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local DiscordHook = script.webhookURL.Value


game.Players.PlayerAdded:Connect(function(Player)
	Player.Chatted:Connect(function(Message)
		if Message == "!send" then
			

			-- Send the message to Discord
			local Image = script.imageURL.Value
			
			local MessageData = {
				["content"] = "",
				["embeds"] = {
					{
						['title'] = "Title",
						['description'] = Player.Name.." says hi",
						["color"] = 7506394,
						["footer"] = {
							["text"] = "D&R Webhook System"
						}
					}
				},
				
			}

			MessageData = HTTPService:JSONEncode(MessageData)
			local Success, Error = pcall(function()
				HTTPService:PostAsync(DiscordHook, MessageData)
			end)

			if not Success then
				warn("Failed to send Discord webhook: " .. Error)
			end
		end
	end)
end)

