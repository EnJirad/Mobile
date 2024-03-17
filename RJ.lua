local Key_Path = "/storage/emulated/0/Android/data/"
local Key_File = Key_Path .. "com.google.android.key"
local Hwid = "a0%:32%:99%:e8%:e5%:01"
local KEY = "aaa"
local shift_amount = 5

-- เข้ารหัสตัวเลขและสัญลักษณ์
function encryptNumberAndSymbol(input, shift)
    local result = ""
    for i = 1, #input do
        local char = input:sub(i, i)
        local ascii = char:byte()
        if ascii >= 48 and ascii <= 57 then -- ตัวเลข
            ascii = ascii + shift
            if ascii > 57 then
                ascii = ascii - 10
            end
        elseif ascii >= 33 and ascii <= 126 then -- สัญลักษณ์ (ASCII 33-126)
            ascii = ascii + shift
            if ascii > 126 then
                ascii = ascii - 94
            end
        end
        result = result .. string.char(ascii)
    end
    return result
end

-- ถอดรหัสตัวเลขและสัญลักษณ์
function decryptNumberAndSymbol(input, shift)
    local result = ""
    for i = 1, #input do
        local char = input:sub(i, i)
        local ascii = char:byte()
        if ascii >= 48 and ascii <= 57 then -- ตัวเลข
            ascii = ascii - shift
            if ascii < 48 then
                ascii = ascii + 10
            end
        elseif ascii >= 33 and ascii <= 126 then -- สัญลักษณ์ (ASCII 33-126)
            ascii = ascii - shift
            if ascii < 33 then
                ascii = ascii + 94
            end
        end
        result = result .. string.char(ascii)
    end
    return result
end

-- ตรวจสอบว่ามีไฟล์อยู่หรือไม่
local fileExists = function(name)
    local f = io.open(name,"r")
    if f ~= nil then 
        io.close(f) 
        return true 
    else 
        return false 
    end
end

-- อ่านข้อมูลจากไฟล์
local readFile = function(name)
    local file = io.open(name, "r")
    if file then
        local content = file:read("*all")
        file:close()
        return content
    end
    return nil
end

-- สร้างไฟล์ใหม่หากไม่มีอยู่
local createFile = function(name)
    local file = io.open(name, "w")
    if file then
        file:close()
        return true
    end
    return false
end

-- ฟังก์ชั่นหลัก
local main = function()
    local inputKey = gg.prompt(
        {"Enter Key"},
        {"aaa"},
        {"text"}
    )

    if inputKey == nil then
        gg.alert("คุณยังไม่ได้กรอก Key")
        return
    end

    local inputKeyString = inputKey[1]
    if inputKeyString ~= KEY then
        gg.alert("⛔ Key ของคุณไม่ถูกต้อง ⛔")
        return
    end
    
    local encryptedHwid = encryptNumberAndSymbol(Hwid, shift_amount)
    local encryptedKey = encryptNumberAndSymbol(KEY, shift_amount)

    local fileEdit = io.open(Key_File, "w")
    if fileEdit then 
        fileEdit:write(encryptedHwid .. "=" .. encryptedKey)
        fileEdit:close()
    else
        return
    end
end

main()
