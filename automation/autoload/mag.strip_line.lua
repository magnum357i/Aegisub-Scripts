	script_name        = "Strip Line"
	script_description = "Satırları düzenler, temizler."
	script_author      = "Magnum357"
	script_version     = "1.4.3"
	script_mag_version = "1.1.1.8"

	mag_import, mag = pcall(require,"mag")

	c_line_property        = false
	c_layer                = false
	c_actor                = false
	c_effect               = false
	c_left_margin          = false
	c_right_margin         = false
	c_vertical_margin      = false
	c_text                 = true
	c_text_tag             = false
	c_text_special         = false
	c_text_comment         = false
	c_text_double_space    = false
	c_extra_options        = false
	c_text_space_trim      = false
	c_empty_text           = false
	c_comment_line         = false
	c_one_line             = false
	c_line_break_space     = false
	c_turkish_char         = false
	c_fix_timing           = false
	c_karaoke_options      = false
	c_delete_fx            = false
	c_furigana_style       = false
	c_strip_template_apply = false
	c_reset_template       = false
	c_comment_lines        = false
	c_log_view             = false
	c_button               = nil

	function strip_line(subs,sel,config)
	local log          = {}
	local apply_lines  = mag.unstyles(config.u_apply_lines)
	local first_index  = mag.first_index(subs)
	local delete_lines = {}
	local comment1, comment2, style1, style2, line
	local k
	local i_last
	if apply_lines == "Seçili satırlar" then
	local sell = mag.sel_index(subs,sel)
	i_last     = #sell
	else
	i_last     = #subs
	end
	for i = i_last, 1, -1 do
		if apply_lines == "Seçili satırlar" then
		k = sel[i]
		else
		k = i
		end
	line     = subs[k]
	style1   = 1
	style2   = 1
	comment1 = 1
	comment2 = 1
		if c_comment_lines then
		comment1, comment2 = line.comment, false
		end
		if apply_lines ~= "Tüm stiller" then
			if apply_lines ~= "Seçili satırlar" then
			style1, style2 = line.style, apply_lines
			end
		end
		if comment1 == comment2 and style1 == style2 and line.class == "dialogue" then
			if c_empty_text or c_extra_options then
				if mag.gsub(line.text,"%s+","") == "" then
				log["empty_line"] = true
				mag.insert(delete_lines,k)
				end
			end
			if c_comment_line or c_extra_options then
				if line.comment then
				log["comment_line"] = true
				mag.insert(delete_lines,k)
				end
			end
			if c_one_line or c_extra_options then
				if k > first_index then
				local next_line = subs[k - 1]
					if mag.full_strip(line.text) == mag.full_strip(next_line.text) and line.style == next_line.style then
					log["one_line"]    = true
					mag.insert(delete_lines,k)
					next_line.end_time = line.end_time
					subs[k - 1]        = next_line
					end
				end
			end
			if c_delete_fx or c_karaoke_options then
				if line.effect == "fx" then
				log["delete_fx"] = true
				mag.insert(delete_lines,k)
				end
			end
		end
		if c_furigana_style or c_karaoke_options then
			if line.class == "style" then
				if mag.match(line.name,"%-furigana") then
				log["furigana_style"] = true
				mag.insert(delete_lines,k)
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
	i_last = i_last - #delete_lines
	for i = 1, i_last do
		if apply_lines == "Seçili satırlar" then
		k = sel[i]
		else
		k = i
		end
	line     = subs[k]
	style1   = 1
	style2   = 1
	comment1 = 1
	comment2 = 1
		if apply_lines ~= "Tüm stiller" then
			if apply_lines ~= "Seçili satırlar" then
			style1, style2 = line.style, apply_lines
			end
		end
		if c_comment_lines then
		comment1, comment2 = line.comment, false
		end
		if line.class == "dialogue" and style1 == style2 and comment1 == comment2 then
			if style1 == style2 then
			if c_layer             or c_line_property           then if line.layer    >  0                            then log["layer"]             = true line.layer    = 0                             end end
			if c_actor             or c_line_property           then if line.actor    ~= ""                           then log["actor"]             = true line.actor    = ""                            end end
			if c_effect            or c_line_property           then if line.effect   ~= ""                           then log["effect"]            = true line.effect   = ""                            end end
			if c_left_margin       or c_line_property           then if line.margin_l >  0                            then log["margin_left"]       = true line.margin_l = 0                             end end
			if c_right_margin      or c_line_property           then if line.margin_r >  0                            then log["margin_right"]      = true line.margin_r = 0                             end end
			if c_vertical_margin   or c_line_property           then if line.margin_t >  0                            then log["margin_vertical"]   = true line.margin_t = 0                             end end
			if c_text_tag          or c_line_property or c_text then if mag.match(line.text,"{%s-\\[a-z]+")           then log["text_tag"]          = true line.text     = mag.tag_strip(line.text)      end end
			if c_text_special      or c_line_property or c_text then if mag.match(line.text,"\\[nNh]")                then log["text_special"]      = true line.text     = mag.special_strip(line.text)  end end
			if c_text_comment      or c_line_property or c_text then if mag.match(line.text,"{[^\\]*}")               then log["text_comment"]      = true line.text     = mag.comment_strip(line.text)  end end
			if c_text_double_space or c_line_property or c_text then if mag.match(line.text,"%s%s")                   then log["text_double_space"] = true line.text     = mag.gsub(line.text,"%s+"," ") end end
			if c_text_space_trim   or c_line_property or c_text then if mag.find(mag.full_strip(line.text),"%s") == 1 then log["text_space_trim"]   = true line.text     = mag.space_trim(line.text)     end end
				if c_line_break_space or c_extra_options then
					if mag.match(mag.strip(line.text),"\\N%s+") or mag.match(mag.strip(line.text),"%s+\\N") then
					log["line_break_space"] = true
					local _, split_text     = mag.splitter(true,line.text,"\\N")
					local stc               = ""
					local lb                = false
						for s = 1, #split_text do
							if lb then
							split_text[s] = mag.left_space_trim(split_text[s])
							lb            = false
							end
							if mag.find(mag.reverse(split_text[s]),"N\\") == 1 then
							split_text[s] = mag.gsub(split_text[s],"\\N","")
							split_text[s] = mag.right_space_trim(split_text[s]).."\\N"
							lb            = true
							end
						stc = stc..split_text[s]
						end
					line.text = stc
					end
				end
				if c_turkish_char or c_extra_options then
				local fix_chars =
				{
				"þ", "ş",
				"Þ", "Ş",
				"Ý", "İ",
				"ý", "ı",
				"ð", "ğ",
				"Ð", "Ğ"
				}
					for j = 1, #fix_chars / 2 do
						if mag.match(line.text,fix_chars[j * 2 - 1]) then
						log["turkish_char"] = true
						line.text = mag.gsub(line.text,fix_chars[j * 2 - 1],fix_chars[j * 2])
						end
					end
				end
				if c_fix_timing or c_extra_options then
				local sf_time = mag.frame_time(line.start_time)
				local ef_time = mag.frame_time(line.end_time)
					if line.start_time > sf_time or ef_time < line.end_time then
					log["fix_timing"] = true
					line.start_time   = sf_time
					line.end_time     = ef_time
					end
				end
				if c_strip_template_apply or c_karaoke_options then
					if line.effect == "karaoke" and line.comment then
					log["strip_template_apply"] = true
					line.comment                = false
					line.effect                 = ""
					end
				end
				if c_reset_template or c_karaoke_options then
					if line.comment then
						if mag.match(line.effect,"template") or mag.match(line.effect,"code") then
							if line.start_time > 0 or line.end_time > 0 then
							log["reset_template"] = true
							line.start_time       = 0
							line.end_time         = 0
							end
						end
					end
				end
				if log["layer"]
				or log["actor"]
				or log["effect"]
				or log["margin_left"]
				or log["margin_right"]
				or log["margin_vertical"]
				or log["text_tag"]
				or log["text_special"]
				or log["text_comment"]
				or log["text_double_space"]
				or log["text_space_trim"]
				or log["line_break_space"]
				or log["turkish_char"]
				or log["fix_timing"]
				or log["strip_template_apply"]
				or log["reset_template"]
				then
				subs[k] = line
				end
			end
		end
	end
		if c_log_view then
		mag.log_view(log["layer"],                "Layer temizlemek")
		mag.log_view(log["actor"],                "Actor temizlemek")
		mag.log_view(log["effect"],               "Effect temizlemek")
		mag.log_view(log["margin_left"],          "Margin Left temizlemek")
		mag.log_view(log["margin_right"],         "Margin Right temizlemek")
		mag.log_view(log["margin_vertical"],      "Margin Vertical temizlemek")
		mag.log_view(log["text_tag"],             "Etiketleri temizlemek")
		mag.log_view(log["text_special"],         "Özel karakterleri temizlemek")
		mag.log_view(log["text_comment"],         "Yorum parantezlerini temizlemek")
		mag.log_view(log["text_double_space"],    "Tekrar eden boşlukları temizlemek")
		mag.log_view(log["text_space_trim"],      "Baştaki ve sondaki boşlukları temizlemek")
		mag.log_view(log["empty_line"],           "Boş satırları temizlemek")
		mag.log_view(log["comment_line"],         "Yorum satırlarını temizlemek")
		mag.log_view(log["one_line"],             "Sıralı satırları bütünlemek")
		mag.log_view(log["line_break_space"],     "Satır bölme boşluklarını temizlemek")
		mag.log_view(log["turkish_char"],         "Türkçe karakterleri düzeltmek")
		mag.log_view(log["fix_timing"],           "Satırları kare sürelerine göre zamanlamak.")
		mag.log_view(log["delete_fx"],            "Oluşturulan karaoke satırlarını silmek")
		mag.log_view(log["furigana_style"],       "Furigana stillerini silmek")
		mag.log_view(log["strip_template_apply"], "Karaoke satırlarını sıfırlamak")
		mag.log_view(log["reset_template"],       "Şablon satırlarının sürelerini sıfırla")
		end
	end

	function add_macro(subs,sel)
	local buttons           = {"Uygula","Gelişmiş seçenekler","Normal seçenekler","Kapat"}
	if c_button == nil then c_button = buttons[3] end
	local sel_total_format  = sel_total_format(subs,sel,"comment","Seçili satırlar")
	local subs_total_format = subs_total_format(subs,sel,"comment","Tüm stiller")
	local apply_items       = {"Seç",sel_total_format,subs_total_format}
	local z                 = false
	local gui               = {}
	local ok, config, butts
	repeat
	butts   = {buttons[1],buttons[2],buttons[4]}
	gui[1]  = {class = "checkbox", name = "u_line_property",        value = c_line_property,        x = 0, y = 0,  width = 3, height = 1, label = "[Satır Özellikleri]",                    hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
	gui[2]  = {class = "label",                                                                     x = 0, y = 1,  width = 1, height = 1, label = mag.wall(" ",5)}
	gui[3]  = {class = "checkbox", name = "u_layer",                value = c_layer,                x = 1, y = 1,  width = 2, height = 1, label = "Layer"}
	gui[4]  = {class = "checkbox", name = "u_actor",                value = c_actor,                x = 1, y = 2,  width = 2, height = 1, label = "Actor"}
	gui[5]  = {class = "checkbox", name = "u_effect",               value = c_effect,               x = 1, y = 3,  width = 2, height = 1, label = "Effect"}
	gui[6]  = {class = "checkbox", name = "u_left_margin",          value = c_left_margin,          x = 1, y = 4,  width = 2, height = 1, label = "Left Margin"}
	gui[7]  = {class = "checkbox", name = "u_right_margin",         value = c_right_margin,         x = 1, y = 5,  width = 2, height = 1, label = "Right Margin"}
	gui[8]  = {class = "checkbox", name = "u_vertical_margin",      value = c_vertical_margin,      x = 1, y = 6,  width = 2, height = 1, label = "Vertical Margin"}
	gui[9]  = {class = "checkbox", name = "u_text",                 value = c_text,                 x = 1, y = 7,  width = 2, height = 1, label = "Text",                                   hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
	gui[10] = {class = "label",                                                                     x = 1, y = 8,  width = 1, height = 1, label = mag.wall(" ",5)}
	gui[11] = {class = "checkbox", name = "u_text_tag",             value = c_text_tag,             x = 2, y = 8,  width = 1, height = 1, label = "Etiketler"}
	gui[12] = {class = "checkbox", name = "u_text_special",         value = c_text_special,         x = 2, y = 9,  width = 1, height = 1, label = "Özel karakterler",                       hint = "\\N, \\n, \\h"}
	gui[13] = {class = "checkbox", name = "u_text_comment",         value = c_text_comment,         x = 2, y = 10, width = 1, height = 1, label = "Yorum parantezleri"}
	gui[14] = {class = "checkbox", name = "u_text_double_space",    value = c_text_double_space,    x = 2, y = 11, width = 1, height = 1, label = "Tekrar eden boşluklar"}
	gui[15] = {class = "checkbox", name = "u_text_space_trim",      value = c_text_space_trim,      x = 2, y = 12, width = 1, height = 1, label = "Baştaki ve sondaki boşluklar"}
	gui[16] = {class = "label",                                                                     x = 0, y = 13, width = 8, height = 1, label = "[Uygulanacak Satırlar]"}
	gui[17] = {class = "dropdown", name = "u_apply_lines",          value = "Seç",                  x = 0, y = 14, width = 8, height = 1, items = apply_items,                              hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	gui[18] = {class = "checkbox", name = "u_comment_lines",        value = c_comment_lines,        x = 0, y = 15, width = 8, height = 1, label = "Yorum satırlarını geç."}
	gui[19] = {class = "checkbox", name = "u_log_view",             value = c_log_view,             x = 0, y = 16, width = 8, height = 1, label = "Olay kaydını göster."}
		if c_button == buttons[3] then
			for g = 20, #gui do
			gui[g] = nil
			end
		elseif c_button == buttons[2] then
		butts   = {buttons[1],buttons[3],buttons[4]}
		gui[16] = {class = "label",                                                                     x = 0, y = 13, width = 5, height = 1, label = "[Uygulanacak Satırlar]"}
		gui[17] = {class = "dropdown", name = "u_apply_lines",          value = "Seç",                  x = 0, y = 14, width = 5, height = 1, items = apply_items,                              hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
		gui[18] = {class = "checkbox", name = "u_comment_lines",        value = c_comment_lines,        x = 0, y = 15, width = 5, height = 1, label = "Yorum satırlarını geç."}
		gui[19] = {class = "checkbox", name = "u_log_view",             value = c_log_view,             x = 0, y = 16, width = 5, height = 1, label = "Olay kaydını göster."}	
		gui[20] = {class = "checkbox", name = "u_extra_options",        value = c_extra_options,        x = 3, y = 0,  width = 3, height = 1, label = "[Ekstra Ayarlar]",                       hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
		gui[21] = {class = "label",                                                                     x = 3, y = 1,  width = 1, height = 1, label = mag.wall(" ",5)}
		gui[22] = {class = "checkbox", name = "u_empty_text",           value = c_empty_text,           x = 4, y = 1,  width = 1, height = 1, label = "Boş satırları temizle."}
		gui[23] = {class = "checkbox", name = "u_comment_line",         value = c_comment_line,         x = 4, y = 2,  width = 1, height = 1, label = "Yorum satırlarını temizle."}
		gui[24] = {class = "checkbox", name = "u_one_line",             value = c_one_line,             x = 4, y = 3,  width = 1, height = 1, label = "Sıralı satırları bütünle.",              hint = "Aynı içeriğe sahip ve alt alta sıralanmış satırları bütünler."}
		gui[25] = {class = "checkbox", name = "u_line_break_space",     value = c_line_break_space,     x = 4, y = 4,  width = 1, height = 1, label = "Satır bölme boşluklarını temizle.",      hint = "Satır bölme karakterinin sağ ve sol tarafındaki boşlukları temizler."}
		gui[26] = {class = "checkbox", name = "u_turkish_char",         value = c_turkish_char,         x = 4, y = 5,  width = 1, height = 1, label = "Türkçe karakterleri düzelt."}
		gui[27] = {class = "checkbox", name = "u_fix_timing",           value = c_fix_timing,           x = 4, y = 6,  width = 1, height = 1, label = "Satırları kare sürelerine göre zamanla."}
		gui[28] = {class = "checkbox", name = "u_karaoke_options",      value = c_karaoke_options,      x = 3, y = 7,  width = 3, height = 1, label = "[Karaoke]",                              hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
		gui[29] = {class = "checkbox", name = "u_delete_fx",            value = c_delete_fx,            x = 4, y = 8,  width = 1, height = 1, label = "Oluşturulan karaoke satırlarını temizle."}
		gui[30] = {class = "checkbox", name = "u_furigana_style",       value = c_furigana_style,       x = 4, y = 9,  width = 1, height = 1, label = "Furigana stillerini temizle."}
		gui[31] = {class = "checkbox", name = "u_strip_template_apply", value = c_strip_template_apply, x = 4, y = 10, width = 1, height = 1, label = "Karaoke satırlarını sıfırla."}
		gui[32] = {class = "checkbox", name = "u_reset_template",       value = c_reset_template,       x = 4, y = 11, width = 1, height = 1, label = "Şablon satırlarının sürelerini sıfırla."}
		end
		if not z then
		z = true
		mag.styles_insert(subs,gui,17,"comment","")
		end
	ok, config = mag.dlg(gui,butts)
	if ok == mag.ascii(buttons[2]) then c_button = buttons[2] end
	if ok == mag.ascii(buttons[3]) then c_button = buttons[3] end
	c_line_property        = config.u_line_property
	c_layer                = config.u_layer
	c_actor                = config.u_actor
	c_effect               = config.u_effect
	c_left_margin          = config.u_left_margin
	c_right_margin         = config.u_right_margin
	c_vertical_margin      = config.u_vertical_margin
	c_text                 = config.u_text
	c_text_tag             = config.u_text_tag
	c_text_special         = config.u_text_special
	c_text_comment         = config.u_text_comment
	c_text_double_space    = config.u_text_double_space
	c_text_space_trim      = config.u_text_space_trim
		if c_button == buttons[2] then
		c_extra_options        = config.u_extra_options
		c_empty_text           = config.u_empty_text
		c_comment_line         = config.u_comment_line
		c_one_line             = config.u_one_line
		c_line_break_space     = config.u_line_break_space
		c_turkish_char         = config.u_turkish_char
		c_fix_timing           = config.u_fix_timing
		c_karaoke_options      = config.u_karaoke_options
		c_delete_fx            = config.u_delete_fx
		c_furigana_style       = config.u_furigana_style
		c_strip_template_apply = config.u_strip_template_apply
		c_reset_template       = config.u_reset_template
		end
	c_comment_lines        = config.u_comment_lines
	c_log_view             = config.u_log_view
	until ok == "Kapat" or config.u_apply_lines ~= "Seç" and ok == "Uygula" or aegisub.cancel()
	if ok == "Uygula" then
		if	not c_line_property
		and not c_layer
		and not c_actor
		and not c_effect
		and not c_left_margin
		and not c_right_margin
		and not c_vertical_margin
		and not c_text
		and not c_text_tag
		and not c_text_special
		and not c_text_comment
		and not c_text_double_space
		and not c_text_space_trim
		and not c_extra_options
		and not c_empty_text
		and not c_comment_line
		and not c_one_line
		and not c_line_break_space
		and not c_turkish_char
		and not c_fix_timing
		and not c_karaoke_options
		and not c_delete_fx
		and not c_furigana_style
		and not c_strip_template_apply
		and not c_reset_template
		then
		mag.log(2,"Hiçbir tercih yapmadınız.")
		else
		strip_line(subs,sel,config)
		mag.undo_point()
		end
	end
	end

	function last_options(subs,sel)
	local config         = {}
	config.u_apply_lines = "Seçili satırlar"
	strip_line(subs,sel,config)
	mag.undo_point()
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
			mag.register(script_name.."/Aç",            add_macro)
			mag.register(script_name.."/Son tercihler", last_options)
			end
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end