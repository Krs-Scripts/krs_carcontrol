-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
-- ██ ▄▄▀██ ▄▄▄ ██ ▄▀▄ ██ ▄▀▄ █ ▄▄▀██ ▀██ ██ ▄▄▀████ ▄▄▀█ ▄▄▀██ ▄▄▀██ ▄▀▄ ██ ▄▄▄██ ▀██ ██ ██ 
-- ██ █████ ███ ██ █ █ ██ █ █ █ ▀▀ ██ █ █ ██ ██ ████ ████ ▀▀ ██ ▀▀▄██ █ █ ██ ▄▄▄██ █ █ ██ ██ 
-- ██ ▀▀▄██ ▀▀▀ ██ ███ ██ ███ █ ██ ██ ██▄ ██ ▀▀ ████ ▀▀▄█ ██ ██ ██ ██ ███ ██ ▀▀▀██ ██▄ ██▄▀▀▄
-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

local keybind = lib.addKeybind({

    name = Config.OpenMenuCommand,
    description = 'Open Car Menu',
    defaultKey = Config.KeyMapping,

    onPressed = function(data)


    local playerPed = cache.ped

    local vehicle = GetVehiclePedIsIn(playerPed, false) 
    if not IsPedInAnyVehicle(playerPed) or not DoesEntityExist(vehicle) then 
        return 
    end

    local plate = GetVehicleNumberPlateText(vehicle)
    local fuel = GetVehicleFuelLevel(vehicle)


    lib.registerContext({
        id = 'Karos',
        title = locale('title'),
        options = {
    
            
            {
                title = locale('title_fuel'),
                icon = Config.IconFuel,
                progress =  math.ceil(fuel),
                colorScheme = Config.ColorBarFuel,
                iconColor = Config.ColorIconFuel,
                description = locale('fuel_level') .. math.ceil(fuel), 
                disabled = true,
              
            },
            {
                title = locale('plate'),
                icon = Config.IconPlate, 
                description = locale('vehicle_plate') .. plate,
                iconColor = Config.ColorIconPlate,
                disabled = true,
              
            },
            {
                title = locale('engine'),
                icon = Config.IconEngine,
                description = locale('engine_on_off'),
                iconColor = Config.ColorIconEngine,
                onSelect = function(data)
                    toggleEngine()
                end,
            },
            {
                title = locale('change_seat'),
                icon = Config.IconChangeSeat,  
                description = locale('change_seat_vehicle'),
                iconColor = Config.ColorIconSeat,
                onSelect = function(data)
                    changeSeat()
                end,
            },
            {
                title = locale('front_lights'),
                icon = Config.IconFrontLights,
                description = locale('lights_on_off'), 
                iconColor = Config.ColorIconFrontLights,
                onSelect = function(data)
                    LightControl()
                end,
            },
            {
                title = locale('driver_door'),
                icon = Config.IconDriversDoor, 
                description = locale('door'),
                iconColor = Config.ColorIconDoor,
                onSelect = function(data)
                    toggleDoors(0)
                end,
            },
            {
                title = locale('passenger_door'),
                icon = Config.IconPassengerDoor, 
                description = locale('door'),
                iconColor = Config.ColorIconDoor,
                onSelect = function(data)
                    toggleDoors(1)
                end,
            },
            {
                title = locale('driver_rear_door'),
                icon = Config.IconDriversRearDoor, 
                description = locale('door'),
                iconColor = Config.ColorIconDoor,
                onSelect = function(data)
                    toggleDoors(2)
                end,
            },
            {
                title = locale('rear_passenger_door'),
                icon = Config.IconPassengerRearDoor, 
                description = locale('door'),
                iconColor = Config.ColorIconDoor,
                onSelect = function(data)
                    toggleDoors(3)
                end,
            },
            {
                title = locale('bonnet'),
                icon = Config.IconBonnetDoor, 
                description = locale('bonnet_on_off'),
                iconColor = Config.ColorIconDoor,
                onSelect = function(data)
                    toggleDoors(4)
                end,
            },
            {
                title = locale('rear_luggage_rack'),
                icon = Config.IconLuggageDoor, 
                description = locale('rear_luggage_rack_on_off'),
                iconColor = Config.ColorIconDoor, 
                onSelect = function(data)
                    toggleDoors(5)
                end,
            },
            {
                title = locale('lock_door'),
                icon = Config.IconLockDoor, 
                description = locale('lock_all_door'),
                iconColor = Config.ColorIconAllLock, 
                onSelect = function(data)
                    lock()
                end,
            },
            {
                title = locale('window_driver'),
                icon = Config.IconWindowDriver, 
                description = locale('window_driver_open_close'),
                iconColor = Config.ColorIconWindow, 
                onSelect = function(data)
                    toggleWindow()
                end,
            },
            {
                title = locale('window_passenger'),
                icon = Config.IconWindowPassenger, 
                description = locale('window_passenger_open_close'),
                iconColor = Config.ColorIconWindow, 
                onSelect = function(data)
                    toggleWindow(1)
                end,
            },
            {
                title = locale('window_rear_driver'),
                icon = Config.IconWindowRearDriver, 
                description = locale('window_rear_driver_open_close'),
                iconColor = Config.ColorIconWindow, 
                onSelect = function(data)
                    toggleWindow(2)
                end,
            },
            {
                title = locale('window_rear_passenger'),
                icon = Config.IconWindowRearPassenger,
                description = locale('window_rear_passenger_open_close'),
                iconColor = Config.ColorIconWindow, 
                onSelect = function(data)
                    toggleWindow(3)
                end,
            },
            
        },
    })

        lib.showContext('Karos')
    end,
       
})