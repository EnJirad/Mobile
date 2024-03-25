-- 60 = 1 นาที
-- 300 = 5 นาที
-- 600 = 10 นาที

local Time = 600


local GG = gg.PACKAGE
local file_path = "/storage/emulated/0/Android/data/" .. GG .. "/cache/"
local time_file = file_path .. "outtime"

local start_time_value = 0
local end_time_value = 0

local function saveTime()
    local file = io.open(time_file, "w")
    if file then
        file:write(start_time_value .. "\n")
        file:write(end_time_value .. "\n")
        file:close()
    else
        print("ข้อผิดพลาด: 8888")
    end
end

local function createTimeFile()
    local file = io.open(time_file, "w")
    if file then
        file:close()
        start_time_value = os.time()
        end_time_value = start_time_value + Time
        saveTime()
    else
        print("ข้อผิดพลาด: 7777")
    end
end

local function loadTime()
    local file = io.open(time_file, "r")
    if file then
        start_time_value = tonumber(file:read())
        end_time_value = tonumber(file:read())
        file:close()
    else
        createTimeFile()
    end
end

local function checkTimeValidity()
    local current_time = os.time()
    if current_time > end_time_value then
        print("🚨 หมดเวลาเทสแล้ว 🚨")
        return false
    end
    return true
end

loadTime()

if checkTimeValidity() then
    local API_URL = "https://raw.githubusercontent.com/EnJirad/Mobile/main/Cookie_RK_Test.lua"
    local API = gg.makeRequest(API_URL).content

    if API then
        local userContent = pcall(load(API))
    else
        print("ข้อผิดพลาด: ไม่สามารถเข้าถึงสคริปต์ได้")
    end
end
