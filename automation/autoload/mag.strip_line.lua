	script_name        = "Strip Line"
	script_description = "Satırları düzenler, temizler."
	script_author      = "Magnum357"
	script_version     = "1.5.5"
	script_mag_version = "1.1.2.5"

	mag_import, mag = pcall(require,"mag")

	c_buttons              = {"Uygula","Gelişmiş seçenekler","Normal seçenekler","Kapat"}
	c                      = {}
	c.apply                = "Seç"
	c.line_property        = false
	c.layer                = false
	c.actor                = false
	c.effect               = false
	c.left_margin          = false
	c.right_margin         = false
	c.vertical_margin      = false
	c.text                 = true
	c.text_tag             = false
	c.text_special         = false
	c.text_comment         = false
	c.text_double_space    = false
	c.extra_options        = false
	c.text_space_trim      = false
	c.empty_text           = false
	c.comment_line         = false
	c.one_line             = false
	c.line_break_space     = false
	c.turkish_char         = false
	c.fix_timing           = false
	c.karaoke_options      = false
	c.delete_fx            = false
	c.furigana_style       = false
	c.strip_template_apply = false
	c.reset_template       = false
	c.comment_lines        = false
	c.log_view             = false
	c.button               = c_buttons[3]

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
		if c.comment_lines then
		comment1, comment2 = line.comment, false
		end
		if apply_lines ~= "Tüm stiller" then
			if apply_lines ~= "Seçili satırlar" then
			style1, style2 = line.style, apply_lines
			end
		end
		if comment1 == comment2 and style1 == style2 and line.class == "dialogue" then
			if c.empty_text or c.extra_options then
				if mag.gsub(line.text,"%s+","") == "" then
				log["empty_line"] = true
				mag.insert(delete_lines,k)
				end
			end
			if c.comment_line or c.extra_options then
				if line.comment then
				log["comment_line"] = true
				mag.insert(delete_lines,k)
				end
			end
			if c.one_line or c.extra_options then
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
			if c.delete_fx or c.karaoke_options then
				if line.effect == "fx" then
				log["delete_fx"] = true
				mag.insert(delete_lines,k)
				end
			end
		end
		if c.furigana_style or c.karaoke_options then
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
		if c.comment_lines then
		comment1, comment2 = line.comment, false
		end
		if line.class == "dialogue" and style1 == style2 and comment1 == comment2 then
			if style1 == style2 then
			if c.layer             or c.line_property           then if line.layer    >  0                            then log["layer"]             = true line.layer    = 0                             end end
			if c.actor             or c.line_property           then if line.actor    ~= ""                           then log["actor"]             = true line.actor    = ""                            end end
			if c.effect            or c.line_property           then if line.effect   ~= ""                           then log["effect"]            = true line.effect   = ""                            end end
			if c.left_margin       or c.line_property           then if line.margin_l >  0                            then log["margin_left"]       = true line.margin_l = 0                             end end
			if c.right_margin      or c.line_property           then if line.margin_r >  0                            then log["margin_right"]      = true line.margin_r = 0                             end end
			if c.vertical_margin   or c.line_property           then if line.margin_t >  0                            then log["margin_vertical"]   = true line.margin_t = 0                             end end
			if c.text_tag          or c.line_property or c.text then if mag.match(line.text,"{%s-\\[a-z]+")           then log["text_tag"]          = true line.text     = mag.tag_strip(line.text)      end end
			if c.text_special      or c.line_property or c.text then if mag.match(line.text,"\\[nNh]")                then log["text_special"]      = true line.text     = mag.special_strip(line.text)  end end
			if c.text_comment      or c.line_property or c.text then if mag.match(line.text,"{[^\\]*}")               then log["text_comment"]      = true line.text     = mag.comment_strip(line.text)  end end
			if c.text_double_space or c.line_property or c.text then if mag.match(line.text,"%s%s")                   then log["text_double_space"] = true line.text     = mag.gsub(line.text,"%s+"," ") end end
			if c.text_space_trim   or c.line_property or c.text then if mag.find(mag.full_strip(line.text),"%s") == 1 then log["text_space_trim"]   = true line.text     = mag.space_trim(line.text)     end end
				if c.line_break_space or c.extra_options then
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
				if c.turkish_char or c.extra_options then
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
				if c.fix_timing or c.extra_options then
				local sf_time = mag.frame_time(line.start_time)
				local ef_time = mag.frame_time(line.end_time)
					if sf_time ~= nil and ef_time ~= nil then
						if line.start_time > sf_time or ef_time < line.end_time then
						log["fix_timing"] = true
						line.start_time   = sf_time
						line.end_time     = ef_time
						end
					end
				end
				if c.strip_template_apply or c.karaoke_options then
					if line.effect == "karaoke" and line.comment then
					log["strip_template_apply"] = true
					line.comment                = false
					line.effect                 = ""
					end
				end
				if c.reset_template or c.karaoke_options then
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
		if c.log_view then
		mag.log_view(log["layer"],                "Layer alanı temizlendi.")
		mag.log_view(log["actor"],                "Actor alanı temizlendi.")
		mag.log_view(log["effect"],               "Effect alanı temizlendi.")
		mag.log_view(log["margin_left"],          "Margin Left alanı temizlendi.")
		mag.log_view(log["margin_right"],         "Margin Right alanı temizlendi.")
		mag.log_view(log["margin_vertical"],      "Margin Vertical alanı temizlendi.")
		mag.log_view(log["text_tag"],             "Etiketler temizlendi.")
		mag.log_view(log["text_special"],         "Özel karakterler temizlendi.")
		mag.log_view(log["text_comment"],         "Yorum parantezleri temizlendi.")
		mag.log_view(log["text_double_space"],    "Tekrar eden boşluklar temizlendi.")
		mag.log_view(log["text_space_trim"],      "Baştaki ve sondaki boşluklar temizlendi.")
		mag.log_view(log["empty_line"],           "Boş satırlar temizlendi.")
		mag.log_view(log["comment_line"],         "Yorum satırları temizlendi.")
		mag.log_view(log["one_line"],             "Sıralı satırlar bütünlendi.")
		mag.log_view(log["line_break_space"],     "Satır bölme boşlukları temizlendi.")
		mag.log_view(log["turkish_char"],         "Türkçe karakterler düzeltildi.")
		mag.log_view(log["fix_timing"],           "Satırlar kare sürelerine göre zamanlandı.")
		mag.log_view(log["delete_fx"],            "Oluşturulan karaoke satırları silindi.")
		mag.log_view(log["furigana_style"],       "Furigana stilleri silindi.")
		mag.log_view(log["strip_template_apply"], "Karaoke satırları sıfırlandı.")
		mag.log_view(log["reset_template"],       "Şablon satırlarının süreleri sıfırlandı.")
		end
	end

	function add_macro(subs,sel)
	mag.get_config(c)
	local apply_items = mag.apply_items(subs,sel,"comment","")
	c.apply           = mag.search_apply_items(apply_items,c.apply)
	local gui         = {}
	local ok, config, butts
	repeat
		if c.button == c_buttons[3] then
		butts   = {c_buttons[1],c_buttons[2],c_buttons[4]}
		gui     =
		{
		 {class = "checkbox", name = "u_line_property",        value = c.line_property,        x = 0, y = 0,  width = 3, height = 1, label = "[Satır Özellikleri]",                    hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
		,{class = "label",                                                                     x = 0, y = 1,  width = 1, height = 1, label = mag.wall(" ",5)}
		,{class = "checkbox", name = "u_layer",                value = c.layer,                x = 1, y = 1,  width = 2, height = 1, label = "Layer"}
		,{class = "checkbox", name = "u_actor",                value = c.actor,                x = 1, y = 2,  width = 2, height = 1, label = "Actor"}
		,{class = "checkbox", name = "u_effect",               value = c.effect,               x = 1, y = 3,  width = 2, height = 1, label = "Effect"}
		,{class = "checkbox", name = "u_left_margin",          value = c.left_margin,          x = 1, y = 4,  width = 2, height = 1, label = "Left Margin"}
		,{class = "checkbox", name = "u_right_margin",         value = c.right_margin,         x = 1, y = 5,  width = 2, height = 1, label = "Right Margin"}
		,{class = "checkbox", name = "u_vertical_margin",      value = c.vertical_margin,      x = 1, y = 6,  width = 2, height = 1, label = "Vertical Margin"}
		,{class = "checkbox", name = "u_text",                 value = c.text,                 x = 1, y = 7,  width = 2, height = 1, label = "Text",                                   hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
		,{class = "label",                                                                     x = 1, y = 8,  width = 1, height = 1, label = mag.wall(" ",5)}
		,{class = "checkbox", name = "u_text_tag",             value = c.text_tag,             x = 2, y = 8,  width = 1, height = 1, label = "Etiketler"}
		,{class = "checkbox", name = "u_text_special",         value = c.text_special,         x = 2, y = 9,  width = 1, height = 1, label = "Özel karakterler",                       hint = "\\N, \\n, \\h"}
		,{class = "checkbox", name = "u_text_comment",         value = c.text_comment,         x = 2, y = 10, width = 1, height = 1, label = "Yorum parantezleri"}
		,{class = "checkbox", name = "u_text_double_space",    value = c.text_double_space,    x = 2, y = 11, width = 1, height = 1, label = "Tekrar eden boşluklar"}
		,{class = "checkbox", name = "u_text_space_trim",      value = c.text_space_trim,      x = 2, y = 12, width = 1, height = 1, label = "Baştaki ve sondaki boşluklar"}
		,{class = "label",                                                                     x = 0, y = 13, width = 8, height = 1, label = "[Uygulanacak Satırlar]"}
		,{class = "dropdown", name = "u_apply_lines",          value = c.apply,                x = 0, y = 14, width = 8, height = 1, items = apply_items,                              hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
		,{class = "checkbox", name = "u_comment_lines",        value = c.comment_lines,        x = 0, y = 15, width = 8, height = 1, label = "Yorum satırlarını geç."}
		,{class = "checkbox", name = "u_log_view",             value = c.log_view,             x = 0, y = 16, width = 8, height = 1, label = "Olay kaydını göster."}
		}
		elseif c.button == c_buttons[2] then
		butts   = {c_buttons[1],c_buttons[3],c_buttons[4]}
		gui     =
		{
	 	 {class = "checkbox", name = "u_line_property",        value = c.line_property,        x = 0, y = 0,  width = 3, height = 1, label = "[Satır Özellikleri]",                    hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
		,{class = "label",                                                                     x = 0, y = 1,  width = 1, height = 1, label = mag.wall(" ",5)}
		,{class = "checkbox", name = "u_layer",                value = c.layer,                x = 1, y = 1,  width = 2, height = 1, label = "Layer"}
		,{class = "checkbox", name = "u_actor",                value = c.actor,                x = 1, y = 2,  width = 2, height = 1, label = "Actor"}
		,{class = "checkbox", name = "u_effect",               value = c.effect,               x = 1, y = 3,  width = 2, height = 1, label = "Effect"}
		,{class = "checkbox", name = "u_left_margin",          value = c.left_margin,          x = 1, y = 4,  width = 2, height = 1, label = "Left Margin"}
		,{class = "checkbox", name = "u_right_margin",         value = c.right_margin,         x = 1, y = 5,  width = 2, height = 1, label = "Right Margin"}
		,{class = "checkbox", name = "u_vertical_margin",      value = c.vertical_margin,      x = 1, y = 6,  width = 2, height = 1, label = "Vertical Margin"}
		,{class = "checkbox", name = "u_text",                 value = c.text,                 x = 1, y = 7,  width = 2, height = 1, label = "Text",                                   hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
		,{class = "label",                                                                     x = 1, y = 8,  width = 1, height = 1, label = mag.wall(" ",5)}
		,{class = "checkbox", name = "u_text_tag",             value = c.text_tag,             x = 2, y = 8,  width = 1, height = 1, label = "Etiketler"}
		,{class = "checkbox", name = "u_text_special",         value = c.text_special,         x = 2, y = 9,  width = 1, height = 1, label = "Özel karakterler",                       hint = "\\N, \\n, \\h"}
		,{class = "checkbox", name = "u_text_comment",         value = c.text_comment,         x = 2, y = 10, width = 1, height = 1, label = "Yorum parantezleri"}
		,{class = "checkbox", name = "u_text_double_space",    value = c.text_double_space,    x = 2, y = 11, width = 1, height = 1, label = "Tekrar eden boşluklar"}
		,{class = "checkbox", name = "u_text_space_trim",      value = c.text_space_trim,      x = 2, y = 12, width = 1, height = 1, label = "Baştaki ve sondaki boşluklar"}
		,{class = "label",                                                                     x = 0, y = 13, width = 8, height = 1, label = "[Uygulanacak Satırlar]"}
		,{class = "dropdown", name = "u_apply_lines",          value = c.apply,                x = 0, y = 14, width = 8, height = 1, items = apply_items,                              hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
		,{class = "checkbox", name = "u_comment_lines",        value = c.comment_lines,        x = 0, y = 15, width = 8, height = 1, label = "Yorum satırlarını geç."}
		,{class = "checkbox", name = "u_log_view",             value = c.log_view,             x = 0, y = 16, width = 8, height = 1, label = "Olay kaydını göster."}
		,{class = "checkbox", name = "u_extra_options",        value = c.extra_options,        x = 3, y = 0,  width = 3, height = 1, label = "[Ekstra Ayarlar]",                       hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
		,{class = "label",                                                                     x = 3, y = 1,  width = 1, height = 1, label = mag.wall(" ",5)}
		,{class = "checkbox", name = "u_empty_text",           value = c.empty_text,           x = 4, y = 1,  width = 1, height = 1, label = "Boş satırları temizle."}
		,{class = "checkbox", name = "u_comment_line",         value = c.comment_line,         x = 4, y = 2,  width = 1, height = 1, label = "Yorum satırlarını temizle."}
		,{class = "checkbox", name = "u_one_line",             value = c.one_line,             x = 4, y = 3,  width = 1, height = 1, label = "Sıralı satırları bütünle.",              hint = "Aynı içeriğe sahip ve alt alta sıralanmış satırları bütünler."}
		,{class = "checkbox", name = "u_line_break_space",     value = c.line_break_space,     x = 4, y = 4,  width = 1, height = 1, label = "Satır bölme boşluklarını temizle.",      hint = "Satır bölme karakterinin sağ ve sol tarafındaki boşlukları temizler."}
		,{class = "checkbox", name = "u_turkish_char",         value = c.turkish_char,         x = 4, y = 5,  width = 1, height = 1, label = "Türkçe karakterleri düzelt."}
		,{class = "checkbox", name = "u_fix_timing",           value = c.fix_timing,           x = 4, y = 6,  width = 1, height = 1, label = "Satırları kare sürelerine göre zamanla."}
		,{class = "checkbox", name = "u_karaoke_options",      value = c.karaoke_options,      x = 3, y = 7,  width = 3, height = 1, label = "[Karaoke]",                              hint = "Aşağıdaki ayarların hepsini seçmek için bu satırın başındaki kutucuğu işaretleyin."}
		,{class = "checkbox", name = "u_delete_fx",            value = c.delete_fx,            x = 4, y = 8,  width = 1, height = 1, label = "Oluşturulan karaoke satırlarını temizle."}
		,{class = "checkbox", name = "u_furigana_style",       value = c.furigana_style,       x = 4, y = 9,  width = 1, height = 1, label = "Furigana stillerini temizle."}
		,{class = "checkbox", name = "u_strip_template_apply", value = c.strip_template_apply, x = 4, y = 10, width = 1, height = 1, label = "Karaoke satırlarını sıfırla."}
		,{class = "checkbox", name = "u_reset_template",       value = c.reset_template,       x = 4, y = 11, width = 1, height = 1, label = "Şablon satırlarının sürelerini sıfırla."}
		}
		end
	ok, config = mag.dlg(gui,butts)
	if ok == mag.ascii(c_buttons[2]) then c.button = c_buttons[2] end
	if ok == mag.ascii(c_buttons[3]) then c.button = c_buttons[3] end
	c.line_property        = config.u_line_property
	c.layer                = config.u_layer
	c.actor                = config.u_actor
	c.effect               = config.u_effect
	c.left_margin          = config.u_left_margin
	c.right_margin         = config.u_right_margin
	c.vertical_margin      = config.u_vertical_margin
	c.text                 = config.u_text
	c.text_tag             = config.u_text_tag
	c.text_special         = config.u_text_special
	c.text_comment         = config.u_text_comment
	c.text_double_space    = config.u_text_double_space
	c.text_space_trim      = config.u_text_space_trim
		if c.button == c_buttons[2] then
		c.extra_options        = config.u_extra_options
		c.empty_text           = config.u_empty_text
		c.comment_line         = config.u_comment_line
		c.one_line             = config.u_one_line
		c.line_break_space     = config.u_line_break_space
		c.turkish_char         = config.u_turkish_char
		c.fix_timing           = config.u_fix_timing
		c.karaoke_options      = config.u_karaoke_options
		c.delete_fx            = config.u_delete_fx
		c.furigana_style       = config.u_furigana_style
		c.strip_template_apply = config.u_strip_template_apply
		c.reset_template       = config.u_reset_template
		end
	c.apply                = config.u_apply_lines
	c.comment_lines        = config.u_comment_lines
	c.log_view             = config.u_log_view
	until ok == c_buttons[4] or c.apply ~= "Seç" and ok == c_buttons[1]
	if ok == c_buttons[1] then
		if	not c.line_property
		and not c.layer
		and not c.actor
		and not c.effect
		and not c.left_margin
		and not c.right_margin
		and not c.vertical_margin
		and not c.text
		and not c.text_tag
		and not c.text_special
		and not c.text_comment
		and not c.text_double_space
		and not c.text_space_trim
		and not c.extra_options
		and not c.empty_text
		and not c.comment_line
		and not c.one_line
		and not c.line_break_space
		and not c.turkish_char
		and not c.fix_timing
		and not c.karaoke_options
		and not c.delete_fx
		and not c.furigana_style
		and not c.strip_template_apply
		and not c.reset_template
		then
		mag.log(2,"Hiçbir tercih yapmadınız.")
		else
		strip_line(subs,sel,config)
		mag.undo_point()
		end
	end
	mag.set_config(c)
	end

	function check_macro(subs,sel)
	local fe, fee = pcall(add_macro,subs,sel)
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
			end
		end
		if mag_version_check then
		mag.register(false,check_macro)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end