	script_name        = "Strip Line"
	script_description = "Satıra ait her bilgiyi siler. Satırda metnin sadece salt halini bırakır."
	script_author      = "Magnum357"
	script_version     = "1.3.2"

	mag_import, mag = pcall(require,"mag")

	function strip_line(subs,sel,config)
	local style_name   = mag.unstyles(config["u_style_name"])
	local first_index  = mag.first_index(subs)
	local delete_lines = {}
	local style1, style2, line
	if config.u_line_property == true then
	config.u_layer           = true
	config.u_actor           = true
	config.u_effect          = true
	config.u_left_margin     = true
	config.u_right_margin    = true
	config.u_vertical_margin = true
	config.u_text            = true
	end
	if config.u_text == true then
	config.u_text_tag          = true
	config.u_text_special      = true
	config.u_text_comment      = true
	config.u_text_double_space = true
	config.u_text_space_trim   = true
	end
	if config.u_extra_options == true then
	config.u_empty_text   = true
	config.u_comment_line = true
	config.u_one_line     = true
	end
	if config.u_empty_text == true or config.u_comment_line == true or config.u_one_line == true then
		for i = #subs, 1, -1 do
		line = subs[i]
			if line.class == "dialogue" then
			style1 = style_name
			style2 = line.style
			if style_name == "Tüm stiller" then style1 = 1 style2 = 1 end
				if style1 == style2 then
					if config.u_empty_text == true then
					if mag.gsub(line.text,"%s+","") == "" then table.insert(delete_lines,i) end
					end
					if config.u_comment_line == true then
					if line.comment == true then table.insert(delete_lines,i) end
					end
					if config.u_one_line == true then
						if i > first_index then
						local next_line = subs[i - 1]
							if mag.full_strip(line.text) == mag.full_strip(next_line.text) and line.style == next_line.style then
							table.insert(delete_lines,i)
							next_line.end_time = line.end_time
							subs[i - 1] = next_line
							end
						end
					end
				end
			end
		end
		if delete_lines[1] then
		mag.full_double(delete_lines)
		local del = 1
			for i = #subs, 1, -1 do
				if i == delete_lines[del] then
				del = del + 1
				subs.delete(i)
				end
			end	
		end
	end
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
		style1 = subs[i].style
		style2 = style_name
		if style_name == "Tüm stiller" then style1 = 1 style2 = 1 end
			if style1 == style2 then
			line = subs[i]
			if config.u_layer              == true then line.layer    = 0                             end
			if config.u_actor              == true then line.actor    = ""                            end
			if config.u_effect             == true then line.effect   = ""                            end
			if config.u_left_margin        == true then line.margin_l = 0                             end
			if config.u_right_margin       == true then line.margin_r = 0                             end
			if config.u_vertical_margin    == true then line.margin_t = 0                             end
			if config.u_text_tag           == true then line.text     = mag.tag_strip(line.text)      end
			if config.u_text_special       == true then line.text     = mag.special_strip(line.text)  end
			if config.u_text_comment       == true then line.text     = mag.comment_strip(line.text)  end
			if config.u_text_double_space  == true then line.text     = mag.gsub(line.text,"%s+"," ") end
			if config.u_text_space_trim    == true then line.text     = mag.space_trim(line.text)     end
			subs[i] = line
			end
		end
	end
	end

	function create_config(subs)
	local dialog_config =
	{{class = "checkbox", name = "u_line_property",                            x = 0, y = 0,  width = 3, height = 1, label = "[Satır Özellikleri]",          hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
	,{class = "label",                                                         x = 0, y = 1,  width = 1, height = 1, label = mag.wall(" ",5)}
	,{class = "checkbox", name = "u_layer",                                    x = 1, y = 1,  width = 2, height = 1, label = "Layer"}
	,{class = "checkbox", name = "u_actor",                                    x = 1, y = 2,  width = 2, height = 1, label = "Actor"}
	,{class = "checkbox", name = "u_effect",                                   x = 1, y = 3,  width = 2, height = 1, label = "Effect"}
	,{class = "checkbox", name = "u_left_margin",                              x = 1, y = 4,  width = 2, height = 1, label = "Left Margin"}
	,{class = "checkbox", name = "u_right_margin",                             x = 1, y = 5,  width = 2, height = 1, label = "Right Margin"}
	,{class = "checkbox", name = "u_vertical_margin",                          x = 1, y = 6,  width = 2, height = 1, label = "Vertical Margin"}
	,{class = "checkbox", name = "u_text",              value = true,          x = 1, y = 7,  width = 2, height = 1, label = "Text",                         hint = "Aşağıdaki seçeneklerin hepsini siler."}
	,{class = "label",                                                         x = 1, y = 8,  width = 1, height = 1, label = mag.wall(" ",5)}
	,{class = "checkbox", name = "u_text_tag",                                 x = 2, y = 8,  width = 1, height = 1, label = "Etiketler"}
	,{class = "checkbox", name = "u_text_special",                             x = 2, y = 9,  width = 1, height = 1, label = "Özel karakterler",             hint = "\\N, \\n, \\h"}
	,{class = "checkbox", name = "u_text_comment",                             x = 2, y = 10, width = 1, height = 1, label = "Yorum parantezleri"}
	,{class = "checkbox", name = "u_text_double_space",                        x = 2, y = 11, width = 1, height = 1, label = "Tekrar eden boşluklar"}
	,{class = "checkbox", name = "u_text_space_trim",                          x = 2, y = 12, width = 1, height = 1, label = "Baştaki ve sondaki boşluklar"}
	,{class = "checkbox", name = "u_extra_options",                            x = 3, y = 0,  width = 3, height = 1, label = "[Ekstra Ayarlar]",             hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
	,{class = "label",                                                         x = 3, y = 1,  width = 1, height = 1, label = mag.wall(" ",5)}
	,{class = "checkbox", name = "u_empty_text",                               x = 4, y = 1,  width = 1, height = 1, label = "Boş satırları sil."}
	,{class = "checkbox", name = "u_comment_line",                             x = 4, y = 2,  width = 1, height = 1, label = "Yorum satırlarını sil."}
	,{class = "checkbox", name = "u_one_line",                                 x = 4, y = 3,  width = 1, height = 1, label = "Sıralı satırları bütünle.",    hint = "Aynı içeriğe sahip ve alt alta sıralanmış satırları bütünler."}
	,{class = "label",                                                         x = 0, y = 13, width = 5, height = 1, label = "[Uygulanacak Stil]"}
	,{class = "dropdown", name = "u_style_name",        value = "Tüm stiller", x = 0, y = 14, width = 5, height = 1, items = {"Tüm stiller"},                hint = "Sadece kullanılan stiller listelenir."}
	}
	mag.styles_insert(subs,dialog_config,22,"default","")
	return dialog_config
	end

	function add_macro(subs)
	local ok, config
	ok, config = mag.dlg(create_config(subs),{"Temizle","Kapat"})
	if ok == "Temizle" then
	if	config.u_line_property     == false
	and config.u_layer             == false
	and config.u_actor             == false
	and config.u_effect            == false
	and config.u_left_margin       == false
	and config.u_right_margin      == false
	and config.u_vertical_margin   == false
	and config.u_text              == false
	and config.u_text_tag          == false
	and config.u_text_special      == false
	and config.u_text_comment      == false
	and config.u_text_double_space == false
	and config.u_text_space_trim   == false
	and config.u_extra_options     == false
	and config.u_empty_text        == false
	and config.u_comment_line      == false
	and config.u_one_line          == false
	then mag.log(2,"Hiçbir tercih yapmadınız.")
	else strip_line(subs,sel,config) end
	aegisub.set_undo_point(script_name)
	end
	end

	if mag_import then mag.register(script_name,add_macro) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end