-- App v3 - gated login/key/account system removed
-- Tabbed UI - Keybind Picker - Speed - Rapid Fire
-- made with love for LO

-- DEBUG: check ob script startet
warn("[ENI AC-TEST] SCRIPT STARTED")
pcall(function()
    game.StarterGui:SetCore("SendNotification", {Title="APP AC-TEST", Text="Script loading...", Duration=3})
end)

-- Services
local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")
local UIS         = game:GetService("UserInputService")
local Workspace   = game:GetService("Workspace")
local TS          = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")

local LP     = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- ========= INSTANT KICK BYPASS (nur safer LP.Kick Hook - kein namecall!) =========
pcall(function()
    if hookfunction then
        pcall(function()
            hookfunction(LP.Kick, function(self, msg)
                warn("[APP] Kick blocked: " .. tostring(msg))
                return
            end)
        end)
    end
end)

-- ========= SUPER-SAFE SPEED (adaptive cap gegen Infected Lands AC) =========
_G.ZQ_tZCydCwI = true  -- extra vorsichtiger modus fuer strenge ACs

-- ========= CLEANUP alter globals bei re-inject (verhindert stale-state bugs) =========
_G.xifbTlDo_REFRESH  = nil
_G.ZQ_eVBTQlkm      = nil
_G.ZQ_xlCTfPwE      = nil
_G.ZQ_XyiqJoAs = nil
-- Camera safety: falls freecam vom letzten run noch Scriptable ist -> zurueck auf Custom
pcall(function()
    if Camera.CameraType == Enum.CameraType.Scriptable then
        Camera.CameraType = Enum.CameraType.Custom
    end
    game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
    game:GetService("UserInputService").MouseIconEnabled = true
    local CAS = game:GetService("ContextActionService")
    pcall(function() CAS:UnbindAction("FreecamBlockMove") end)
end)
warn("[MINITEST] reached end of first 51 lines successfully")
