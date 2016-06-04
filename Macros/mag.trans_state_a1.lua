	script_name = "Translate State A1"
	script_description = "Çevirinin yüzde kaçında olduğunuzu gösterir."
	script_author = "Magnum357"
	script_version = "1.6.4.1"

	mag_import, mag = pcall(require,"mag")

	function trans_state_a1(subs,sel,config)
	local style_name = mag.unstyles(config["u_style_name"])
	local percent_mode = config["u_percent_mode"]
	local number_mode = config["u_number_mode"]
	if percent_mode == true then percent_mode = false else percent_mode = true end
	local zero = "11111"
	local n = 0
	if percent_mode == true then zero = "11" end
	local total_line
	if style_name == "Tüm stiller" then total_line = mag.total_full(subs) else total_line = mag.total(subs,style_name,"default") end
	local percent
	local pcs = false
	for i=1, #subs do
	line = subs[i]
	if subs[i].class == "dialogue" then
	if style_name == "Tüm stiller" then style1 = 1 style2 = 1 else style1 = subs[i].style style2 = style_name end
	if style1 == style2 then
	n = n + 1
	if number_mode == true then
	line.effect = mag.format("%s / %s ( %s%% )",total_line,mag.zero(total_line,n),mag.zero(zero,mag.percent(total_line,n,percent_mode)))
	else
	line.effect = mag.format("%s%%",mag.zero(zero,mag.percent(total_line,n,percent_mode)))		
	end
	pcs = true
	subs[i] = line
	end
	end
	end
	if pcs == true then mag.prog("Yüzde hesaplanıyor...") else mag.log(1,"İşleminiz gerçekleştirilemedi!") end
	end

	function remove_trans_state_a1(subs,sel,config)
	local pcs = false
	local style_name = config["u_style_name"]:gsub("%(%d+%)%s","")
	for i=1, #subs do
	if subs[i].class == "dialogue" then
	line = subs[i]
	if style_name == "Tüm stiller" then style1 = 1 style2 = 1 else style1 = subs[i].style style2 = style_name end
	if style1 == style2 then
	if line.effect:match("%d+%.-%d-%%") then
	line.effect = ""
	pcs = true
	subs[i] = line
	end
	end
	end
	end
	if pcs == true then mag.prog("Çıktı verileri temizleniyor...") else mag.log(1,"İşleminiz gerçekleştirilemedi!") end
	end

	function create_config(subs)
	local dialog_config =
	{{class = "label",                                                    x = 0, y = 0, width = 1,  height = 1, label = "Stil:"                                                         }
	,{class = "dropdown", name = "u_style_name",   value = "Tüm stiller", x = 1, y = 0, width = 9,  height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. "}
	,{class = "checkbox", name = "u_percent_mode", value = true,          x = 1, y = 1, width = 1,  height = 1, label = "Yüzde küsuratını ekle."                                        }
	,{class = "checkbox", name = "u_number_mode",  value = true,          x = 1, y = 2, width = 1,  height = 1, label = "Satır sayılarını ekle."                                       }}
	mag.styles_insert(subs,dialog_config,2,"default","")
	return dialog_config
	end

	function add_macro(subs)
	local ok, config
	ok, config = mag.dlg(create_config(subs),{"Hesapla","Kaldır","Kapat"})
	if ok == "Hesapla" then trans_state_a1(subs,sel,config)
	elseif ok == mag.ascii("Kaldır") then remove_trans_state_a1(subs,sel,config) end
	aegisub.set_undo_point(script_name)
	end

	if mag_import then mag.register(false,add_macro) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end
