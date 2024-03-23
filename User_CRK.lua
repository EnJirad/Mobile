local Users_CRK = {
    {
        No = "1",
        ID = "JCJIRU",
        Key = "3cHnw0lB2iZRTHF2UBHtpCLYPlL5SGgC",
        Status = "true",
        Time = "30"
    },
    {
        No = "2",
        ID = "0MJA2Z",
        Key = "DjzqWK95sZQplo4m4GvFkkcXVOk3biEW",
        Status = "false",
        Time = "7"
    },
    {
        No = "3",
        ID = "RQCK2O",
        Key = "Rox8sjFZ3SLWA6nvlTP6OeOmEOOTqj7e",
        Status = "false",
        Time = "30"
    },
    {
        No = "4",
        ID = "LBIZVZ",
        Key = "T6K9aQQiRZh0VVEmgxM3ylYx1s6Kk7nk",
        Status = "false",
        Time = "30"
    },
    {
        No = "5",
        ID = "HC58HI",
        Key = "rYQ3mshmqrWehVsz8Uze7eMuIo5lKmjN",
        Status = "false",
        Time = "30"
    },
    {
        No = "6",
        ID = "6DOFOQ",
        Key = "OdCNh3YiMeTgLoeSLY3v8bKVyNlwpxv3",
        Status = "false",
        Time = "30"
    },
    {
        No = "7",
        ID = "7IPWF8",
        Key = "zMH2QuM6WP8EllOW4lnLat1u7CG2v0iO",
        Status = "false",
        Time = "30"
    },
    {
        No = "8",
        ID = "K6AE34",
        Key = "2zNC7r7ntQAiWNdl1gODDQM5eKukrKAc",
        Status = "false",
        Time = "30"
    },
    {
        No = "9",
        ID = "Q9ISGF",
        Key = "arF0KnstTMlnWlnNIDilp6a8U8Wddn7l",
        Status = "false",
        Time = "30"
    },
    {
        No = "10",
        ID = "RPD2E9",
        Key = "KSAnYR5H3F9PVnIxX1dMP3Dh8sfelUL5",
        Status = "false",
        Time = "30"
    },
    {
        No = "11",
        ID = "0AZ82Z",
        Key = "a9TNYYZ4W2bCQKZ8AQZBpEfOyGyEAlKh",
        Status = "false",
        Time = "30"
    },
    {
        No = "12",
        ID = "40QDRH",
        Key = "9nvli3KSgEZTbfy3lyB4Q0rYUYvX8VmS",
        Status = "false",
        Time = "30"
    },
    {
        No = "13",
        ID = "07OTTV",
        Key = "KwN9FpHTskS5TGc1YKXqSrB736vm7irD",
        Status = "false",
        Time = "30"
    },
    {
        No = "14",
        ID = "KHGLTB",
        Key = "E0govWIRlRhzQCS0GKJc7dTlzNd31Vbx",
        Status = "false",
        Time = "30"
    },
    {
        No = "15",
        ID = "NV7KYI",
        Key = "3ypwua7jvbHDicTX11zl1hzfWHlIOfE8",
        Status = "false",
        Time = "30"
    },
    {
        No = "16",
        ID = "1MN0RX",
        Key = "cY4jK1HtMxPFqlXkNeC6IKR15etV5HPo",
        Status = "false",
        Time = "30"
    },
    {
        No = "17",
        ID = "R5A35B",
        Key = "ZVfzlLKoTucXhYEdHbGkBuOiqjtYMVbL",
        Status = "false",
        Time = "30"
    },
    {
        No = "18",
        ID = "C4CRD5",
        Key = "mCOm2lCXyfbrJ2i4bjS8jghm29OjfSlx",
        Status = "false",
        Time = "30"
    },
    {
        No = "19",
        ID = "1TGD2J",
        Key = "pktYrEujHIsybhyGlwgo5p1YPy2XU62Q",
        Status = "false",
        Time = "30"
    },
    {
        No = "20",
        ID = "IA864X",
        Key = "FS7TnHdVWno12TOZII1suJOIL8YPNzto",
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
