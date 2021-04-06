local version =
--[[

Version Checker

Virtual#0021

]] "Version 0.01"
 
local currentLua = "Clantag.lua"
 
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



local VirtMenu = gui.Tab(gui.Reference("Settings"), "Clantag Changer", "Clantag Changer")





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




local function getOriginalName()

    origName = client.GetConVar("Name")
  
  end
  getOriginalName()
  
  local function setName(name)
    client.SetConVar("name", name);
  end
  
  local boldletters = {
  
  
    
    "𝗮","𝗯","𝗰","𝗱","𝗲","𝗳","𝗴","𝗵","𝗶","𝗷","𝗸","𝗹","𝗺","𝗻","𝗼","𝗽","𝗾","𝗿","𝘀","𝘁","𝘂","𝘃","𝘄","𝘅","𝘆","𝘇",
    "𝗔","𝗕","𝗖","𝗗","𝗘","𝗙","𝗚","𝗛","𝗜","𝗝","𝗞","𝗟","𝗠","𝗡","𝗢","𝗣","𝗤","𝗥","𝗦","𝗧","𝗨","𝗩","𝗪","𝗫","𝗬","𝗭",
    "𝟬","𝟭","𝟮","𝟯","𝟰","𝟱","𝟲","𝟳","𝟴","𝟵","'"," "
  }
  
  local boldletters2 = {
  
  
    
    "ａ","ｂ","ｃ","ｄ","ｅ","ｆ","ｇ","ｈ","ｉ","ｊ","ｋ","ｌ","ｍ","ｎ","ｏ","ｐ","ｑ","ｒ","ｓ","ｔ","ｕ","ｖ","ｗ","ｘ","ｙ","ｚ",
    "Ａ","Ｂ","Ｃ","Ｄ","Ｅ","Ｆ","Ｇ","Ｈ","Ｉ","Ｊ","Ｋ","Ｌ","Ｍ","Ｎ","Ｏ","Ｐ","Ｑ","Ｒ","Ｓ","Ｔ","Ｕ","Ｖ","Ｗ","Ｘ","Ｙ","Ｚ",
    "０","１","２","３","４","５","６","７","８","９","'"," "
  }
  
  local boldletters3 = {
  
  
    
    "𝕒","𝕓","𝕔","𝕕","𝕖","𝕗","𝕘","𝕙","𝕚","𝕛","𝕜","𝕝","𝕞","𝕟","𝕠","𝕡","𝕢","𝕣","𝕤","𝕥","𝕦","𝕧","𝕨","𝕩","𝕪","𝕫",
    "𝔸","𝔹","ℂ","𝔻","𝔼","𝔽","𝔾","ℍ","𝕀","𝕁","𝕂","𝕃","𝕄","ℕ","𝕆","ℙ","ℚ","ℝ","𝕊","𝕋","𝕌","𝕍","𝕎","𝕏","𝕐","ℤ",
    "𝟘","𝟙","𝟚","𝟛","𝟜","𝟝","𝟞","𝟟","𝟠","𝟡","'"," "
  }
  
  local boldletters4 = {
  
  
    
    "🅰","🅱","🅲","🅳","🅴","🅵","🅶","🅷","🅸","🅹","🅺","🅻","🅼","🅽","🅾","🅿","🆀","🆁","🆂","🆃","🆄","🆅","🆆","🆇","🆈","🆉",
    "🅰","🅱","🅲","🅳","🅴","🅵","🅶","🅷","🅸","🅹","🅺","🅻","🅼","🅽","🅾","🅿","🆀","🆁","🆂","🆃","🆄","🆅","🆆","🆇","🆈","🆉",
    "⓿","❶","❷","❸","❹","❺","❻","❼","❽","❾","'"," "
  }
  
  local boldletters5 = {
  
  
    
    "𝖆","𝖇","𝖈","𝖉","𝖊","𝖋","𝖌","𝖍","𝖎","𝖏","𝖐","𝖑","𝖒","𝖓","𝖔","𝖕","𝖖","𝖗","𝖘","𝖙","𝖚","𝖛","𝖜","𝖝","𝖞","𝖟",
    "𝕬","𝕭","𝕮","𝕯","𝕰","𝕱","𝕲","𝕳","𝕴","𝕵","𝕶","𝕷","𝕸","𝕹","𝕺","𝕻","𝕼","𝕽","𝕾","𝕿","𝖀","𝖁","𝖂","𝖃","𝖄","𝖅",
    "0","1","2","3","4","5","6","7","8","9","'"," "
  }


  -->> Gui funny stuff




local c =  gui.Editbox(VirtMenu, "Clantag","")
local lua_slider = gui.Slider(VirtMenu,"lua_slider","Animation Speed",50,0,100)
local master = gui.Checkbox(VirtMenu,"MasterSwitch","Master Switch",false)


  



local debugFont = draw.CreateFont( "Tahoma", 60 );

