	--[[
	Desteklenen fonksiyonlar ve formatlar:
	* aegisub.register_macro fonksiyonunun hem lua hem moon formatı.
	* aegisub.register_filter fonksiyonunun hem lua hem moon formatı.
	* mag.register fonksiyonunun sadece lua formatı.
	
	-------------------------------------------------------------------------------------
	Normal yollarla veya kendi yolumla Automation menüsüne eklenen tüm lua dosyalarını 
	gruplayabilir. Sadece eklediği grubu silebilir.
	-------------------------------------------------------------------------------------
	]]

	script_name        = "Sub Menu Maker R1"
	script_description = "Lua veya moon dosyalarını gruplamaya yarar."
	script_author      = "Magnum357"
	script_version     = "1.0"

	mag_import, mag = pcall(require,"mag")

	function reset()
	file_name    = ""
	sub_menu     = ""
	file_path    = "Automation"
	file_type    = true
	delete_group = false
	end

	automation_path         = aegisub.decode_path("?data\\automation\\autoload\\")
	appdata_automation_path = aegisub.decode_path("?user\\automation\\autoload\\")

	function rgui(mode,x,y,label,name,width)
	if mode == 1 then return {class = "label", x = x, y = y, width = width, height = 1, label = label} end
	if mode == 2 then return {class = "edit",  x = x, y = y, width = width, height = 1, name  = name, value = label, hint = "Grubu kaldırmak için bu alana bir değer girmeyin. İç içe gruplamayı grupart1/grupart2 şeklinde yapabilirsiniz. Daha önce grupladığınız bir luanın grubu hala duruyorsa bu kısımda gözükebilir."} end
	end

	function add_macro()
	reset()
	local ok, config
	local dialog_filename
	local dfile
	local path
	local trim1, trim2
	repeat
	repeat
	dialog_filename = {}
	if ok == mag.ascii("Sıfırla") then reset() end
	local gui =
	{{class = "label",                                                                                                x = 0, y = 0, width = 1, height = 1, label = mag.wall(" ",4).."Dosya adı:"}
	,{class = "textbox",  name = "u_file_name",    value = file_name,                                                 x = 1, y = 0, width = 8, height = 3,                                         hint = "Automation menüsünde görünen ismini değil automation dizinine attığınız dosyanın ismini girmeniz gerekmekte. Dosya isimleri arasına virgül koyarak çoklu işlem yapabilirsiniz."}
	,{class = "label",                                                                                                x = 0, y = 3, width = 1, height = 1, label = mag.wall(" ",6).."Grup adı:"}
	,{class = "edit",     name = "u_sub_menu",     value = sub_menu,                                                  x = 1, y = 3, width = 8, height = 1,                                         hint = "Bu kutucuktan bir sonraki pencerede listelenecek olan lua dosyalarına toplu şekilde grup girebilirsiniz."}
	,{class = "label",                                                                                                x = 0, y = 4, width = 1, height = 1, label = "Dosya dizini:"}
	,{class = "dropdown", name = "u_file_path",    value = file_path,    items = {"Automation","AppData Automation"}, x = 1, y = 4, width = 8, height = 1,                                         hint = "Automation\n"..automation_path.."\n".."AppData Automation\n"..appdata_automation_path}
	,{class = "checkbox", name = "u_file_type",    value = file_type,                                                 x = 1, y = 5, width = 1, height = 1, label = "Lua yoksa moon uzantısı ara.", hint = "Bu seçeneğin işaretlenmemesi halinde tam tersi şeklinde işlem yapar."}
	,{class = "checkbox", name = "u_delete_group", value = delete_group,                                              x = 1, y = 6, width = 1, height = 1, label = "Önceki grupları ekleme."}
	}
	ok, config = mag.dlg(gui,{"Gruplamaya geç","Dosya seç","Sıfırla","Kapat"})
	if config.u_file_name == "" and ok == mag.ascii("Gruplamaya geç") then mag.log(2,"Hiçbir dosya ismi belirtmediniz.") end
	if config.u_file_path == "Automation" then path = automation_path else path = appdata_automation_path end
	dfile = ""
	if ok == mag.ascii("Dosya seç") then
	dialog_filename = aegisub.dialog.open("Bir lua dosyası seçin.",path,"","Lua dosyası (*.lua;*.moon)|*.lua;*.moon",true,true)
		if dialog_filename then
			for g = 1, table.getn(dialog_filename) do
			trim1 = mag.rfind(dialog_filename[g],"\\")
			trim2 = mag.rfind(dialog_filename[g],"%.lua")
			if not trim2 then trim2 = mag.rfind(dialog_filename[g],"%.moon") end
			if not trim1 or not trim2 then trim1 = 0 trim2 = 1 end
			dfile = dfile..", "..mag.usub(dialog_filename[g],trim1 + 1,trim2 - 1)
			end
		end
	end
	if config.u_file_name == "" then dfile = mag.gsub(dfile,", ","",1) end
	file_name    = config.u_file_name..dfile
	sub_menu     = config.u_sub_menu
	file_path    = config.u_file_path
	file_type    = config.u_file_type
	delete_group = config.u_delete_group
	until ok == mag.ascii("Gruplamaya geç") and config.u_file_name ~= "" or ok == "Kapat" or aegisub.cancel()
	if ok == mag.ascii("Gruplamaya geç") then
	local f_names  = {}
	local d        = 0
	local ext      = {}
	local file_ext = {}
	local f
	_, f_names = mag.vars(file_name)
	mag.full_double(f_names)
	if config.u_file_type == true then
	table.insert(ext,".lua")
	table.insert(ext,".moon")
	else
	table.insert(ext,".moon")
	table.insert(ext,".lua")
	end
	for z = 1, table.getn(f_names) do
		for x = 1, 2 do
		f_names[z] = mag.space_trim(f_names[z])
		f = io.open(path..f_names[z]..ext[x])
		if f and d == 0 then d = d + 1 end
			if d == 1 then
			table.insert(file_ext,path..f_names[z]..ext[x])
			f:close()
			break
			end
		end
	if d == 0 then mag.log(1,"%s dizininde \"%s\" isimli dosyanın önce %s sonra da %s uzantısı arandı ama bir sonuç elde edilemedi.",{path,f_names[z],ext[1],ext[2]}) end
	d = 0
	end
	if table.getn(file_ext) > 0 then
	local gui2    = {}
	local st_name = ""
	local gp_name = ""
	local slash   = ""
	gui2[1]       = rgui(1,0,0,"[#]","",1)
	gui2[2]       = rgui(1,1,0,"[GRUP]","",1)
	gui2[3]       = rgui(1,11,0,"[AD]",1)
	gui2[4]       = rgui(1,12,0,"[DOSYA]",1)
	for i = 1, table.getn(file_ext) do
	slash = ""
		if delete_group then
		mag.progress("İşleminiz yapılıyor...",i,table.getn(file_ext),true,10000)
		else
 		gp_name = get_group(file_ext[i])
		mag.progress("Önceki grup isimleri aranıyor...",i,table.getn(file_ext),true,10000)
		end
 	st_name = get_script_name(file_ext[i])
 	if st_name == "" then st_name = "Bulunamadı." end
 	if config.u_sub_menu ~= "" and gp_name ~= "" and mag.find(mag.reverse(config.u_sub_menu),"/") ~= 1 then slash = "/" end
 	gp_name = lsh(gp_name)
 	st_name = mag.text_limit(st_name,40,true)
 	gui2[i * 4 + 1] = rgui(1,0,i,i,"",1)
	gui2[i * 4 + 2] = rgui(2,1,i,config.u_sub_menu..slash..gp_name,"u_sub_menu_"..i,10)
	gui2[i * 4 + 3] = rgui(1,11,i,"/"..st_name,"",1)
	gui2[i * 4 + 4] = rgui(1,12,i,"*"..mag.gsub(file_ext[i],".+\\","").."*","",1)
	end
	ok, config = mag.dlg(gui2,{"Grupla","Geri Dön","Kapat"})
	if ok == "Grupla" then
	local fc = table.getn(file_ext)
		for k = 1, fc do
		mag.progress("İşleminiz yapılıyor...",k,fc,true,10000)
		add_or_remove_group(file_ext[k],config["u_sub_menu_"..k],k,fc)
		end
	end
	else
	mag.log(2,"Belirtilen lua dosyası veya dosyaları ile işlem yapılamıyor.")
	end
	end
	until ok == "Kapat" or ok == "Grupla" or aegisub.cancel()
	end

	function r(str) return mag.gsub(str,"\".+\"%.%.\"\"%.%.","") end

	function lsh(str)
	if str then if mag.find(mag.reverse(str),"/") == 1 then str = mag.sub(str,1,-2) end end
	return mag.unnil(str)
	end

	function add_or_remove_group(file,sub_menu,i,last_i)
	if mag.find(mag.reverse(sub_menu),"/") ~= 1 and sub_menu ~= "" then sub_menu = sub_menu.."/" end
	local line_end = ""
	local count    = 0
	local count2   = 0
	local c        = 0
	local f        = io.input(file)
	local l        = ""
	local part1, part2, part3
	if f then
		for line in f:lines() do
		c = c + 1
			if mag.match(line,"aegisub%.register_macro%(.*,.*") then
			if mag.match(line,"\".+\"%.%.\"\"") then line = r(line) count2 = count2 + 1 end
			if sub_menu ~= "" then part1, part2, part3 = mag.match(line,"(.-aegisub%.register_macro%()(.*)(,.*)") end
				if part2 and sub_menu ~= "" then
					if mag.match(part2,"tr%s-\"") then
					count = count + 1
					part2 = mag.gsub(part2,"(tr%s-)(\")","%1\""..sub_menu.."\"..\"\"..%2",1)
					line  = mag.format("%s%s%s",part1,part2,part3)
					else
					count = count + 1
					line  = mag.format("%s\"%s\"..\"\"..%s%s",part1,sub_menu,part2,part3)
					end
				end
			elseif mag.match(line,"aegisub%.register_filter%(.*,.*") then
			if mag.match(line,"\".+\"%.%.\"\"") then line = r(line) count2 = count2 + 1 end
			if sub_menu ~= "" then part1, part2, part3 = mag.match(line,"(.-aegisub%.register_filter%()(.*)(,.*)") end
				if part2 and sub_menu ~= "" then
					if mag.match(part2,"tr%s-\"") then
					count = count + 1
					part2 = mag.gsub(part2,"(tr%s-)(\")","%1\""..sub_menu.."\"..\"\"..%2",1)
					line  = mag.format("%s%s%s",part1,part2,part3)
					else
					count = count + 1
					line  = mag.format("%s\"%s\"..\"\"..%s%s",part1,sub_menu,part2,part3)
					end
				end
			elseif mag.match(line,"aegisub.register_macro%s.*,.*") then
			if mag.match(line,"\".+\"%.%.\"\"") then line = r(line) count2 = count2 + 1 end
			if sub_menu ~= "" then part1, part2, part3 = mag.match(line,"(.-aegisub.register_macro%s)(.*)(,.*)") end
				if part2 and sub_menu ~= "" then
					if mag.match(part2,"tr%s-\"") then
					count = count + 1
					part2 = mag.gsub(part2,"(tr%s-)(\")","%1\""..sub_menu.."\"..\"\"..%2",1)
					line  = mag.format("%s%s%s",part1,part2,part3)
					else
					count = count + 1
					line  = mag.format("%s\"%s\"..\"\"..%s%s",part1,sub_menu,part2,part3)
					end
				end
			elseif mag.match(line,"aegisub.register_filter%s.*,.*") then
			if mag.match(line,"\".+\"%.%.\"\"") then line = r(line) count2 = count2 + 1 end
			if sub_menu ~= "" then part1, part2, part3 = mag.match(line,"(.-aegisub.register_filter%s)(.*)(,*)") end
				if part2 and sub_menu ~= "" then
					if mag.match(part2,"tr%s-\"") then
					count = count + 1
					part2 = mag.gsub(part2,"(tr%s-)(\")","%1\""..sub_menu.."\"..\"\"..%2",1)
					line  = mag.format("%s%s%s",part1,part2,part3)
					else
					count = count + 1
					line  = mag.format("%s\"%s\"..\"\"..%s%s",part1,sub_menu,part2,part3)
					end
				end
			elseif mag.match(line,"mag.register%(.*,.*%)") then
			if mag.match(line,"\".+\"%.%.\"\"") then line = r(line) count2 = count2 + 1 end
			if sub_menu ~= "" then part1, part2, part3 = mag.match(line,"(.-mag.register%()(.*)(,.*)") end
				if part2 and sub_menu ~= "" then
					if mag.match(part2,"false") then
					count = count + 1
					part2 = mag.format("\"%s\"..\"\"..script_name",sub_menu)
					line  = mag.format("%s%s%s",part1,part2,part3)
					else
					count = count + 1
					part2 = mag.format("\"%s\"..\"\"..%s",sub_menu,part2)
					line  = mag.format("%s%s%s",part1,part2,part3)
					end
				end
			end
		l = l..line_end..line
		line_end = "\n"
		end
		if c > 1 and count > 0 or c > 1 and count2 > 0 then
		f = io.open(file,"w")
		f:write(l)
			if sub_menu == "" then
			mag.log("(%s/%s) [BAŞARI] \"%s\" dosyası için %s adet grup kaldırma işlemi yapıldı.",{last_i,i,mag.gsub(file,".+\\",""),count2})
			else
			mag.log("(%s/%s) [BAŞARI] \"%s\" dosyası için %s adet gruplama yapıldı.",{last_i,i,mag.gsub(file,".+\\",""),count})
			end
		else
			if c == 1 then
			mag.log("(%s/%s) [HATA] \"%s\" dosyasında satırlar tek tek okunamadığı için yapılan işlem başarısızlık ile sonuçlandı.",{last_i,i,mag.gsub(file,".+\\","")})
			else
			mag.log("(%s/%s) [HATA] \"%s\" dosyasında yapılan işlem başarısızlık ile sonuçlandı.",{last_i,i,mag.gsub(file,".+\\","")})
			end
		end
	io.close(f)
	end
	end

	function get_script_name(file)
	local ptrn = "script_name%s-=[tr%s]-%(?[\"'](.-)%)?[\"']"
	local result
	local f = io.input(file)
	result = mag.match(f:read("*all"),ptrn)
	io.close(f)
	return mag.unnil(result)
	end

	function get_group(file)
	local macro_pattern1 = "aegisub%.register_macro%([tr%s]-\"(.-)\"%.%.\"\""
	local macro_pattern2 = "aegisub%.register_filter%([tr%s]-\"(.-)\"%.%.\"\""
	local macro_pattern3 = "aegisub%.register_macro%s[tr%s]-\"(.-)\"%.%.\"\""
	local macro_pattern4 = "aegisub%.register_filter%s[tr%s]-\"(.-)\"%.%.\"\""
	local macro_pattern5 = "mag%.register%(\"(.-)\"%.%.\"\"%.%."
	local result
	local f = io.input(file)
	result = mag.match(f:read("*all"),macro_pattern1)
	if not result then f = io.input(file) result = mag.match(f:read("*all"),macro_pattern2) end
	if not result then f = io.input(file) result = mag.match(f:read("*all"),macro_pattern3) end
	if not result then f = io.input(file) result = mag.match(f:read("*all"),macro_pattern4) end
	if not result then f = io.input(file) result = mag.match(f:read("*all"),macro_pattern5) end
	io.close(f)
	return mag.unnil(result)
	end

	if mag_import then
	mag.register(false,add_macro)
	else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end