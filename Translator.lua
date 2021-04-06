  
local version =
--[[
Version Checker
Virtual#0021
]] "Version 2"

local currentLua = "Translator.lua"
 
-- Credit to nadehelper v5 
function string:split( inSplitPattern, outResults )
	if not outResults then
	   outResults = { }
	end
	local theStart = 1
	local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
	while theSplitStart do
	   table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
	   theStart = theSplitEnd + 1
	   theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
	end
	table.insert( outResults, string.sub( self, theStart ) )
	return outResults
 end

local DataUpdate = file.Open("virtsversions.txt", "w")
    DataUpdate:Write(http.Get("https://raw.githubusercontent.com/VirtualButFake/aimwaremain/main/Versions"))


local function ReadFile(str_Path)
	local hFile = file.Open(str_Path, "r");
	local rawData = hFile:Read();
	local parsedData = {};
	local i = 1;
	
	for str in string.gmatch(rawData, "([^\n]+)") do
        parsedData[i] = str
        i = i + 1
    end

	return parsedData;
end

--local CheckUpdate = file.Open("VirtualsVersions.txt","w")
--CheckUpdate:Write()

-->> check versions
local VirtMenu = gui.Tab(gui.Reference("Settings"), "Russian Translator","Russian Translator")







for i,v in pairs(ReadFile("virtsversions.txt")) do

	local LuaInfo = v:split(";");
    local LuaName,LuaVersion = LuaInfo[1], LuaInfo[2]
	print(LuaVersion)
    if LuaName == currentLua then
		
		

		if string.sub(version,9,#version) ~= string.sub(LuaVersion,9,#LuaVersion) then
			
			local wnd_luatest = gui.Window( "wnd_luatest", GetScriptName() .. " is out of date.", 200, 200, 200, 400 );
			local lua_checkbox = gui.Button( wnd_luatest, "Update", function() 
				local DataUpdate = file.Open(GetScriptName(), "w")
				DataUpdate:Write(http.Get("https://raw.githubusercontent.com/VirtualButFake/aimwaremain/main/" .. currentLua))
				UnloadScript(GetScriptName())
				LoadScript(GetScriptName())
				DataUpdate:Close()
			end);

			

		end
   end
end



local lua_groupbox = gui.Groupbox(VirtMenu , "Translate Messages (tick true to translate)", 16, 200, 168, 100 );


local players = entities.FindByClass( "CCSPlayer" );

local checkboxes = {}

for i = 1, #players do
	local player = players[ i ];



    local name = client.GetPlayerNameByIndex(i)
	checkboxes[name] = gui.Checkbox(lua_groupbox, "lua_groupcheckbox", name, false)
end

















local messages = {}



callbacks.Register("DispatchUserMessage", "Main",function(msg)
 

	if msg:GetID() == 6 then

        local index = msg:GetInt( 1 );

        -- CCSUsrMsg_SayText2.params
        local message = msg:GetString(4, 1);

        local name = client.GetPlayerNameByIndex(index);

        if checkboxes[name]:GetValue() then
            print("Message sent. Translating now")
            local resp, success = http.Get("https://api.mymemory.translated.net/get?q=" .. message .. "&langpair=ru|en&de=xowec40892@shzsedu.com")
            --print(resp)
            
            local text = string.sub(resp,36,#resp)
            local start = string.find(text,"match")
            print(name .. ": " .. string.sub(text,1,start - 4))
            
        end
       
	end


end)
