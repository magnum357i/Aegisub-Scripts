	script_name="Sub Menu Maker"
	script_description="Lua veya moon dosyalarını gruplamaya yarar."
	script_author="Magnum357"
	script_author_url="biskuvininkirintilari.blogspot.com.tr"
	script_version="1.2"
	script_url="https://yadi.sk/d/GU3M25gHrior9"

	function add_macro()
	local k = false
	local v1, v2, v3, v4
	v1 = ""
	v2 = "Lua"
	v3 = ""
	v4 = "?default"
	local default_path = "C:\\Program Files (x86)\\Aegisub\\automation\\autoload\\"
	local path
	repeat
	local dialog_config=
	{
	{class="label",x=0,y=0,width=1,height=1,label="Dosya adı:"},
	{class="edit",name="file_name",x=1,y=0,width=15,height=1,hint="Automation menüsünde görünen ismini değil automation dizinine attığınız dosyanın ismini girmeniz gerekmekte. Dosya isimleri arasına virgül koyarak çoklu işlem yapabilirsiniz.",value=v1},
	{class="label",x=0,y=1,width=1,height=1,label="Dosya türü:"},
	{class="dropdown",name="file_type",x=1,y=1,width=15,height=1,items={"Lua","Moon"},value=v2},
	{class="label",x=0,y=2,width=1,height=1,label="Grup adı:"},
	{class="edit",name="sub_menu",x=1,y=2,width=15,height=1,hint="Grubu kaldırmak için bu alana bir değer girmeyin.",value=v3},
	{class="label",x=0,y=3,width=1,height=1,label="Dosya dizini:"},
	{class="edit",name="file_path",x=1,y=3,width=15,height=1,hint="?default = "..default_path,value=v4}
	}
	ok, config = aegisub.dialog.display(dialog_config,{"Uygula","Kapat"})
	v1 = config.file_name
	v2 = config.file_type
	v3 = config.sub_menu
	v4 = config.file_path
	if config.file_name ~= "" and config.file_path ~= "" then k = true end
	until ok == "Kapat" or k == true
	if ok == "Uygula" then
	if config.file_type == "Lua" then config.file_type = ".lua" else config.file_type = ".moon" end
	if config.file_path == "?default" then path = default_path
	else path = config.file_path end
	local rev_t = string.reverse(path)
	if rev_t:match("\\") ~= 1 then path = path .. "\\" end
	local del = false
	if config.sub_menu == "" then del = true end
	if k == true then
	v1 = v1 .. ","
	for v in v1:gmatch("[^,]+,") do
	if v:find("%s") == 1 then v = v:sub(v:find("%s"),-1) end
	replace_script_name(path,v:gsub(",","")..config.file_type,config.sub_menu,del) 
	end
	end
	end
	aegisub.set_undo_point(script_name)
	end

	function esc(str) return str:gsub("[%%%(%)%[%]%.%-%+%*%?%^%$]","%%%1") end

	function replace_script_name(path,lua_name,sub_name,delete)
	local last_gp = false
	lua_name = lua_name:gsub("%[",""):gsub("%]","")
	local gp = ""
	local k = false
	local ptn = "[export]-%s-script_name%s-=%s-[tr]-%s-[\"\']+.+[\"\']+"
	local ptn2 = "([\"\'])([^/]+/)"
	local file = io.open(path..lua_name)
	if file == nil then
	al(path:gsub("\\\\","\\").." dizininde "..lua_name.." dosyası bulunamadı!")
	else
	local sn = ""
   	local sn_0 = ""
   	local lines = ""
	for line in io.lines(path..lua_name) do
	if line:match(ptn) then
	sn = esc(line:match(ptn))
	sn_0 = sn
	k = true
	end
	lines = lines..line.."\n"
	end
	if k == true then
	if delete == false then sub_name = sub_name.."/" end
	sn = sn:gsub("([\"\'])","%1"..sub_name,1)
	_, sc = sn:gsub("/[a-zA-Z0-9]+","")
	if delete == true then if sc > 0 and sn:match("/") then sn = sn:gsub(ptn2,"%1",1) else al("Silinecek bir alt dizin bulunamadı.") end end
	lines, c = lines:gsub(sn_0,sn)
	if c > 0 then
	local file = io.open(path..lua_name, "w")
	file:write(lines)
    file:close()
	prog("İşleminiz yapılıyor...")
	else
	al(lua_name.." dosyası gruplanamadı.")
	end
	else
	al(lua_name.." dosyası gruplanamadı.")
	end
	end
	end

	function al(str) aegisub.log(str) end

	function delay()
	local st = ""
	for i = 0, 50000 do
	st = st .. i
	end
	return st
	end

	function prog(str)
	aegisub.progress.task(string.format("%s",str))
	aegisub.progress.set(100)
	delay()
	end

	aegisub.register_macro(script_name,script_description,add_macro)
