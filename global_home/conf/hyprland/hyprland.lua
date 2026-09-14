-------------------------------
---------- MAIN FILE ----------
-------------------------------



require("modules.monitors")
require("modules.binds")
require("modules.autostart")
require("modules.env")
require("modules.permissions")
require("modules.lnf")
require("modules.animations")
require("modules.winrules")
require("modules.layout")
require("modules.misc")
require("modules.input")

if hostname == "pnp_laptop_nvidia" then
    require("env_nvidia")
end

if hostname == "pnp_desktop_AMD" then
    require("monitors")
elseif hostname == "pnp_laptop_nvidia" then
    require("monitors")
end
