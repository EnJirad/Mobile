local Key_Path = "/storage/emulated/0/Android/"
local Key_File = Key_Path .. ".com.google.android.crk1"
local shift_amount = 5

-- เข้ารหัสวันเวลา
function encryptDateTime(dateTime, shift)
    local parts = {}
    for part in dateTime:gmatch("[^/]+") do
        table.insert(parts, encryptNumberAndSymbol(part, shift))
    end
    return table.concat(parts, "/")
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

-- ถอดรหัสวันที่และเวลา
function decryptDateTime(dateTime, shift)
    local parts = {}
    for part in dateTime:gmatch("[^/]+") do
        table.insert(parts, decryptNumberAndSymbol(part, shift))
    end
    return table.concat(parts, "/")
end

-- ตรวจสอบ HWID และ Key
local validateHwidAndKey = function(content)
    if content then
        local encrypted_ID, encrypted_Key, encrypted_Status, encrypted_start_time, encrypted_end_time = content:match("([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)")
        if encrypted_ID and encrypted_Key and encrypted_Status and encrypted_start_time and encrypted_end_time then
            local decrypted_ID = decryptNumberAndSymbol(encrypted_ID, shift_amount)
            local decrypted_Key = decryptNumberAndSymbol(encrypted_Key, shift_amount)
            local decrypted_Status = decryptNumberAndSymbol(encrypted_Status, shift_amount)
            local decrypted_start_time = decryptDateTime(encrypted_start_time, shift_amount)
            local decrypted_end_time = decryptDateTime(encrypted_end_time, shift_amount)
            return { ID = decrypted_ID, Key = decrypted_Key, Status = decrypted_Status, Start = decrypted_start_time, End = decrypted_end_time }
        end
    end
    return nil
end

-- ตรวจสอบว่ามีไฟล์และมีคีย์อยู่ในไฟล์หรือไม่
local checkFileForKey = function()
    local file = io.open(Key_File, "r")
    if file then
        local content = file:read("*all")
        file:close()
        if content then
            local decryptedData = validateHwidAndKey(content)
            if decryptedData then
                return true, decryptedData
            end
        end
    end
    return false, nil
end

function getCurrentDate()
    local currentTime = os.time()
    return os.date("%Y/%m/%d", currentTime)
end

local currentDate = getCurrentDate()
local remainingDays = 0

local success, decryptedData = checkFileForKey()
local Tin = gg.alert('เลือก วิธีที่คุณต้องการ','เข้าสู่ระบบ','เพิ่มเวลา')

if Tin == 1 then
    local GG = gg.PACKAGE
    local file_path = "/storage/emulated/0/Android/data/" .. GG .. "/cache/"
    local Check_User = file_path .. "register_user.lua"
    
    -- โหลดข้อมูลผู้ใช้จาก GitHub
    local API_URL = "https://raw.githubusercontent.com/EnJirad/Mobile/main/User_CRK.lua"
    local API = gg.makeRequest(API_URL).content
    if API then
        local success, userContent = pcall(load(API))
    else
        print("ข้อผิดพลาด: ไม่สามารถเข้าถึง สคริปต์ ได้")
        return
    end
    
    local crkFile = io.open(Key_File, "r")
    if crkFile then
        local crkContent = crkFile:read("*all")
        crkFile:close()
        local crkData = validateHwidAndKey(crkContent)
        local userFile = io.open(Check_User, "r")
        if userFile then
            local userContent = userFile:read("*all")
            userFile:close()

            local pattern = '{%s*No%s*=%s*"(%d+)"%s*,%s*ID%s*=%s*"(%w+)"%s*,%s*Key%s*=%s*"(%w+)"%s*,%s*Status%s*=%s*"(%a+)"%s*,%s*Time%s*=%s*"(%d+)"%s*}'
            local users = {}
            for No, ID, Key, Status, Time in userContent:gmatch(pattern) do
                table.insert(users, {No = No, ID = ID, Key = Key, Status = Status, Time = Time})
            end
            
            for _, user in ipairs(users) do
                if user.ID == crkData.ID and user.Key == crkData.Key then
                    if user.Status == crkData.Status then
                        if user.Status == true then
                            local API_URL = "https://raw.githubusercontent.com/EnJirad/Mobile/main/Cookie_RK_VIP.lua"
                            local response = gg.makeRequest(API_URL)
                            if response and response.content then
                                local success, userContent = pcall(load(response.content))
                            end
                        else
                            gg.alert("กรุณาติดต่อ แอดมิน เพื่อ เซ็ต ระบบให้ก่อน\n\nสถานะ : false")
                        end
                    else
                        local startDate = os.time{year=tonumber(decryptedData.Start:sub(1,4)), month=tonumber(decryptedData.Start:sub(6,7)), day=tonumber(decryptedData.Start:sub(9,10))}
                        local endDate = os.time{year=tonumber(decryptedData.End:sub(1,4)), month=tonumber(decryptedData.End:sub(6,7)), day=tonumber(decryptedData.End:sub(9,10))}
                        local secondsPerDay = 24 * 60 * 60
                        local remainingSeconds = endDate - os.time()
                        remainingDays = math.floor(remainingSeconds / secondsPerDay)
                        
                        local keyFile = io.open(Key_File, "w")
                        if keyFile then
                            local encrypted_ID = encryptNumberAndSymbol(decryptedData.ID, shift_amount)
                            local encrypted_Key = encryptNumberAndSymbol(decryptedData.Key, shift_amount)
                            local encrypted_Status = encryptNumberAndSymbol(user.Status, shift_amount)
                            local start_time = os.date("%Y/%m/%d/%X")
                            local end_time = os.date("%Y/%m/%d/%X", os.time() + user.Time * 24 * 60 * 60)
                            local encrypted_start_time = encryptDateTime(decryptedData.Start, shift_amount)
                            local encrypted_end_time = encryptDateTime(decryptedData.End, shift_amount)
                            keyFile:write(string.format("%s|%s|%s|%s|%s", encrypted_ID, encrypted_Key, encrypted_Status, encrypted_start_time, encrypted_end_time))
                            keyFile:close()
                            os.remove(Check_User)
                        else
                            os.remove(Check_User)
                            print("เกิดข้อผิดพลาดใน ระบบ 9887")
                        end
                        local API_URL = "https://raw.githubusercontent.com/EnJirad/Mobile/main/Cookie_RK_VIP.lua"
                        local response = gg.makeRequest(API_URL)
                        if response and response.content then
                            local success, userContent = pcall(load(response.content))
                        end
                    end
                end
            end
        else
            print("เกิดข้อผิดพลาดใน ระบบ 0098")
        end
    else
        local API_URL = "https://raw.githubusercontent.com/EnJirad/Mobile/main/Main_Github_V3.lua"
        local response = gg.makeRequest(API_URL)
        if response and response.content then
            local success, userContent = pcall(load(response.content))
        end
    end
    
elseif Tin == 2 then
    local crkFile = io.open(Key_File, "r")
    if not crkFile then
        function Update_script()
            local Telegram = "https://t.me/XTers_Gs"
            local Discord = "https://discord.com/invite/uEtuuDcYdg"
            local message = "🚫 สนใจ : ติดต่อเช่าสคริปต์\n\n" ..
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
                return
            elseif result == 2 then
                gg.copyText(Discord)
                gg.toast("คัดลอก Discord เรียบร้อยแล้ว")
                return
            elseif result == 3 then
                print("ขอบคุณที่สนใจสคริปต์ของเรา")
                return
            end
        end
        gg.alert("🚫 คุณไม่ได้เป็น User ของเรา")
        Update_script()
        return
    end
    crkFile:close()
    
    local startDate = os.time{year=tonumber(decryptedData.Start:sub(1,4)), month=tonumber(decryptedData.Start:sub(6,7)), day=tonumber(decryptedData.Start:sub(9,10))}
    local endDate = os.time{year=tonumber(decryptedData.End:sub(1,4)), month=tonumber(decryptedData.End:sub(6,7)), day=tonumber(decryptedData.End:sub(9,10))}
    local secondsPerDay = 24 * 60 * 60
    local remainingSeconds = endDate - os.time()
    remainingDays = math.floor(remainingSeconds / secondsPerDay)
    local decryptedDataString = "ID : " .. decryptedData.ID .. "\nKey : " .. decryptedData.Key .. "\nสถานะ : " .. decryptedData.Status .. "\nเริ่มใช้งาน : " .. decryptedData.Start .. " น.\nหมดอายุ : " .. decryptedData.End .. " น."
    gg.alert(decryptedDataString .. "\nเวลาเหลืออีก : " .. remainingDays .. " วัน")
    
    if success then
        local GG = gg.PACKAGE
        local file_path = "/storage/emulated/0/Android/data/" .. GG .. "/cache/"
        local Check_User = file_path .. "register_user.lua"
        
        -- โหลดข้อมูลผู้ใช้จาก GitHub
        local API_URL = "https://raw.githubusercontent.com/EnJirad/Mobile/main/User_CRK.lua"
        local API = gg.makeRequest(API_URL).content
        if API then
            local success, userContent = pcall(load(API))
        else
            print("ข้อผิดพลาด: ไม่สามารถเข้าถึง สคริปต์ ได้")
        end
        
        local crkFile = io.open(Key_File, "r")
        if crkFile then
            local crkContent = crkFile:read("*all")
            crkFile:close()
            local crkData = validateHwidAndKey(crkContent)
            local userFile = io.open(Check_User, "r")
            if userFile then
                local userContent = userFile:read("*all")
                userFile:close()
    
                local pattern = '{%s*No%s*=%s*"(%d+)"%s*,%s*ID%s*=%s*"(%w+)"%s*,%s*Key%s*=%s*"(%w+)"%s*,%s*Status%s*=%s*"(%a+)"%s*,%s*Time%s*=%s*"(%d+)"%s*}'
                local users = {}
                for No, ID, Key, Status, Time in userContent:gmatch(pattern) do
                    table.insert(users, {No = No, ID = ID, Key = Key, Status = Status, Time = Time})
                end
                
                for _, user in ipairs(users) do
                    if user.ID == crkData.ID and user.Key == crkData.Key then
                    
                        local start_timestamp = os.time{year=tonumber(crkData.Start:sub(1,4)), month=tonumber(crkData.Start:sub(6,7)), day=tonumber(crkData.Start:sub(9,10))}
                        local end_timestamp = os.time{year=tonumber(crkData.End:sub(1,4)), month=tonumber(crkData.End:sub(6,7)), day=tonumber(crkData.End:sub(9,10))}
                        local daysDifference = (end_timestamp - start_timestamp) / (24 * 60 * 60)
                        if daysDifference == tonumber(user.Time) then
                            local Admin = "============================\n" ..
                                           "สร้างโดย : XTers\n" ..
                                           "Game : Cookie Run Kakao\n" ..
                                           "Update : 21/03/2567\n" ..
                                           "============================"
                            function Update_script()
                                local Telegram = "https://t.me/XTers_Gs"
                                local Discord = "https://discord.com/invite/uEtuuDcYdg"
                                local message = "🔰 ไม่สามารถเพิ่มวันเองได้ติดต่อ แอดมินเท่านั้น\n\n" ..
                                                "🍇 Telegram : " .. Telegram .. "\n" ..
                                                "🌶️ Discord : " .. Discord .. "\n\n" ..
                                                "เพิ่ม 1 วัน : 15 บาท\n" ..
                                                "เพิ่ม 3 วัน : 40 บาท\n" ..
                                                "เพิ่ม 7 วัน : 70 บาท\n" ..
                                                "เพิ่ม 15 วัน : 100 บาท\n" ..
                                                "เพิ่ม 30 วัน : 150 บาท"
                                                
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
                            Update_script()
                            return
                        else
                            local keyFile = io.open(Key_File, "w")
                            if keyFile then
                                local encrypted_ID = encryptNumberAndSymbol(user.ID, shift_amount)
                                local encrypted_Key = encryptNumberAndSymbol(user.Key, shift_amount)
                                local encrypted_Status = encryptNumberAndSymbol(user.Status, shift_amount)
                                local start_time = os.date("%Y/%m/%d/%X")
                                local end_time = os.date("%Y/%m/%d/%X", os.time() + user.Time * 24 * 60 * 60)
                                local encrypted_start_time = encryptDateTime(start_time, shift_amount)
                                local encrypted_end_time = encryptDateTime(end_time, shift_amount)
                                keyFile:write(string.format("%s|%s|%s|%s|%s", encrypted_ID, encrypted_Key, encrypted_Status, encrypted_start_time, encrypted_end_time))
                                keyFile:close()
                                gg.alert("✅ สำเร็จแล้ว ✅\n\nID : " .. user.ID .. "\nเพิ่มเวลาอีก : " .. user.Time .. " วัน")
                                os.remove(Check_User)
                            else
                                os.remove(Check_User)
                                print("เกิดข้อผิดพลาดใน ระบบ 9887")
                            end
                        end
                    end
                end
            else
                os.remove(Check_User)
                print("เกิดข้อผิดพลาดใน ระบบ 5569")
            end
        else
            os.remove(Check_User)
            print("เกิดข้อผิดพลาดใน ระบบ 2243")
        end
    end
else
    os.remove(Check_User)
    print("ข้อผิดพลาด: คุณไม่ได้เลือก อะไรเลย")
end