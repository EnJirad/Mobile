local Users_CRK = {
    {
        No = "1",
        ID = "XTers",
        Key = "XTers2001",
        Status = "true",
        Time = "10000"
    },
    {
        No = "2",
        ID = "4C5AA",
        Key = "XlUP5RgxNScCxAvr",
        Status = "false",
        Time = "7"
    },
    {
        No = "3",
        ID = "67FE5",
        Key = "Z7cj5LjTHWRIFBV8",
        Status = "false",
        Time = "30"
    },
    {
        No = "4",
        ID = "CEB78",
        Key = "ovUSNU2D8Ld08L44",
        Status = "false",
        Time = "30"
    },
    {
        No = "5",
        ID = "D9D2A",
        Key = "L7kEPA8jURxamjDW",
        Status = "false",
        Time = "30"
    },
    {
        No = "6",
        ID = "1692E",
        Key = "eC8H2OdYSIHxAa2F",
        Status = "false",
        Time = "30"
    },
    {
        No = "7",
        ID = "A5366",
        Key = "zfCq4JWTADvaec0W",
        Status = "false",
        Time = "30"
    },
    {
        No = "8",
        ID = "9CAD6",
        Key = "n0kR30dvCYjX6vOq",
        Status = "false",
        Time = "30"
    },
    {
        No = "9",
        ID = "1D31D",
        Key = "lZvfMqcJjCfGoMrK",
        Status = "false",
        Time = "30"
    },
    {
        No = "10",
        ID = "DE9D9",
        Key = "Xog4FFLQYAS7lelK",
        Status = "false",
        Time = "30"
    },
    {
        No = "11",
        ID = "C975A",
        Key = "cscIyt0LvzkjNdnz",
        Status = "false",
        Time = "30"
    },
    {
        No = "12",
        ID = "A2DEB",
        Key = "oUfovNOTkfj6ZEX4",
        Status = "false",
        Time = "30"
    },
    {
        No = "13",
        ID = "3E377",
        Key = "5Gj7jHIWsCbMAV8I",
        Status = "false",
        Time = "30"
    },
    {
        No = "14",
        ID = "94CF4",
        Key = "6Hrys9kWDyUB3BFF",
        Status = "false",
        Time = "30"
    },
    {
        No = "15",
        ID = "AAD3D",
        Key = "5KfC5fAIpSb8BHoq",
        Status = "false",
        Time = "30"
    },
    {
        No = "16",
        ID = "6CD91",
        Key = "QGhQe0ersG4DFNR4",
        Status = "false",
        Time = "30"
    },
    {
        No = "17",
        ID = "AF42C",
        Key = "iWw9troXmIfeXAQw",
        Status = "false",
        Time = "30"
    },
    {
        No = "18",
        ID = "BEE1F",
        Key = "0JBvwdrA5e1fjCsC",
        Status = "false",
        Time = "30"
    },
    {
        No = "19",
        ID = "48DC9",
        Key = "PcfChfZt5NFyqVWy",
        Status = "false",
        Time = "30"
    },
    {
        No = "20",
        ID = "6A38B",
        Key = "Q8aByBqiVhbZvjPw",
        Status = "false",
        Time = "30"
    }
}

local GG = gg.PACKAGE
local file_path = "/storage/emulated/0/Android/data/" .. GG .. "/cache/"
local Regis_File = file_path .. "register_user.lua"
local file = io.open(Regis_File, "w")
if file then
    file:write("local Users_CRK = {\n")
    for _, user in ipairs(Users_CRK) do
        file:write(string.format("\t{ No = \"%s\", ID = \"%s\", Key = \"%s\", Status = \"%s\", Time = \"%s\" },\n", user.No, user.ID, user.Key, user.Status, user.Time))
    end
    file:write("}\n\nreturn Users_CRK\n")
    file:close()
else
    os.remove(Regis_File)
end
