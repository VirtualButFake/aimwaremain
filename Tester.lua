local version =
--[[

Version Checker

Virtual#0021

]] "Version 0.01"

local currentLua = "Tester.lua"
 
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

local msc_ref = gui.Reference( "MISC", "Part 1" );



for i,v in pairs(ReadFile("virtsversions.txt")) do

	local LuaInfo = v:split(";");
    local LuaName,LuaVersion = LuaInfo[1], LuaInfo[2]
    if LuaName == currentLua then
		
		if luaVersion ~= version then
			
			local wnd_luatest = gui.Window( "wnd_luatest", "This lua, " .. GetScriptName() .. ", is out of date.", 200, 200, 200, 400 );
			local lua_checkbox = gui.Button( wnd_luatest, "Update " .. GetScriptName() .. " to the latest version", function() 
				local DataUpdate = file.Open(GetScriptName(), "w")
				DataUpdate:Write(http.Get("https://raw.githubusercontent.com/VirtualButFake/aimwaremain/main/" .. currentLua))
				UnloadScript(GetScriptName())
				LoadScript(GetScriptName())
				DataUpdate:Close()
			end);

			

		end
   end
end
