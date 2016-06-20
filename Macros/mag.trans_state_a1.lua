	script_name = "Translate State A1"
	script_description = "Çevirinin yüzde kaçında olduğunuzu gösterir."
	script_author = "Magnum357"
	script_version = "1.6.5.7"

	mag_import, mag = pcall(require,"mag")

	function trans_state_a1(subs,sel,config)
	local style_name = mag.unstyles(config["u_style_name"])
	local percent_mode = config["u_percent_mode"]
	local number_mode = config["u_number_mode"]
	local comment_mode = config["u_comment_mode"]
	local zero = "11111"
	local n = 0
	local total_line
	local percent
	local style1, style2
	local comment1, comment2
	local line
	if percent_mode == true then percent_mode = false else percent_mode = true end
	if percent_mode == true then zero = "11" end
	if style_name == "Tüm stiller" then
	if comment_mode then total_line = mag.total_comment_full(subs) else total_line = mag.total_full(subs) end
	else
	if comment_mode then total_line = mag.total(subs,style_name,"comment") else total_line = mag.total(subs,style_name,"default") end
	end
	for i = 1, #subs do
	line = subs[i]
		if line.class == "dialogue" then
		if style_name == "Tüm stiller" then style1 = 1 style2 = 1 else style1 = line.style style2 = style_name end
		if comment_mode then comment1 = line.comment comment2 = false else comment1 = 1 comment2 = 1 end
			if style1 == style2 then
			line.effect = ""
				if comment1 == comment2 then
				n = n + 1
				mag.progress("Hesaplanıyor...",n,total_line,true,350)
				if number_mode then line.effect = mag.format("%s / %s ( %s%% )",total_line,mag.zero(total_line,n),mag.zero(zero,mag.percent(total_line,n,percent_mode)))
				else line.effect = mag.format("%s%%",mag.zero(zero,mag.percent(total_line,n,percent_mode))) end
				end
			subs[i] = line
			end
		end
	end
	end

	function remove_trans_state_a1(subs,sel,config)
	local pcs = false
	local style_name = mag.unstyles(config["u_style_name"])
	local n = 0
	local total_line
	local style1, style2
	if style_name == "Tüm stiller" then total_line = mag.total_full(subs) else total_line = mag.total(subs,style_name,"default") end
	for i = 1, #subs do
		line = subs[i]
		if line.class == "dialogue" then
		if style_name == "Tüm stiller" then style1 = 1 style2 = 1 else style1 = line.style style2 = style_name end
			if style1 == style2 then
				if line.effect:match("%d+%.-%d-%%") then
				pcs = true
				n = n + 1
				mag.progress("Kaldırılıyor...",n,total_line,true,350)
				line.effect = ""
				subs[i] = line
				end
			end
		end
	end
	if pcs == false then mag.log(2,"Silinecek bir şey bulunamadı.") end
	end

	function create_config(subs)
	local dialog_config =
	{{class = "label",                                                    x = 0, y = 0, width = 1,  height = 1, label = "Stil:"}
	,{class = "dropdown", name = "u_style_name",   value = "Tüm stiller", x = 1, y = 0, width = 9,  height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. "}
	,{class = "checkbox", name = "u_percent_mode", value = true,          x = 1, y = 1, width = 1,  height = 1, label = "Yüzde küsuratını ekle."}
	,{class = "checkbox", name = "u_number_mode",  value = true,          x = 1, y = 2, width = 1,  height = 1, label = "Satır sayılarını ekle."}
	,{class = "checkbox", name = "u_comment_mode", value = false,         x = 1, y = 3, width = 1,  height = 1, label = "Yorum satırlarını geç."}
	}
	mag.styles_insert(subs,dialog_config,2,"comment","")
	return dialog_config
	end

	function add_macro(subs)
	local ok, config
	ok, config = mag.dlg(create_config(subs),{"Hesapla","Kaldır","Kapat"})
	if ok == "Hesapla" then trans_state_a1(subs,sel,config) elseif ok == mag.ascii("Kaldır") then remove_trans_state_a1(subs,sel,config) end
	aegisub.set_undo_point(script_name)
	end

	if mag_import then mag.register(false,add_macro) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end
