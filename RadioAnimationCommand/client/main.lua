
---- CONFIG

local basicanim = "shoulder" ---- this is the animation that is used when the player does not set their animation
---- options are: shoulder, chest, or handheld

---- Do not edit if you do not know what you"re doing ----

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

local animation = basicanim

RegisterCommand("radioanimation", function(src, args, raw)

local ani = args[1]

if ani == nil then
ShowNotification("~r~!ERROR!: ~w~You must provide a animation, either: shoulder, chest, or handheld!")
elseif ani == "shoulder" then
animation = "shoulder"
elseif ani == "chest" then
animation = "chest"
elseif ani == "handheld" then
animation = "handheld"
else
ShowNotification("~r~!ERROR!: ~w~Thats not a valid animation! The oprtions are: shoulder, chest, or handheld!")
end

end, false)

TriggerEvent('chat:addSuggestion', '/radioanimation', 'Change the radio animation', {
    { name="Animation", help="Pick one of these: handheld, shoulder, chest" }
})

local function handleRadioAnim(enable)
    local ped = cache.ped
    local veh = cache.vehicle
    local isAiming = IsPlayerFreeAiming(cache.playerId)
    local vehClass = GetVehicleClass(veh)

    if not DoesEntityExist(ped) or IsEntityDead(ped) or IsPauseMenuActive() then return end

    if enable then
        local emote = "radio2"

        if not emote then return end

        if animation == "chest" then
            emote = "radiochest"
        elseif animation == "shoulder" then
            emote = "radio"
        elseif animation == "handheld" then
            emote = "wt4"
        end

        exports["rpemotes"]:EmoteCommandStart(emote)
        return
    end

   exports["rpemotes"]:EmoteCancel()
end

    AddEventHandler("pma-voice:radioActive", function(radioTalking)
        handleRadioAnim(radioTalking)
    end)

    
local an = false

function g(arg)

an = not an

handleRadioAnim(an)

end

exports('animation', g)

    
