-- เข้ารหัสวันเวลา
function encryptDateTime(dateTime, shift)
    local parts = {}
    for part in dateTime:gmatch("[^/]+") do
        table.insert(parts, encryptNumberAndSymbol(part, shift))
    end
    return table.concat(parts, "/")
end

local GG = gg.PACKAGE
local file_path = "/storage/emulated/0/Android/data/" .. GG .. "/cache/"
local Check_User = file_path .. "register_user.lua"

-- โหลดข้อมูลผู้ใช้จาก GitHub
local API_URL = "https://raw.githubusercontent.com/EnJirad/Mobile/main/User_CRK.lua"
local API = gg.makeRequest(API_URL).content
if API then
    local success, userContent = pcall(load(API))
    if not success then
        print("ข้อผิดพลาด: ไม่สามารถเข้าถึง Internet ได้")
        return
    end
end

-- เข้ารหัสตัวเลขและสัญลักษณ์
local shift_amount = 5
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

-- อ่านข้อมูลจากไฟล์ register_user.lua
local userFile = io.open(Check_User, "r")
if userFile then
    local userContent = userFile:read("*all")
    userFile:close()
    
    -- รับข้อมูล ID และ Key จากผู้ใช้
    local inputID = gg.prompt(
        {"ช่องกรอก : ID","ช่องกรอก : Key"},
        {"0MJA2Z","DjzqWK95sZQplo4m4GvFkkcXVOk3biEW"},
        {"text","text"}
    )

    -- เช็คว่าข้อมูลที่รับมาไม่ว่าง
    if inputID == nil or inputID[1] == "" or inputID[2] == "" then
        os.remove(Check_User)
        gg.alert("คุณยังไม่ได้กรอกข้อมูล")
        gg.setVisible(false)
        return
    end
    
    if inputID[1] == "" then
        os.remove(Check_User)
        gg.alert("คุณยังไม่ได้กรอก : ID")
        gg.setVisible(false)
        return
    end
    
    if inputID[2] == "" then
        os.remove(Check_User)
        gg.alert("คุณยังไม่ได้กรอก : Key")
        gg.setVisible(false)
        return
    end
    
    -- ตรวจสอบรูปแบบของข้อมูล
    local pattern = '{%s*No%s*=%s*"(%d+)"%s*,%s*ID%s*=%s*"(%w+)"%s*,%s*Key%s*=%s*"(%w+)"%s*,%s*Status%s*=%s*"(%a+)"%s*,%s*Time%s*=%s*"(%d+)"%s*}'
    local users = {}
    for No, ID, Key, Status, Time in userContent:gmatch(pattern) do
        table.insert(users, {No = No, ID = ID, Key = Key, Status = Status, Time = Time})
    end
    
    local foundID = false
    local foundKey = false
    for _, user in ipairs(users) do
        if user.ID == inputID[1] and user.Key == inputID[2] then
            if user.Status == "true" then
                local Admin = "============================\n" ..
                               "สร้างโดย : XTers\n" ..
                               "Game : Cookie Run Kakao\n" ..
                               "Update : 21/03/2567\n" ..
                               "============================"
                function Update_script()
                    local Telegram = "https://t.me/XTers_Gs"
                    local Discord = "https://discord.com/invite/uEtuuDcYdg"
                    local message = "🚫 Key นี้ถูกใช้ไปแล้ว : ติดต่อเช่าสคริปต์\n\n" ..
                                    "🍇 Telegram : " .. Telegram .. "\n" ..
                                    "🌶️ Discord : " .. Discord .. "\n\n" ..
                                    "เช่า 1 วัน : 20 บาท\n" ..
                                    "เช่า 3 วัน : 50 บาท\n" ..
                                    "เช่า 7 วัน : 100 บาท\n" ..
                                    "เช่า 15 วัน : 150 บาท\n" ..
                                    "เช่า 30 วัน : 200 บาท"
                                    
                    result = gg.alert(message, "Telegram", "Discord", "ปิด")
                    if result == 1 then
                        gg.copyText(Telegram)
                        gg.toast("คัดลอก Telegram เรียบร้อยแล้ว")
                        print(Admin)
                        return
                    elseif result == 2 then
                        gg.copyText(Discord)
                        gg.toast("คัดลอก Discord เรียบร้อยแล้ว")
                        print(Admin)
                        return
                    elseif result == 3 then
                        print(Admin)
                        return
                    end
                end
                gg.alert("🚫 คุณไม่ใช่ User")
                Update_script()
                os.remove(Check_User)
                return
            else
                foundID = true
                foundKey = true
                gg.alert("✅ ยืนยัน User ในระบบเรียบร้อย ✅")
                                
                local Key_Path = "/storage/emulated/0/Android/"
                local Key_File = Key_Path .. ".com.google.android.crk1"
                
                local keyFile = io.open(Key_File, "w")
                if keyFile then
                    local encrypted_ID = encryptNumberAndSymbol(user.ID, shift_amount)
                    local encrypted_Key = encryptNumberAndSymbol(user.Key, shift_amount)
                    local start_time = os.date("%Y/%m/%d/%X")
                    local end_time = os.date("%Y/%m/%d/%X", os.time() + user.Time * 24 * 60 * 60)
                    local encrypted_start_time = encryptDateTime(start_time, shift_amount)
                    local encrypted_end_time = encryptDateTime(end_time, shift_amount)
                    keyFile:write(string.format("%s|%s|%s|%s", encrypted_ID, encrypted_Key, encrypted_start_time, encrypted_end_time))
                    keyFile:close()
                else
                    os.remove(Check_User)
                end
                
                os.remove(Check_User)
                print("✅ กรุณา รัน สคริปต์ อีกครั้ง ✅")
                break
            end
        elseif user.ID == inputID[1] then
            foundID = true
        elseif user.Key == inputID[2] then
            foundKey = true
        end
    end

    if not foundID and not foundKey then
        os.remove(Check_User)
        gg.alert("🚫 ID และ Key ไม่ถูกต้อง")
    elseif not foundID then
        os.remove(Check_User)
        gg.alert("🚫 ID ไม่ถูกต้อง")
    elseif not foundKey then
        os.remove(Check_User)
        gg.alert("🚫 Key ไม่ถูกต้อง")
    end
else
    os.remove(Check_User)
    gg.alert("เกิดข้อผิดพลาดใน ระบบ")
end
