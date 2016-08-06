	script_name        = "Translate State A1"
	script_description = "Çevirinin yüzde kaçında olduğunuzu gösterir."
	script_author      = "Magnum357"
	script_version     = "1.7"
	script_mag_version = "1.1.1.8"

	mag_import, mag = pcall(require,"mag")

	c_comment_mode = false
	c_empty_mode   = true
	c_percent_mode = true
	c_number_mode  = true

	function trans_state_a1(subs,sel,config)
	local pcs          = false
	local style_name   = mag.unstyles(config.u_style_name)
	local comment_mode = config.u_comment_mode
	local empty_mode   = config.u_empty_mode
	local percent_mode = config.u_percent_mode
	local number_mode  = config.u_number_mode
	local n, m         = 0, 0
	local zero, total_line, percent
	local style1, style2, comment1, comment2
	if percent_mode then
	zero         = "11111"
	percent_mode = false
	else
	zero         = "11"
	percent_mode = true
	end
	if style_name == "Tüm stiller" then
		if comment_mode then
		total_line = mag.total_comment_full(subs)
		else
		total_line = mag.total_full(subs)
		end
	else
		if comment_mode then
		total_line = mag.total(subs,style_name,"comment")
		else
		total_line = mag.total(subs,style_name,"default")
		end
	end
	if empty_mode then
		for i = 1, #subs do
		local line = subs[i]
			if line.class == "dialogue" then
				if style_name == "Tüm stiller" then
				style1, style2 = 1, 1
				else
				style1, style2 = line.style, style_name
				end
				if comment_mode then
				comment1, comment2 = line.comment, false
				else
				comment1, comment2 = 1, 1
				end
				if style1 == style2 and comment1 == comment2 then
					if empty_mode then
						if mag.full_strip(mag.gsub(line.text,"%s-","")) == "" then
						m = m + 1
						end
					end
				end
			end
		end
	total_line = total_line - m
	end
	for i = 1, #subs do
	local line = subs[i]
		if line.class == "dialogue" then
			if style_name == "Tüm stiller" then
			style1, style2 = 1, 1
			else
			style1, style2 = line.style, style_name
			end
			if comment_mode then
			comment1, comment2 = line.comment, false
			else
			comment1, comment2 = 1, 1
			end
			if style1 == style2 and comment1 == comment2 then
			local empty = false
				if empty_mode then
					if mag.full_strip(mag.gsub(line.text,"%s-","")) == "" then
					empty = true
					end
				end
				if not empty then
				pcs          = true
				local result = ""
				n            = n + 1
					if number_mode then
					result = result..mag.format("%s / %s ",total_line,mag.zero(total_line,n))
					end
					if result == "" then
					result = mag.format("%s%%",mag.zero(zero,mag.percent(total_line,n,percent_mode)))
					else
					result = result..mag.format("(%s%%)",mag.zero(zero,mag.percent(total_line,n,percent_mode)))
					end
				line.effect = result
				subs[i]     = line
				end
			end
		end
	end
	mag.log_error(pcs,"Hiçbir işlem yapılmadı.")
	end

	function no_trans_state_a1(subs,sel,config)
	local pcs        = false
	local style_name = mag.unstyles(config.u_style_name)
	local style1, style2
	for i = 1, #subs do
	local line = subs[i]
		if line.class == "dialogue" then
			if style_name == "Tüm stiller" then
			style1, style2 = 1, 1
			else
			style1, style2 = line.style, style_name
			end
			if style1 == style2 then
				if mag.match(line.effect,"%d+%%") then
				pcs         = true
				line.effect = ""
				subs[i]     = line
				end
			end
		end
	end
	mag.log_error(pcs,"Hiçbir işlem yapılmadı.")
	end

	function add_calc(subs)
	local gui =
	{
	 {class = "label",                                                     x = 0, y = 0, width = 1,  height = 1, label = "Stil:"}
	,{class = "dropdown", name = "u_style_name",   value = "Tüm stiller",  x = 1, y = 0, width = 1,  height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_mode", value = c_comment_mode, x = 1, y = 1, width = 1,  height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_empty_mode",   value = c_empty_mode,   x = 1, y = 2, width = 1,  height = 1, label = "Boş satırları geç."}
	,{class = "checkbox", name = "u_percent_mode", value = c_percent_mode, x = 1, y = 3, width = 1,  height = 1, label = "Küsurat: n.n%"}
	,{class = "checkbox", name = "u_number_mode",  value = c_number_mode,  x = 1, y = 4, width = 1,  height = 1, label = "Satır sayıları: n / n"}
	}
	mag.styles_insert(subs,gui,2,"comment","")
	local ok, config = mag.dlg(gui,{"Hesapla","Kapat"})
	if ok == "Hesapla" then
	c_comment_mode = config.u_comment_mode
	c_empty_mode   = config.u_empty_mode
	c_percent_mode = config.u_percent_mode
	c_number_mode  = config.u_number_mode
	trans_state_a1(subs,sel,config)
	mag.undo_point()
	end
	end

	function remove_calc(subs)
	local gui =
	{
	 {class = "label",                                                  x = 0, y = 0, width = 1,  height = 1, label = "Stil:"}
	,{class = "dropdown", name = "u_style_name", value = "Tüm stiller", x = 1, y = 0, width = 1,  height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	}
	mag.styles_insert(subs,gui,2,"comment","")
	local ok, config = mag.dlg(gui,{"Kaldır","Kapat"})
	if ok == mag.ascii("Kaldır") then
	no_trans_state_a1(subs,sel,config)
	mag.undo_point()
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
			mag.register(script_name.."/Hesapla", add_calc)
			mag.register(script_name.."/Kaldır",  remove_calc)
			end
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end