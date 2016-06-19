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

	script_name="Sub Menu Maker"
	script_description="Lua veya moon dosyalarını gruplamaya yarar."
	script_author="Magnum357"
	script_version="1.6.3"

	mag_import, mag = pcall(require,"mag")

	function reset()
	file_name   = ""
	sub_menu    = ""
	file_path   = "Automation"
	file_type   = true
	save_config = false
	end

	automation_path         = aegisub.decode_path("?data\\automation\\autoload\\")
	appdata_automation_path = aegisub.decode_path("?user\\automation\\autoload\\")

	function rgui(mode,x,y,label,name)
	if mode == 1 then return {class = "label", x = x, y = y, width = 1, height = 1, label = label} end
	if mode == 2 then return {class = "edit",  x = x, y = y, width = 10, height = 1, name  = name, value = label, hint = "Grubu kaldırmak için bu alana bir değer girmeyin. İç içe gruplamayı grup1/grup2 şeklinde yapabilirsiniz. Daha önce grupladığınız bir luanın grubu hala duruyorsa bu kısımda gözükebilir."} end
	end

	function add_macro()
	local ok, config
	local dialog_filename = {}
	local dfile
	local path
	if save_config == false or save_config == nil then reset() end
	repeat
	repeat
	dialog_filename = ""
	local gui =
	{{class = "label",                                                                                               x = 0, y = 0, width = 1, height = 1, label = mag.wall(" ",4).."Dosya adı:"}
	,{class = "textbox",     name = "u_file_name", value = file_name,                                                x = 1, y = 0, width = 5, height = 3, hint  = "Automation menüsünde görünen ismini değil automation dizinine attığınız dosyanın ismini girmeniz gerekmekte. Dosya isimleri arasına virgül koyarak çoklu işlem yapabilirsiniz."}
	,{class = "label",                                                                                               x = 0, y = 3, width = 1, height = 1, label = mag.wall(" ",6).."Grup adı:"}
	,{class = "edit",     name = "u_sub_menu",     value = sub_menu,                                                 x = 1, y = 3, width = 5, height = 1, hint  = "Bu kutucuktan bir sonraki pencerede listelenecek olan lua dosyalarına toplu şekilde grup girebilirsiniz."}
	,{class = "label",                                                                                               x = 0, y = 4, width = 1, height = 1, label = "Dosya dizini:"}
	,{class = "dropdown", name = "u_file_path",    value = file_path,   items = {"Automation","AppData Automation"}, x = 1, y = 4, width = 5, height = 1, hint  = "Automation\n"..automation_path.."\n".."AppData Automation\n"..appdata_automation_path}
	,{class = "checkbox", name = "u_file_type",    value = file_type,                                                x = 1, y = 5, width = 1, height = 1, label = "Lua yoksa moon uzantısı ara.", hint = "Bu seçeneğin işaretlenmemesi halinde tam tersi şeklinde işlem yapar."}
	,{class = "checkbox", name = "u_save_config",  value = save_config,                                              x = 1, y = 6, width = 1, height = 1, label = "Arayüzdeki tercihleri hatırla."}
	}
	ok, config = mag.dlg(gui,{"Gruplamaya geç","Dosya seç","Kapat"})
	if config.u_file_name == "" and ok == mag.ascii("Gruplamaya geç") then mag.log(2,"Hiçbir dosya ismi belirtmediniz.") end
	if config.u_file_path == "Automation" then path = automation_path else path = appdata_automation_path end
	dfile = ""
	if ok == mag.ascii("Dosya seç") then
	dialog_filename = aegisub.dialog.open("Bir lua dosyası seçin.",path,"","Lua dosyası (*.lua;*.moon)|*.lua;*.moon",true,true)
		if dialog_filename ~= nil then
			for g = 1, table.getn(dialog_filename) do
			dialog_filename[g] = mag.sub(dialog_filename[g],mag.rfind(dialog_filename[g],"\\") + 1,-1)
			dialog_filename[g] = mag.sub(dialog_filename[g],1,mag.rfind(dialog_filename[g],"%.") - 1)
			dfile = dfile..dialog_filename[g]
			if g ~= table.getn(dialog_filename) then dfile = dfile..", " end
			end
		end
	end
	if dfile == "" then file_name = config.u_file_name else if config.u_file_name == "" then file_name = dfile else file_name = config.u_file_name..", "..dfile end end
	sub_menu  = config.u_sub_menu
	file_path = config.u_file_path
	file_type = config.u_file_type
	if ok == mag.ascii("Gruplamaya geç") then save_config = config.u_save_config end
	until ok == mag.ascii("Gruplamaya geç") and config.u_file_name ~= "" or ok == "Kapat"
	if ok == mag.ascii("Gruplamaya geç") then
	local f_names = {}
	local d = 0
	local ext = {}
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
		f = io.open(path..f_names[z]..ext[x])
		if f ~= nil and d == 0 then d = d + 1 end
			if d == 1 then
			table.insert(file_ext,path..f_names[z]..ext[x])
			f = nil
			break
			end
		end
	if d == 0 then mag.log(1,"%s dizininde \"%s\" isimli dosyanın önce %s sonra da %s uzantısı arandı ama bir sonuç elde edilemedi.",{path,f_names[z],ext[1],ext[2]}) end
	d = 0
	end
	if table.getn(file_ext) > 0 then
	local gui2 = {}
	local st_name
	gui2[1] = rgui(1,0,0,"[AD]","")
	gui2[2] = rgui(1,1,0,"[DOSYA]","")
	gui2[3] = rgui(1,2,0,"[GRUP]","")
	for i = 1, table.getn(file_ext) do
 	st_name = get_script_name(file_ext[i])
 	if st_name == nil then st_name = "Bulunamadı." end
	gui2[i * 3 + 1] = rgui(1,0,i,st_name,"")
	gui2[i * 3 + 2] = rgui(1,1,i,"*"..mag.gsub(file_ext[i],".+\\","").."*","")
	gui2[i * 3 + 3] = rgui(2,2,i,get_group(file_ext[i])..config.u_sub_menu,"u_sub_menu_"..i)
	end
	ok, config = mag.dlg(gui2,{"Grupla","Geri Dön","Kapat"})
	if ok == "Grupla" then
	local fc = table.getn(file_ext)
	for k = 1, fc do
	if config["u_sub_menu_"..k] ~= "" then add_group(file_ext[k],config["u_sub_menu_"..k],k,fc) else remove_group(file_ext[k],k,fc) end
	end
	end
	else
	mag.log(2,"Belirtilen lua dosyası veya dosyaları ile işlem yapılamıyor.")
	end
	end
	until ok == "Kapat" or ok == "Grupla"
	end

	function get_script_name(file)
	local f = io.open(file)
	local ptrn = "script_name%s-=[tr%s]-\"(.+)\""
	local result
	if f ~= nil then
	f = nil
	for line in io.lines(file) do
	if mag.match(line,ptrn) then result = mag.match(line,ptrn) break end
	end
	else
	mag.log(1,"\"%s\" dosyası açılamadı.",{mag.gsub(file,".+\\","")})
	end
	return result
	end

	function r(str) return mag.gsub(str,"\".+\"%.%.\"\"%.%.","") end

	function add_group(file,sub_menu,i,last_i)
	if mag.find(mag.reverse(sub_menu),"/") ~= 1 then sub_menu = sub_menu.."/" end
	local line_end = ""
	local count = 0
	local l = ""
	local f = io.open(file)
	local p1, p2, p3
	if f ~= nil then
	f = nil
		for line in io.lines(file) do
			if mag.match(line,".-aegisub.register_[macrofilter]+%(.+,.+") then
			line = r(line)
			p1, p2, p3 = mag.match(line,"(.-aegisub.register_[macrofilter]+%()(.+)(,.+)")
				if mag.match(p2,"tr%s-\"") then
				p2 = mag.gsub(p2,"(tr%s-)(\")","%1\""..sub_menu.."\"..\"\"..%2",1)
				line = mag.format("%s%s%s",p1,p2,p3)
				count = count + 1
				else
				line = mag.format("%s\"%s\"..\"\"..%s%s",p1,sub_menu,p2,p3)
				count = count + 1
				end
			else
			if mag.match(line,".-aegisub.register_[macrofilter]+%s.+,.+") then
			line = r(line)
			p1, p2, p3 = mag.match(line,"(.-aegisub.register_[macrofilter]+%s)(.-)(,.+)")
				if mag.match(p2,"tr%s-\"") then
				p2 = mag.gsub(p2,"(tr%s-)(\")","%1\""..sub_menu.."\"..\"\"..%2",1)
				line = mag.format("%s%s%s",p1,p2,p3)
				count = count + 1
				else
				line = mag.format("%s\"%s\"..\"\"..%s%s",p1,sub_menu,p2,p3)
				count = count + 1
				end
			else
			if mag.match(line,".-mag.register%(.+,.+%)") then
			line = r(line)
			p1, p2, p3 = mag.match(line,"(.-mag.register%()(.+)(,.+)")
				if mag.match(p2,"false") then
				p2 = mag.format("\"%s\"..\"\"..script_name",sub_menu)
				line = mag.format("%s%s%s",p1,p2,p3)
				count = count + 1
				else
				p2 = mag.format("\"%s\"..\"\"..%s",sub_menu,p2)
				line = mag.format("%s%s%s",p1,p2,p3)
				count = count + 1
				end
			end
			end
			end
		l = l..line_end..line
		line_end = "\n"
		end
		if count > 0 then
		f = io.open(file, "w")
		f:write(l)
		f = nil
		mag.log("(%s/%s) %s dosyası için %s adet gruplama yapıldı.",{last_i,i,mag.gsub(file,".+\\",""),count})
		else
		mag.log("(%s/%s) %s dosyasında gruplama işlemi başarısızlık ile sonuçlandı.",{last_i,i,mag.gsub(file,".+\\","")})
		end
	else
	mag.log(1,"\"%s\" dosyası açılamadı.",{mag.gsub(file,".+\\","")})
	end
	end

	function get_group(file)
	local result = ""
	local f = io.open(file)
	if f ~= nil then
	f = nil
		for line in io.lines(file) do
			if mag.match(line,".-aegisub.register_[macrofilter]+%(.+,.+") or mag.match(line,".-mag.register%(.+,.+%)") then
			if mag.match(line,"\".+\"%.%.\"\"%.%.") then result = mag.match(line,"\"(.+)\"%.%.\"\"%.%.") break end
			end
		end
	end
	return result
	end

	function remove_group(file,i,last_i)
	local result = ""
	local line_end = ""
	local count = 0
	local l = ""
	local f = io.open(file)
	if f ~= nil then
	f = nil
		for line in io.lines(file) do
			if mag.match(line,".-aegisub.register_[macrofilter]+%(.+,.+") or mag.match(line,".-mag.register%(.+,.+%)") then
				if mag.match(line,"\".+\"%.%.\"\"%.%.") then
				line = r(line)
				count = count + 1
				end
			end
		l = l..line_end..line
		line_end = "\n"
		end
		if count > 0 then
		f = io.open(file, "w")
		f:write(l)
		f = nil
		mag.log("(%s/%s) %s dosyası için %s adet grup kaldırma işlemi yapıldı.",{i,last_i,mag.gsub(file,".+\\",""),count})
		else
		mag.log("(%s/%s) %s dosyasında grup kaldırma işlemi başarısızlık ile sonuçlandı.",{i,last_i,mag.gsub(file,".+\\","")})
		end
	end
	return result
	end

	if mag_import then
	mag.register(script_name,add_macro)
	else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end
