local ModuleTemplate = {}
local ModuleFunctions = {}
ModuleFunctions.__index = ModuleFunctions

type Module = {
    Name: string,
    ModuleState: boolean,
    F1: () -> (),
    F2: () -> (),
}

function ModuleTemplate.RegisterModule(moduleName: string, f1: () -> (), f2: () -> ()): Module
    local self = setmetatable({
        Name = moduleName,
        ModuleState = false,
        F1 = f1,
        F2 = f2,
    } :: Module, ModuleFunctions)
    return self
end

function ModuleFunctions:Enable()
    if self.ModuleState then
       warn(self.Name .. " already enabled!")
       return
    end

    self.F1()
end

function ModuleFunctions:Disable()
    if not self.ModuleState then
       warn(self.Name .. " already disabled!")
       return
    end

    self.F2()
end

return ModuleTemplate