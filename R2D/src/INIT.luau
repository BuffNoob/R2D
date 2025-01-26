local ModuleTemplate = require("../src/Modules/ModuleTemplate")
local InfStaminaModule = require("../src/Modules/InfStamina")

local infStamina = ModuleTemplate.RegisterModule(
    InfStaminaModule.Name, 
    InfStaminaModule.EnableModule, 
    InfStaminaModule.DisableModule
)
print(infStamina)