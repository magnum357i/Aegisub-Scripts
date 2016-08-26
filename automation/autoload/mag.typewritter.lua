	script_name        = "Typewritter"
	script_description = "Daktilo tarzı ekran yazılarına yardım eder"
	script_author      = "Magnum357"
	script_version     = "1.7"
	script_mag_version = "1.1.1.9"

	mag_import, mag = pcall(require,"mag")

	function typewritter(subs,sel,config)
	local st = config["u_start"]
	local et = config["u_end"]
	local fade_mode = config["u_fade_mode"]
	local n
	local text_len
	local is
	local ie
	local in_tags
	local result
	local tt1, tt2, tt3, tt4
	local s_tt
	local e_tt
	local s_ttime
	local e_ttime
	local s_t
	local e_t
	local dur
	local line
	local l
	local count = 0
	local index = {}
	for _, li in ipairs(sel) do
	li = li + count
	count = count + 1
	line     = subs[li]
	dur      = line.end_time - line.start_time
	text_len = mag.gsub(line.text,"%s","")
	text_len = mag.full_strip(text_len)
	text_len = mag.len(text_len)
	if not fade_mode then text_len = text_len + 1 end
	is      = st / text_len
	s_tt    = is / text_len
	ie      = et / text_len
	e_tt    = ie / text_len
	n       = 0
	s_ttime = {}
	e_ttime = {}
	s_t     = ""
	e_t     = ""
	result  = ""
	in_tags = false
		for k = 1, text_len do
			if st ~= 0 then
			s_t = mag.floor((is * (k - 1)) + (s_tt * k))
			if k == 1 then s_t = 1 end
			if k == text_len then s_t = st end
			if s_t < 0 then s_t = s_t * -1 end
			table.insert(s_ttime,s_t)
			end
			if et ~= 0 then
			e_t = mag.floor((ie * (k - 1)) + (e_tt * k))
			if k == 1 then e_t = 0 end
			if k == text_len then e_t = et end
			if e_t < 0 then e_t = e_t * -1 end
			e_t = dur - e_t
			table.insert(e_ttime,e_t)
			end
		end
		for char in unicode.chars(line.text) do
		if char == "{" then in_tags = true end
		if char == "}" then in_tags = false end
			if in_tags == false and char ~= "}" and mag.match(char,"%s") == nil then
			n = n + 1
				if fade_mode then
					if st > 0 then tt1 = s_ttime[n] tt2 = tt1 else tt1 = s_ttime[(text_len + 1) - n] tt2 = tt1 end
					if et > 0 then tt3 = e_ttime[n] tt4 = tt3 else tt3 = e_ttime[(text_len + 1) - n] tt4 = tt3 end
				else
					if st > 0 then tt1 = s_ttime[n] tt2 = s_ttime[n + 1] else tt1 = s_ttime[(text_len + 1) - n] tt2 = s_ttime[text_len - n] end
					if et > 0 then tt3 = e_ttime[n] tt4 = e_ttime[n + 1] else tt3 = e_ttime[(text_len + 1) - n] tt4 = e_ttime[text_len - n] end
				end
				if st ~= 0 and et == 0 then char = mag.format("{\\alpha&HFF&\\t(%s,%s,\\alpha&H00&)}%s",tt1,tt2,char) end
				if et ~= 0 and st == 0 then char = mag.format("{\\alpha&H00&\\t(%s,%s,\\alpha&HFF&)}%s",tt3,tt4,char) end
				if st ~= 0 and et ~= 0 then char = mag.format("{\\alpha&HFF&\\t(%s,%s,\\alpha&H00&)\\t(%s,%s,\\alpha&HFF&)}%s",tt1,tt2,tt3,tt4,char) end
			end
		result = result..char
		end
	l = table.copy(line)
	l.text = result
	subs.insert(li + 1,l)
	line.comment = true
	subs[li] = line
	table.insert(index,li)
	end
	return index
	end

	function reset()
	c_start       = 0
	c_end         = 0
	c_fade_mode   = true
	c_save_config = false
	end

	function dialog()
	if c_save_config == nil or c_save_config == false then reset() end
	local dlg =
	{{class = "label",                                                   x = 0, y = 0, width = 1, height = 1, label = "Baştan(ms):"}
	,{class = "intedit",  name = "u_start",       value = c_start,       x = 1, y = 0, width = 1, height = 1, hint  = "Negatif değerler girmek efeği zıt yönden başlatır. Sıfır(0) değerine hiçbir işlem yapılmaz. Sadece baştan veya sondan başlamasına ihtiyacınız varsa ihtiyacınız olmanayana bu değeri girebilirsiniz."}
	,{class = "label",                                                   x = 0, y = 1, width = 1, height = 1, label = "Sondan(ms):"}
	,{class = "intedit",  name = "u_end",         value = c_end,         x = 1, y = 1, width = 1, height = 1, hint  = "Negatif değerler girmek efeği zıt yönden başlatır. Sıfır(0) değerine hiçbir işlem yapılmaz. Sadece baştan veya sondan başlamasına ihtiyacınız varsa ihtiyacınız olmanayana bu değeri girebilirsiniz."}
	,{class = "checkbox", name = "u_fade_mode",   value = c_fade_mode,   x = 0, y = 2, width = 2, height = 1, label = "Geçişi kaldır."}
	,{class = "checkbox", name = "u_save_config", value = c_save_config, x = 0, y = 3, width = 2, height = 1, label = "Arayüzdeki tercihleri hatırla."}
	}
	return dlg
	end

	function add_macro(subs,sel)
	local buttons = {"Uygula","Kapat"}
	local ok, config
	ok, config = aegisub.dialog.display(dialog(),buttons)
	if ok == buttons[1]	then
		if config.u_start == 0 and config.u_end == 0 then mag.log(2,"Hiçbir süre(ms) girilmedi.")
		else
			if config.u_save_config then
			c_start     = config.u_start
			c_end       = config.u_end
			c_fade_mode = config.u_fade_mode
			end
		c_save_config = config.u_save_config
		return typewritter(subs,sel,config)
		end
	end
	aegisub.set_undo_point(script_name)
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
		mag.register(false,add_macro)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end