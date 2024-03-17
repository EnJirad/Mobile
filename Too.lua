local Key_Path = "/storage/emulated/0/Android/data/"
local Key_File = Key_Path .. ".com.google.android.1"
local KEY = "N2y4Vi6ZvC0bblA8AFHejwvqG4OxtcJz"
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

-- ตรวจสอบ HWID และ Key
local validateHwidAndKey = function(content)
    if content then
        local savedKey = content:match("(.+)")
        if savedKey then
            local decryptedKey = decryptNumberAndSymbol(savedKey, shift_amount)
        end
    end
    return false, nil, nil
end

-- ฟังก์ชั่นหลัก
local main = function()
    if fileExists(Key_File) then
        local inputText = readFile(Key_File)
        if inputText then
            local isValid, decryptedKey = validateHwidAndKey(inputText)
            if isValid then
                return
            else
                print("ไม่พบ Key ในระบบ")
                return
            end
        else
            print("ไม่สามารถอ่านข้อมูลจากระบบได้")
            return
        end
    else
        local success = createFile(Key_File)
        if success then
        else
            prin("⛔ ไม่สามารถ ยืนยัน User ในระบบ ได้ ⛔")
            return
        end
    end

    local inputKey = gg.prompt(
        {"ช่องกรอก : Key"},
        {""},
        {"text"}
    )

    if inputKey == nil or inputKey[1] == "" then
        gg.alert("คุณยังไม่ได้กรอก Key")
        return
    end

    local inputKeyString = inputKey[1]
    if inputKeyString ~= KEY then
        os.remove(Key_File)
        print("⛔ Key ของคุณไม่ถูกต้อง ⛔")
        return
    end
    
    local encryptedKey = encryptNumberAndSymbol(KEY, shift_amount)
    local fileEdit = io.open(Key_File, "w")
    if fileEdit then 
        fileEdit:write(encryptedKey)
        fileEdit:close()
        gg.alert("✅ ยืนยัน User ในระบบเรียบร้อย ✅")
        gg.setVisible(true)
        print("ยินดีต้อนรับ : กรุณารันสคริปต์ใหม่")
    else
        return
    end
end

main()
