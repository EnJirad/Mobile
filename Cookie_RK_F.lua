MENUXMR = 1
gg.setVisible(false)

gg.toast("┋▓░░░░░░░░░░░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓░░░░░░░░░░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓░░░░░░░░░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓░░░░░░░░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓░░░░░░░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓▓░░░░░░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓▓▓░░░░░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓▓▓▓░░░░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓▓▓▓▓░░░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓▓▓▓▓▓░░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓▓▓▓▓▓▓░░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓▓▓▓▓▓▓▓░░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓▓▓▓▓▓▓▓▓░░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓▓▓▓▓▓▓▓▓▓░┋")
gg.sleep(60)
gg.toast("┋▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓┋")
gg.sleep(500)
gg.toast("✅ Login : 🍩 Cookie Run 🍪")
gg.sleep(500)

-------------------------------------------------------------------------------------------------------------------

local function Title()
    return
([[-------------------------------------------------------------------------------
  💢 กรุณาอ่านก่อน 🤔
  
  ⛔ ถ้าเข้าเกมใหม่ ต้อง เข้าเล่น 1 รอบ 
         และวิ่งไปถึงหัวใจ ก่อนเท่านั้น
      
  🚫 ไม่รับผิดชอบต่อ การโดนแบนของคุณ ทุกกรณี 
         ถ้าคิดจะเล่น Hack ต้องยอมรับ ว่ามีโอกาส 
         โดนแบนเสมอ โดยเฉพาะ การเล่น เว่อๆ
-------------------------------------------------------------------------------]]) 
end
gg.alert(Title())

function Game_CK()
local function Section()
    return
([[|--------------------------------------------|
   🍩 Cookie Run Kakao 🍪
|--------------------------------------------|]])
end

    local menu = gg.choice({
            "🍑 ปั้ม ด่าน ธรรมดา", --1
            "💎 ปั้ม ด่าน น้ำแข็ง ( ด่าน_วน )", --2
            "⛔ ปิดทุกฟังก์ชั่น ที่เปิดอยู่", --3
            "🛡️ ล้างประวัติ กันแบน กดอ่าน คำแนะนำ ( VIP เท่านั้น )", --4
            "🌳 อื่นๆ", --5
            "🚨 เช่าสคริปต์", --6
            "❌ ปิดสคริปต์ ❌" --7
        }, nil, Section())

    if menu == nil then
    else
        if menu == 1 then Normal_Land() end
        if menu == 2 then Buy_Script() end
        if menu == 3 then Off_All() end
        if menu == 4 then Buy_Script() end
        if menu == 5 then _Other() end
        if menu == 6 then Contact() end
        if menu == 7 then ex() end
    end
end

function Contact()
    local Telegram = "https://t.me/XTers_Gs"
    local Discord = "https://discord.com/invite/uEtuuDcYdg"
    local message = "🔰 ติดต่อเช่าสคริปต์ได้ที่ ✅\n\n" ..
                    "🍇 Telegram : " .. Telegram .. "\n" ..
                    "🌶️ Discord : " .. Discord .. "\n\n" ..
                    "เช่า 1 วัน : 20 บาท\n" ..
                    "เช่า 3 วัน : 50 บาท\n" ..
                    "เช่า 7 วัน : 100 บาท\n" ..
                    "เช่า 15 วัน : 150 บาท\n" ..
                    "เช่า 30 วัน : 200 บาท"
                    
    result = gg.alert(message, "Telegram", "Discord", "กลับ")
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
        Game_CK()
        return
    end
end

function Buy_Script()
local function Buy()
return [[-------------------------------------------------------------------------
  💢 ขออภัย เวอร์ชั่น นี้ สำหรับ VIP เท่านั้น 🤔
-------------------------------------------------------------------------]]
end

    local result = gg.alert(Buy(), "เช่าสคริปต์", "ย้อนกลับ")
    if result == 1 then
        Contact()
    elseif result == 2 then
        Game_CK()
    end
end

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

local NM1_address = nil
local NM1_Check = false
local NM1_Original = {}

local HP_Original = {}
local HP_Original_Value = {}

local NM2_Original = {}
local NM2_Check = false
local NM2_Original_Value = {}

local NM3_Original = {}
local NM3_Check = false
local NM3_Original_Value = {}

-------------------------------------------------------------------------------------------------------------------

function NM_return()
    gg.setValues(HP_Original_Value)
    gg.sleep(50)
    if NM1_Check then
        gg.clearResults()
        for address, value in pairs(NM1_Original) do
            gg.setValues({{address = address, value = value, flags = gg.TYPE_DWORD}})
        end
        gg.toast("🌳 ปิด ปั้มของ แล้ว 🏆")
        NM1_Check = false
    end
    gg.sleep(50)
    
    if NM2_Check then
        gg.clearResults()
        gg.setValues(NM2_Original_Value)
        gg.removeListItems(NM2_Original)
        gg.toast("🌿 ปิด สัตว์เลี้ยง แล้ว 🌲")
        NM2_Check = false
    end
    gg.sleep(50)
    
    if NM3_Check then
        gg.clearResults()
        gg.setValues(NM3_Original_Value)
        gg.removeListItems(NM3_Original)
        gg.toast("🎋 ปิด สัตว์เลี้ยง แล้ว ☃️")
        NM3_Check = false
    end
end

-------------------------------------------------------------------------------------------------------------------

function Normal_Land()
        result = gg.alert("🐲 เลือกการเสกของ แพท\n\n: เสกไว มีโอกาสโดนแบนสูงต้องปรับใช้เอง", "เสกปกติ", "เสกไว ( VIP )")

        if result == 1 then
            gg.toast("ใช้เสกปกติ แล้ว")
        elseif result == 2 then
            Buy_Script()
            NM_return()
            Game_CK()
            return
        else
            gg.toast("คุณยังไม่ได้เลือกวิธีการเสกของ")
            Game_CK()
            return
        end
        
        if not NM1_address then
        gg.clearResults()
        gg.setRanges(gg.REGION_CODE_APP)
        gg.searchNumber("0.81399995089F;123,346.3515625F:5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("0.81399995089", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
        HP_Original = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
        
        if #HP_Original == 0 then
            gg.alert("ไม่เจอค่า เข้าเล่น แล้วออก ❗")
            gg.clearResults()
            Game_CK()
        end
        
        HP_Original_Value = gg.getValues(HP_Original)
        for i, v in ipairs(HP_Original) do
            if v.flags == gg.TYPE_FLOAT then
                v.value = "6.10544144e35"
            end
            gg.setValues(HP_Original)
        end
      
        gg.clearResults()
        gg.setRanges(gg.REGION_CODE_APP)
        gg.searchNumber("4216;4217;4218", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        local ResultsAll = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
        
        if #ResultsAll == 0 then
            gg.alert("ไม่เจอค่า เข้าเล่น แล้วออก ❗")
            gg.clearResults()
            Game_CK()
        end
        NM1_address = ResultsAll[1].address
        
        for i = 1, #ResultsAll do
            local item = ResultsAll[i]
            if item.value == 4216 or item.value == 4217 or item.value == 4218 then
                NM1_Original[item.address] = item.value
                gg.clearResults()
            end
        end
    end
    
    local Name_Choice = {
        "💠 ใส่โค้ด 4216, 4217, 4218 เอง",
        "💰 ปั้ม เงิน 80k ใช้ x2 เหรียญ ได้ บูส วิ่ง ด้วย",
        "🏅 ปั้ม คะแนน คะแนน ห้ามเกิน 110M",
        "📦 ปั้ม กล่อง ( บูส เก็บกล่อง ออก ) : VIP เท่านั้น",
        "🎲 ปั้ม ขึ้น โบนัส รัวๆ ห้ามเกิน 80k บูสด้วย",
    }

    local typeChoice = gg.choice(Name_Choice, nil, "เลือกการเสก")
    local selectedType = Name_Choice[typeChoice]
    
    if selectedType == nil then
        gg.setValues(HP_Original_Value)
        gg.sleep(50)
        NM_return()
        gg.clearResults()
        gg.toast("คุณยังไม่ได้เลือกอะไรเลย ❗")
        Game_CK()
        return
        
    elseif selectedType == "💠 ใส่โค้ด 4216, 4217, 4218 เอง" then
        local inputCode = gg.prompt(
            {"ช่อง : 4216","ช่อง : 4217", "ช่อง : 4218"},
            {"4216","4217","4218"},
            {"","",""}
        )
    
        local Address_Value_1 = inputCode[1]
        local Address_Value_2 = inputCode[2]
        local Address_Value_3 = inputCode[3]
        local Name = "💠 ใส่โค้ด 4216, 4217, 4218 เอง"

        gg.clearResults()
        gg.setValues({
            {address = NM1_address, value = Address_Value_1, flags = gg.TYPE_DWORD},
            {address = NM1_address + 4, value = Address_Value_2, flags = gg.TYPE_DWORD},
            {address = NM1_address + 8, value = Address_Value_3, flags = gg.TYPE_DWORD}
        })
        
        gg.clearResults()
        gg.toast(Name)
        NM1_Check = true
        
    elseif selectedType == "💰 ปั้ม เงิน 80k ใช้ x2 เหรียญ ได้ บูส วิ่ง ด้วย" then
        local Address_Value_1 = "4250"
        local Address_Value_2 = "553"
        local Address_Value_3 = "4260"
        local Name = "💰 ปั้ม เงิน 80k ใช้ x2 เหรียญ ได้ บูส วิ่ง ด้วย"
        
        gg.clearResults()
        gg.setValues({
            {address = NM1_address, value = Address_Value_1, flags = gg.TYPE_DWORD},
            {address = NM1_address + 4, value = Address_Value_2, flags = gg.TYPE_DWORD},
            {address = NM1_address + 8, value = Address_Value_3, flags = gg.TYPE_DWORD}
        })
        
        gg.clearResults()
        gg.toast(Name)
        NM1_Check = true
        
    elseif selectedType == "🏅 ปั้ม คะแนน คะแนน ห้ามเกิน 110M" then
        local Address_Value_1 = "4119"
        local Address_Value_2 = "4220"
        local Address_Value_3 = "4251"
        local Name = "🏅 ปั้ม คะแนน คะแนน ห้ามเกิน 110M"
        
        gg.clearResults()
        gg.setValues({
            {address = NM1_address, value = Address_Value_1, flags = gg.TYPE_DWORD},
            {address = NM1_address + 4, value = Address_Value_2, flags = gg.TYPE_DWORD},
            {address = NM1_address + 8, value = Address_Value_3, flags = gg.TYPE_DWORD}
        })
        
        gg.clearResults()
        gg.toast(Name)
        NM1_Check = true
        
    elseif selectedType == "📦 ปั้ม กล่อง ( บูส เก็บกล่อง ออก ) : VIP เท่านั้น" then
        Buy_Script()
        NM1_Check = false
        NM_return()
        return
    
    elseif selectedType == "🎲 ปั้ม ขึ้น โบนัส รัวๆ ห้ามเกิน 80k บูสด้วย" then
        local Address_Value_1 = "0"
        local Address_Value_2 = "4121"
        local Address_Value_3 = "4344"
        local Name = "🎲 ปั้ม ขึ้น โบนัส รัวๆ ห้ามเกิน 80k บูสด้วย"

        gg.clearResults()
        gg.setValues({
            {address = NM1_address, value = Address_Value_1, flags = gg.TYPE_DWORD},
            {address = NM1_address + 4, value = Address_Value_2, flags = gg.TYPE_DWORD},
            {address = NM1_address + 8, value = Address_Value_3, flags = gg.TYPE_DWORD}
        })
        
        gg.clearResults()
        gg.toast(Name)
        NM1_Check = true
    end
    
    for i = 10, 0, -1 do
        gg.toast("เริ่มเกม ก่อน " .. i .. " วินาที")
        gg.sleep(1000)
    end

    local Choice_Pet = {
        "🎃 ❲ แพท น้ำเต้า ❳", --1
        "☃️ ❲ แพท หมวกซานต้า หรือ ตัวนิ้วโป้ง ❳", --2
        "🍫 ❲ แพท ช็อคโก้ดรอป ❳", --3
    }
    
    local typeChoice = gg.choice(Choice_Pet, nil, "เลือกแพท")
    local inputPet = gg.prompt(
            {"แพท เสก : ค่าเริ่มต้น ดาวสามสี"},
            {"4265"},
            {""}
        )
        
    local Value_ID = inputPet[1]
    if typeChoice == nil then
        NM_return()
        gg.toast("คุณยังไม่ได้เลือก แพท เลย ❗")
        Game_CK()
        return
    elseif typeChoice == 1 then
        local Name = "🎃 เปิดใช้งาน แพท แล้ว ✅"
        
        gg.clearResults()
        gg.setRanges(gg.REGION_C_ALLOC)
        gg.searchNumber("1000;407", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("407", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        NM2_Original = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
        
        if #NM2_Original == 0 then
            gg.alert("หาค่าแพท ไม่เจอ ออกเข้าใหม่ ❗")
            gg.clearResults()
            NM_return()
            Game_CK()
            return
        end
        
        NM2_Original_Value = gg.getValues(NM2_Original)
        for i, v in ipairs(NM2_Original) do
        	if v.flags == gg.TYPE_DWORD then
        		v.value = Value_ID
        		v.freeze = true
        	end
        end
        gg.addListItems(NM2_Original)
        gg.clearResults()
        gg.toast(Name)
        NM2_Check = true
        
    elseif typeChoice == 2 then
        local Name = "☃️ เปิดใช้งาน แพท แล้ว ✅"
        
        gg.clearResults()
        gg.setRanges(gg.REGION_C_ALLOC)
        gg.searchNumber("1000;554", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("554", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        NM2_Original = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
        if #NM2_Original == 0 then
            gg.alert("หาค่าแพท ไม่เจอ ออกเข้าใหม่ ❗")
            gg.clearResults()
            NM_return()
            Game_CK()
            return
        end
        
        NM2_Original_Value = gg.getValues(NM2_Original)
        for i, v in ipairs(NM2_Original) do
        	if v.flags == gg.TYPE_DWORD then
        		v.value = Value_ID
        		v.freeze = true
        	end
        end
        gg.addListItems(NM2_Original)
        gg.clearResults()
        gg.toast(Name)
        NM2_Check = true
        
    elseif typeChoice == 3 then
        local Name = "🍫 เปิดใช้งาน แพท แล้ว ✅"
        local Value_1 = "1018"
        local Value_2 = inputPet[1]
            
        gg.clearResults()
        gg.setRanges(gg.REGION_C_ALLOC)
        gg.searchNumber("1,015D;0D;1,000D:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber("1015D;0D", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        NM3_Original = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
        
        if #NM3_Original == 0 then
            gg.alert("หาค่าแพท ไม่เจอ ออกเข้าใหม่ ❗")
            gg.clearResults()
            NM_return()
            Game_CK()
            return
        end
        
        NM3_Original_Value = gg.getValues(NM3_Original)
        for i, v in ipairs(NM3_Original) do
            if v.value == 1015 then
                v.value = Value_1
                v.freeze = true
            end
        end
        
        for i, v in ipairs(NM3_Original) do
            if v.value == 0 then
                v.value = Value_2
                v.freeze = true
            end
        end
        
        gg.addListItems(NM3_Original)
        gg.clearResults()
        gg.toast(Name)
        NM3_Check = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

function _Other()
    local menu = gg.choice({
        "🚀 เร่งความเร็วเกม", --1
        "🌈 เลือกซื้อ Booter", --2
        "🎆 ปั้ม ผงวิเศษ ( VIP เท่านั้น )", --3
        "🏖️ ปลดล็อค คุกกี้ นางฟ้าทะเล ( VIP เท่านั้น )", --4
        "◀️ กลับ" --5
    }, nil, "🔰 ฟังชั่น อื่นๆ 🔰")

    if menu == nil then 
    else
        if menu == 1 then Speed_Game() end
        if menu == 2 then Buy_Boot() end
        if menu == 3 then Buy_Script() end
        if menu == 4 then Buy_Script() end
        if menu == 5 then Game_CK() end
    end
end

local isSpeed = false
function Speed_Game()
    if isSpeed == false then
        local currentSpeed = gg.getSpeed()
        if currentSpeed then
            Setnum = gg.prompt(
             {'ใส่ความเร็ว [1; 30]'}, nil,
             {'number'}
            )
            num = Setnum[1]
            if num then
                gg.setSpeed(num)
                gg.toast("🚀 เปิด เร่งความเร็ว " .. num .. " เเล้ว")
            else
                gg.toast("❌ ค่าเร็วต้องอยู่ระหว่าง 1 ถึง 6 เท่านั้น")
            end
        end
        isSpeed = true
    else
        local currentSpeed = gg.getSpeed()
        if currentSpeed ~= "1" then
            gg.setSpeed("1")
            gg.toast("🚨 ปิด เร่งความเร็วเกม แล้ว")
        end
        isSpeed = false
    end
end


-------------------------------------------------------------------------------------------------------------------

local AG_Original = {}
local isBuySagged = false
local Original_Buy_Values = {}

function Buy_Boot()
    if isBuySagged == false then
        local Item_Names = {
            "🔩 ❲ ความสามารถแม่เหล็ก ❳",
            "💰x2 ❲ เหรียญสองเท่า ❳",
            "🏇 ❲ ออกตัวเร็ว ❳",
            "👥 ❲ วิ่งผลัด ❳",
            "🔋 ❲ การเสียพลังงานช้าลง ❳",
            "😇 ❲ คืนชีพ 1 ครั้ง ด้วยพลัง 40% ❳",
            "🏄 ❲ ความเร็วเมื่อวิ่งได้ความเร็วแสงเพิ่มขึ้น ❳",
            "🏗️ ❲ ชนสิ่งกีดขวางได้ 40% ❳",
            "🏍️ ❲ ความเร็วพื้นฐานเพิ่มขึ้น 30% ❳",
            "💰 ❲ เปลี่ยนสิ่งกีดขวางให้เป็นเหรียญ ❳",
            "🕶️ ❲ ลดความเสียหายจากการชน ❳",
            "💉 ❲ ประสิทธิภาพของโพชั่นพลังเพิ่มขึ้น ❳",
            "📤 ❲ ช่วยขึ้นจากหลุม 2 ครั้ง ❳",
        }
        
        local typeChoice = gg.choice(Item_Names, nil, "เลือกการเสก")
        if typeChoice == nil then
            return
        end
        
        local selectedType = Item_Names[typeChoice]
        local ID
        local Name
        
        if selectedType == "🔩 ❲ ความสามารถแม่เหล็ก ❳" then
            ID = "2013"
            Name = "🔩 ❲ ความสามารถแม่เหล็ก ❳"
        elseif selectedType == "💰x2 ❲ เหรียญสองเท่า ❳" then
            ID = "2003"
            Name = "💰x2 ❲ เหรียญสองเท่า ❳"
        elseif selectedType == "🏇 ❲ ออกตัวเร็ว ❳" then
            ID = "2001"
            Name = "🏇 ❲ ออกตัวเร็ว ❳"
        elseif selectedType == "👥 ❲ วิ่งผลัด ❳" then
            ID = "2002"
            Name = "👥 ❲ วิ่งผลัด ❳"
        elseif selectedType == "🔋 ❲ การเสียพลังงานช้าลง ❳" then
            ID = "2005"
            Name = "🔋 ❲ การเสียพลังงานช้าลง ❳"
        elseif selectedType == "😇 ❲ คืนชีพ 1 ครั้ง ด้วยพลัง 40% ❳" then
            ID = "2006"
            Name = "😇 ❲ คืนชีพ 1 ครั้ง ด้วยพลัง 40% ❳"
        elseif selectedType == "🏄 ❲ ความเร็วเมื่อวิ่งได้ความเร็วแสงเพิ่มขึ้น ❳" then
            ID = "2007"
            Name = "🏄 ❲ ความเร็วเมื่อวิ่งได้ความเร็วแสงเพิ่มขึ้น ❳"
        elseif selectedType == "🏗️ ❲ ชนสิ่งกีดขวางได้ 40% ❳" then
            ID = "2008"
            Name = "🏗️ ❲ ชนสิ่งกีดขวางได้ 40% ❳"
        elseif selectedType == "🏍️ ❲ ความเร็วพื้นฐานเพิ่มขึ้น 30% ❳" then
            ID = "2009"
            Name = "🏍️ ❲ ความเร็วพื้นฐานเพิ่มขึ้น 30% ❳"
        elseif selectedType == "💰 ❲ เปลี่ยนสิ่งกีดขวางให้เป็นเหรียญ ❳" then
            ID = "2010"
            Name = "💰 ❲ เปลี่ยนสิ่งกีดขวางให้เป็นเหรียญ ❳"
        elseif selectedType == "🕶️ ❲ ลดความเสียหายจากการชน ❳" then
            ID = "2011"
            Name = "🕶️ ❲ ลดความเสียหายจากการชน ❳"
        elseif selectedType == "💉 ❲ ประสิทธิภาพของโพชั่นพลังเพิ่มขึ้น ❳" then
            ID = "2012"
            Name = "💉 ❲ ประสิทธิภาพของโพชั่นพลังเพิ่มขึ้น ❳"
        elseif selectedType == "📤 ❲ ช่วยขึ้นจากหลุม 2 ครั้ง ❳" then
            ID = "2014"
            Name = "📤 ❲ ช่วยขึ้นจากหลุม 2 ครั้ง ❳"
        else
            gg.alert("คุณยังไม่ได้เลือกอะไรเลย ❗")
            return
        end
        
        gg.clearResults()
        gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_CODE_APP)
        gg.searchNumber("101201", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        AG_Original = gg.getResults(1000, nil, nil, nil, nil, nil, nil, nil, nil)
        
        if #AG_Original == 0 then
            gg.clearResults()
            gg.alert("ไม่เจอ ค่า บูสเตอร์ ❗")
            return
        end
        Original_Buy_Values = gg.getValues(AG_Original)
        
        gg.editAll(ID, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.clearResults()
        gg.toast(Name)
        isBuySagged = true
    else
        gg.clearResults()
        gg.setValues(Original_Buy_Values)
        gg.setValues(AG_Original)
        gg.clearResults()
        gg.toast("🚨 ปิดฟังชั่น ซื้อ Booter แล้ว ❌")
        isBuySagged = false
    end
end

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

function Off_All()
    local any_function_active = false

-------------------- Normal Land Pum --------------------

    if NM1_Check then
        gg.clearResults()
        gg.setValues(HP_Original_Value)
        gg.toast("🚨 คืนค่า HP แล้ว 💉")
        gg.sleep(50)
        for address, value in pairs(NM1_Original) do
            gg.setValues({{address = address, value = value, flags = gg.TYPE_DWORD}})
        end
        gg.toast("🌳 ปิด ปั้มของ แล้ว 🏆")
        NM1_Check = false
    end
    gg.sleep(50)
    
    if NM2_Check then
        gg.clearResults()
        gg.setValues(NM2_Original_Value)
        gg.removeListItems(NM2_Original)
        gg.toast("🌿 ปิด สัตว์เลี้ยง แล้ว 🌲")
        NM2_Check = false
    end
    gg.sleep(50)
    
    if NM3_Check then
        gg.clearResults()
        gg.setValues(NM3_Original_Value)
        gg.removeListItems(NM3_Original)
        gg.toast("🎋 ปิด สัตว์เลี้ยง แล้ว ☃️")
        NM3_Check = false
    end
    gg.sleep(50)

-------------------- Other --------------------
    if isSpeed == true then
        local currentSpeed = gg.getSpeed()
        if currentSpeed ~= "1" then
            gg.setSpeed("1")
            gg.toast("🚨 ปิด เร่งความเร็วเกม แล้ว")
        end
        isSpeed = false
    end
    gg.sleep(50)
    
    if isBuySagged == true then
        gg.clearResults()
        gg.setValues(Original_Buy_Values)
        gg.setValues(AG_Original)
        gg.clearResults()
        gg.toast("🚨 ปิดฟังชั่น ซื้อ Booter แล้ว ❌")
        isBuySagged = false
    end
    
    if not any_function_active then
        gg.toast("😁 ปิด ทุกฟังก์ชั่น แล้ว🔥")
    end
end

-------------------------------------------------------------------------------------------------------------------
local Admin = "============================\n" ..
               "สร้างโดย : XTers\n" ..
               "Game : Cookie Run Kakao\n" ..
               "Update : 24/03/2567\n" ..
               "============================"
function Update_script()
    local Telegram = "https://t.me/XTers_Gs"
    local Discord = "https://discord.com/invite/uEtuuDcYdg"
    local message = "🔰 ติดต่อเช่าสคริปต์ได้ที่ ✅\n\n" ..
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

-------------------------------------------------------------------------------------------------------------------

function ex()
    Update_script()
    Off_All()
    gg.setVisible(true)
    os.exit()
end

while true do
    if gg.isVisible(true) then
       MENUXMR = 1
       gg.setVisible(false)
    end
    if MENUXMR == 1 then
        Game_CK()
    end
    MENUXMR = -1
end