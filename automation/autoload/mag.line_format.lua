	script_name        = "Line Format"
	script_description = "Seçili satırları eğiklik, hizalama ve şeffaflık geçişi etiketleri ekler."
	script_version     = "1.0.4"
	script_author      = "Magnum357"
	script_mag_version = "1.1.1.9"

	mag_import, mag = pcall(require,"mag")

	c_fad_t1   = 300
	c_fad_t2   = 300
	c_fade_a1  = 255
	c_fade_a2  = 0
	c_fade_a3  = 255
	c_fade_t1  = 0
	c_fade_t2  = 300
	c_fade_t3  = 300
	c_fade_t4  = 0
	c_fade_out = true

	function remove_tag(text,tag)
	text = mag.gsub(text,"{"..tag.."}","")
	text = mag.gsub(text,tag,"")
	return text
	end

	function italic(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = mag.format("%s%s%s","{\\i1}",line.text,"{\\i0}")
	subs[li]   = line
	end
	end

	function an1(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = remove_tag(line.text,"\\an[0-9]")
	line.text  = mag.format("%s%s","{\\an1}",line.text)
	subs[li]   = line
	end
	end

	function an2(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = remove_tag(line.text,"\\an[0-9]")
	line.text  = mag.format("%s%s","{\\an2}",line.text)
	subs[li]   = line
	end
	end

	function an3(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = remove_tag(line.text,"\\an[0-9]")
	line.text  = mag.format("%s%s","{\\an3}",line.text)
	subs[li]   = line
	end
	end

	function an4(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = remove_tag(line.text,"\\an[0-9]")
	line.text  = mag.format("%s%s","{\\an4}",line.text)
	subs[li]   = line
	end
	end

	function an5(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = remove_tag(line.text,"\\an[0-9]")
	line.text  = mag.format("%s%s","{\\an5}",line.text)
	subs[li]   = line
	end
	end

	function an6(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = remove_tag(line.text,"\\an[0-9]")
	line.text  = mag.format("%s%s","{\\an6}",line.text)
	subs[li]   = line
	end
	end

	function an7(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = remove_tag(line.text,"\\an[0-9]")
	line.text  = mag.format("%s%s","{\\an7}",line.text)
	subs[li]   = line
	end
	end

	function an8(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = remove_tag(line.text,"\\an[0-9]")
	line.text  = mag.format("%s%s","{\\an8}",line.text)
	subs[li]   = line
	end
	end

	function an9(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = remove_tag(line.text,"\\an[0-9]")
	line.text  = mag.format("%s%s","{\\an9}",line.text)
	subs[li]   = line
	end
	end

	function fad(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	line.text  = remove_tag(line.text,"\\fad%(%d+,%d+%)")
	line.text  = remove_tag(line.text,"\\fade%(%d+,%d+,%d+,%d+,%d+,%d+,%d+%)")
	line.text  = mag.format("{\\fad(%s,%s)}%s",c_fad_t1,c_fad_t2,line.text)
	subs[li]   = line
	end
	end

	function fade(subs,sel)
	for _, li in pairs(sel) do
	local line = subs[li]
	local dur  = line.end_time - line.start_time
	local t3   = c_fade_t3
	local t4   = c_fade_t4
	if c_fade_out then
	t3         = dur - c_fade_t3
	t4         = dur - c_fade_t4
	end
	line.text  = remove_tag(line.text,"\\fad%(%d+,%d+%)")
	line.text  = remove_tag(line.text,"\\fade%(%d+,%d+,%d+,%d+,%d+,%d+,%d+%)")
	line.text  = mag.format("{\\fade(%s,%s,%s,%s,%s,%s,%s)}%s",c_fade_a1,c_fade_a2,c_fade_a3,c_fade_t1,c_fade_t2,t3,t4,line.text)
	subs[li]   = line
	end
	end

	function fconfig()
	local gui =
	{
	 {class = "label",                                                                x = 0, y = 0,  width = 2, height = 1, label = "[FAD - Şeffaflık Geçişi]"}
	,{class = "label",                                                                x = 0, y = 1,  width = 1, height = 1, label = mag.wall(" ",4).."T1 (ms):"}
	,{class = "intedit", min = 0,            name = "u_fad_t1",   value = c_fad_t1,   x = 1, y = 1,  width = 1, height = 1}
	,{class = "label",                                                                x = 0, y = 2,  width = 1, height = 1, label = mag.wall(" ",4).."T2 (ms):"}
	,{class = "intedit", min = 0,            name = "u_fad_t2",   value = c_fad_t2,   x = 1, y = 2,  width = 1, height = 1}
	,{class = "label",                                                                x = 0, y = 3,  width = 2, height = 1, label = "[FADE - Şeffaflık Geçişi (Ayrıntılı)]"}
	,{class = "label",                                                                x = 0, y = 4,  width = 1, height = 1, label = "A1 (0-255):"}
	,{class = "intedit", min = 0, max = 255, name = "u_fade_a1",  value = c_fade_a1,  x = 1, y = 4,  width = 1, height = 1}
	,{class = "label",                                                                x = 0, y = 5,  width = 1, height = 1, label = mag.wall(" ",4).."T1 (ms):"}
	,{class = "intedit", min = 0,            name = "u_fade_t1",  value = c_fade_t1,  x = 1, y = 5,  width = 1, height = 1}
	,{class = "label",                                                                x = 0, y = 6,  width = 1, height = 1, label = mag.wall(" ",4).."T2 (ms):"}
	,{class = "intedit", min = 0,            name = "u_fade_t2",  value = c_fade_t2,  x = 1, y = 6,  width = 1, height = 1}
	,{class = "label",                                                                x = 0, y = 7,  width = 2, height = 1, label = mag.wall("-",50)}
	,{class = "label",                                                                x = 0, y = 8,  width = 1, height = 1, label = "A2 (0-255):"}
	,{class = "intedit", min = 0, max = 255, name = "u_fade_a2",  value = c_fade_a2,  x = 1, y = 8,  width = 1, height = 1}
	,{class = "label",                                                                x = 0, y = 9,  width = 2, height = 1, label = mag.wall("-",50)}
	,{class = "label",                                                                x = 0, y = 10, width = 1, height = 1, label = mag.wall(" ",4).."T3 (ms):"}
	,{class = "intedit", min = 0,            name = "u_fade_t3",  value = c_fade_t3,  x = 1, y = 10, width = 1, height = 1}
	,{class = "label",                                                                x = 0, y = 11, width = 1, height = 1, label = mag.wall(" ",4).."T4 (ms):"}
	,{class = "intedit", min = 0,            name = "u_fade_t4",  value = c_fade_t4,  x = 1, y = 11, width = 1, height = 1}
	,{class = "label",                                                                x = 0, y = 12, width = 1, height = 1, label = "A3 (0-255):"}
	,{class = "intedit", min = 0, max = 255, name = "u_fade_a3",  value = c_fade_a3,  x = 1, y = 12, width = 1, height = 1}
	,{class = "checkbox",                    name = "u_fade_out", value = c_fade_out, x = 0, y = 13, width = 2, height = 1, label = "T3 ve T4 zamanlarını bitiş süresinden çıkar."}
	}
	local ok, config = mag.dlg(gui,{"Kaydet","Kapat"})
	if ok == "Kaydet" then
	c_fad_t1   = config.u_fad_t1
	c_fad_t2   = config.u_fad_t2
	c_fade_a1  = config.u_fade_a1
	c_fade_a2  = config.u_fade_a2
	c_fade_a3  = config.u_fade_a3
	c_fade_t1  = config.u_fade_t1
	c_fade_t2  = config.u_fade_t2
	c_fade_t3  = config.u_fade_t3
	c_fade_t4  = config.u_fade_t4
	c_fade_out = config.u_fade_out
	end
	end

	if mag_import then
	mag_update_link           = "https://github.com/magnum357i/Magnum-s-Aegisub-Scripts"
	mag_version_check         = false
		if not mag_version_check then
		mag_version           = mag.match(io.open(aegisub.decode_path("?data\\automation\\include\\mag.lua")):read("*all"),"module_version%s-=%s\"([^\"]+)\"")
			if mag_version and mag_version:gsub("%.","") < script_mag_version:gsub("%.","") then
			function mag_check() local k = aegisub.dialog.display({{class = "label", label = "Mag modülünün kurulu sürümü bu lua dosyası ile uyumsuz.\nEn az "..script_mag_version.." veya en güncel modül sürümünü indirmeniz gerekiyor.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
			aegisub.register_macro(script_name,script_desription,mag_check)
			else
			mag_version_check = true
			end
		end
		if mag_version_check then
		mag.register(script_name.."/Eğik",                       italic)
		mag.register(script_name.."/Hizalama/1",                 an1)
		mag.register(script_name.."/Hizalama/2",                 an2)
		mag.register(script_name.."/Hizalama/3",                 an3)
		mag.register(script_name.."/Hizalama/4",                 an4)
		mag.register(script_name.."/Hizalama/5",                 an5)
		mag.register(script_name.."/Hizalama/6",                 an6)
		mag.register(script_name.."/Hizalama/7",                 an7)
		mag.register(script_name.."/Hizalama/8",                 an8)
		mag.register(script_name.."/Hizalama/9",                 an9)
		mag.register(script_name.."/Şeffaflık Geçişi/Basit",     fad)
		mag.register(script_name.."/Şeffaflık Geçişi/Ayrıntılı", fade)
		mag.register(script_name.."/Şeffaflık Geçişi/Ayarlar",   fconfig)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end