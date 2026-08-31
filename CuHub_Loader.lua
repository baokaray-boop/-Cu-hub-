if not game:IsLoaded() then game.Loaded:Wait() end
local env = getgenv()
if env.__CuHubLoading then warn("[🍋Cu hub🍋] Loader is already running.") return end
env.__CuHubLoading = true
local BASE_URL = "https://raw.githubusercontent.com/baokaray-boop/-Cu-hub-/refs/heads/main/"
local ROUTES = {
    ["107778070777162"] = { name = "Steal An Egg", file = "CuHub_StealAnEgg.lua" },
    ["126884695634066"] = { name = "Garden World", file = "GardenWorld.lua" },
    ["129954712878723"] = { name = "Trading World", file = "TradingWorld.lua" },
    ["97598239454123"]  = { name = "Garden World 2", file = "void.lua" },
}
local success, loaderError = pcall(function()
    local route = ROUTES[tostring(game.PlaceId)]
    if not route then error(("Unsupported game. PlaceId: %s"):format(game.PlaceId)) end
    local source = game:HttpGet(BASE_URL .. route.file)
    loadstring(source)()
end)
env.__CuHubLoading = nil
if not success then warn("[🍋Cu hub🍋] " .. tostring(loaderError)) end
