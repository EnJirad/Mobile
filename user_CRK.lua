-- ข้อมูล Users_CRK
local Users_CRK = {
    {
        No = "1",
        ID = "JCJIRU",
        Key = "3cHnw0lB2iZRTHF2UBHtpCLYPlL5SGgC"
    },
    {
        No = "2",
        ID = "0MJA2Z",
        Key = "DjzqWK95sZQplo4m4GvFkkcXVOk3biEW"
    }
}

-- ระบุที่อยู่ของไฟล์ Save.lua
local file_path = "/storage/emulated/0/Code/Lua/Save.lua"

-- เปิดไฟล์เพื่อเขียนข้อมูล
local file = io.open(file_path, "w")

-- เช็คว่าไฟล์เปิดได้หรือไม่
if file then
    -- เขียนข้อมูล Users_CRK ลงในไฟล์
    file:write("local Users_CRK = {\n")
    for _, user in ipairs(Users_CRK) do
        file:write(string.format("\t{ No = \"%s\", ID = \"%s\", Key = \"%s\" },\n", user.No, user.ID, user.Key))
    end
    file:write("}\n\nreturn Users_CRK\n")
    
    -- ปิดไฟล์
    file:close()
    gg.alert("บันทึกข้อมูลเรียบร้อยแล้ว")
else
    -- ถ้าไม่สามารถเปิดไฟล์ได้
    print("ไม่สามารถเปิดไฟล์เพื่อเขียนข้อมูลได้")
end
