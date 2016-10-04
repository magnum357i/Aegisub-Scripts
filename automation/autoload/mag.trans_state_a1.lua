	script_name        = "Translate State A1"
	script_description = "Çeviriyi yüzdeler ve yüzdeye göre bölme yapar."
	script_author      = "Magnum357"
	script_version     = "2.1"
	script_mag_version = "1.1.2.4"

	mag_import, mag = pcall(require,"mag")

	c              = {}
	c.titles       = ""
	c.comment_mode = true
	c.empty_mode   = true
	c.percent_mode = true
	c.number_mode  = true
	c.apply        = "Seç"
	c_buttons      = {"Hesapla","Kapat"}
	c_buttons1     = {"Kaldır","Kapat"}

	function trans_state_a1(subs,sel,config)
	local index       = {}
	local tlines      = 0
	local apply_lines = mag.unstyles(config.u_apply_lines)
	local i_last
	if apply_lines == "Seçili satırlar" then
	local sel = mag.sel_index(subs,sel)
	i_last    = table.getn(sel)
	else
	i_last    = #subs
	end
	for i = 1, i_last do
	local k
	if apply_lines == "Seçili satırlar" then k = sel[i] else k = i end
	local line     = subs[k]
	local style1   = 1
	local style2   = 1
	local comment1 = 1
	local comment2 = 1
	if c.comment_mode then comment1, comment2 = line.comment, false end
	if apply_lines ~= "Tüm stiller" then if apply_lines ~= "Seçili satırlar" then style1, style2 = line.style, apply_lines end end
		if comment1 == comment2 and style1 == style2 and line.class == "dialogue" then
			if c.empty_mode then
				if mag.full_strip(mag.gsub(line.text,"%s-","")) ~= "" then
				tlines = tlines + 1
				mag.insert(index,k)
				end
			else
			tlines = tlines + 1
			mag.insert(index,k)
			end
		end
	end
	if index[1] ~= 1 then
	local zero = "11"
		if c.percent_mode then
		zero = "11111"
		end
	local n = 0
		for i = 1, #index do
		line = subs[index[i]]
		n = n + 1
		local result  = ""
		result        = mag.format("(%%%s)",mag.zero(zero,mag.percent(tlines,n,tf_and_ft(c.percent_mode))))
			if c.number_mode then
			result = split(" ",result,mag.format("%s / %s",tlines,mag.zero(tlines,n)))
			end
			if result ~= "" then
			line.effect    = result
			subs[index[i]] = line
			end
		end
	local title = {}
		if mag.gsub(c.titles,"%s+","") ~= "" then
		_, title = mag.vars(c.titles)
		end
		if title[1] ~= nil and #title < tlines then
		local spc   = mag.floor(tlines / #title)
		local lo    = tlines - mag.floor(tlines / spc) * mag.floor(tlines / #title)
		local parts = {}
		local m     = 0
			for i = 1, #title do
			mag.insert(parts,spc)
			end
		local lnc = 0
			for j = 1, lo do
			lnc = lnc + 1
			parts[lnc] = parts[lnc] + 1
				if parts[lnc + 1] == nil then
				lnc = 0
				end
			end
		local p = 1
			for u = 1, #index do
			line          = subs[index[u]]
			m             = m + 1
			local result2 = ""
			result2       = mag.format("(%%%s)",mag.zero(zero,mag.percent(parts[p],m,tf_and_ft(c.percent_mode))))
				if c.number_mode then
				result2 = split(" ",result2,mag.format("%s / %s",parts[p],mag.zero(parts[p],m)))
				end
			result2 = split(" ",result2,mag.format("[%s]",title[p]))
				if parts[p] == m then
				p = p + 1
				m = 0
				end
				if result2 ~= "" then
				line.effect    = mag.format("%s - > %s",line.effect,result2)
				subs[index[u]] = line
				end
			end
		end
	end
	end

	function no_trans_state_a1(subs,sel,config)
	local apply_lines = mag.unstyles(config.u_apply_lines)
	local i_last
	if apply_lines == "Seçili satırlar" then
	local sel = mag.sel_index(subs,sel)
	i_last    = table.getn(sel)
	else
	i_last    = #subs
	end
	for i = 1, i_last do
	local k
	if apply_lines == "Seçili satırlar" then k = sel[i] else k = i end
	local line     = subs[k]
	local style1   = 1
	local style2   = 1
	local comment1 = 1
	local comment2 = 1
	if c.comment_mode then comment1, comment2 = line.comment, false end
	if apply_lines ~= "Tüm stiller" then if apply_lines ~= "Seçili satırlar" then style1, style2 = line.style, apply_lines end end
		if comment1 == comment2 and style1 == style2 and line.class == "dialogue" then
			if mag.match(line.effect,"%%%d+") then
			line.effect = ""
			subs[k]     = line
			end
		end
	end
	end

	function split(split,value,new_value)
	local r = value
	if new_value ~= "" then
	r = value..split..new_value
	end
	return r
	end

	function tf_and_ft(value)
	if value == true then return false end
	if value == false then return true end
	end

	function add_calc(subs,sel)
	mag.get_config(c)
	local apply_items = mag.apply_items(subs,sel,"comment","")
	c.apply           = mag.search_apply_items(apply_items,c.apply)
	local ok, config, gui
	repeat
	gui =
	{
	 {class = "label",                                                     x = 0, y = 0, width = 1,  height = 1, label = mag.wall(" ",30).."Böl:"}
	,{class = "edit",     name = "u_titles",       value = c.titles,       x = 1, y = 0, width = 20, height = 1, hint = "Bu bölüme arasına virgül koyarak girdiğiniz her kelime kadar genel yüzdeyi böler: bölme1,bölme2,bölme3,...\n\n Bu bölümü doldurmanız gerekmemektedir."}
	,{class = "label",                                                     x = 0, y = 1, width = 1,  height = 1, label = "Uygulanacak satırlar:"}
	,{class = "dropdown", name = "u_apply_lines",  value = c.apply,        x = 1, y = 1, width = 20, height = 1, items = apply_items, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_mode", value = c.comment_mode, x = 1, y = 2, width = 20, height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_empty_mode",   value = c.empty_mode,   x = 1, y = 3, width = 20, height = 1, label = "Boş satırları geç."}
	,{class = "checkbox", name = "u_percent_mode", value = c.percent_mode, x = 1, y = 4, width = 20, height = 1, label = "Küsurat: n.n%"}
	,{class = "checkbox", name = "u_number_mode",  value = c.number_mode,  x = 1, y = 5, width = 20, height = 1, label = "Satır sayıları: n / n"}
	}
	ok, config     = mag.dlg(gui,c_buttons)
	c.titles       = config.u_titles
	c.comment_mode = config.u_comment_mode
	c.empty_mode   = config.u_empty_mode
	c.percent_mode = config.u_percent_mode
	c.apply        = config.u_apply_lines
	c.number_mode  = config.u_number_mode
	until ok == c_buttons[1] and c.apply ~= "Seç" or ok == c_buttons[2]
	if ok == c_buttons[1] then
	trans_state_a1(subs,sel,config)
	mag.undo_point()
	end
	mag.set_config(c)
	end

	function remove_calc(subs,sel)
	mag.get_config(c)
	local apply_items = mag.apply_items(subs,sel,"comment","")
	c.apply           = mag.search_apply_items(apply_items,c.apply)
	local ok, config, gui
	repeat
	gui =
	{
	 {class = "label",                                                     x = 0, y = 0, width = 1,  height = 1, label = "Uygulanacak satırlar:"}
	,{class = "dropdown", name = "u_apply_lines",  value = c.apply,        x = 1, y = 0, width = 10, height = 1, items = apply_items, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_mode", value = c.comment_mode, x = 1, y = 1, width = 10, height = 1, label = "Yorum satırlarını geç."}
	}
	ok, config     = mag.dlg(gui,c_buttons1)
	c.apply        = config.u_apply_lines
	c.comment_mode = config.u_comment_mode
	until ok == c_buttons1[1] and config.u_apply_lines ~= "Seç" or ok == c_buttons[2]
	if ok == c_buttons1[1] then
	no_trans_state_a1(subs,sel,config)
	mag.undo_point()
	end
	mag.set_config(c)
	end

	function check_macro(subs,sel)
	local fe, fee = pcall(add_calc,subs,sel)
	mag.funce(fe,fee)
	end

	function check_macro1(subs,sel)
	local fe, fee = pcall(remove_calc,subs,sel)
	mag.funce(fe,fee)
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
			mag.register(script_name.."/Hesapla", check_macro)
			mag.register(script_name.."/Kaldır",  check_macro1)
			end
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end