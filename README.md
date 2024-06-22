# Radio Animation Command

**FRAMEWORK BY Three Amigos Modding AND COMMAND BY Marfia Studios**

Improved radio anims and command

Command: /radioanimation [chest, shoulder, handheld]

## Installation

Add ``setr voice_enableRadioAnim 0`` to your server.cfg 

**This WILL NOT work if you are using rp-radio**

Works for sonoran radio and any PMA voice radio

Download the release of [NativeUILua](https://github.com/FrazzIe/NativeUILua) and add it to your server

Add `ensure RadioAnimationCommand` to your server or resources cfg file

Download [animations](https://www.gta5-mods.com/misc/leo-custom-anim) and add to stream folder


**YOU MUST USE RPEMOTES**

**Add to rpemotes/client/AnimationListCustom.lua:**


``CustomDP.Emotes = {}``
```lua
    ["radio2"] = {
        "random@arrests",
        "radio_chatter",
        "Radio 2",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["radiochest"] = {
        "anim@cop_mic_pose_002",
        "chest_mic",
        "Radio Chest",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["earpiece"] = {
        "cellphone@",
        "cellphone_call_listen_base",
        "Earpiece",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
```
