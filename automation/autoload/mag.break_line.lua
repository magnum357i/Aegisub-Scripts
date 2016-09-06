	script_name        = "Break Line"
	script_description = "Satırlara bölme karakteri ekleyebilir, bunları silebilir veya satırın karakter sayısını kontrol edebilir."
	script_author      = "Magnum357"
	script_version     = "1.2.2"
	script_mag_version = "1.1.1.9"

	mag_import, mag = pcall(require,"mag")

	function line_breaker(subs,sel,config)
	local pcs        = false
	local style_name = mag.unstyles(config.u_style_name)
	local max_char   = config.u_max_char
	for i = 1, #subs do
	local line = subs[i]
		if line.class == "dialogue" then
		local style1, style2 = line.style, style_name
		if style_name == "Tüm stiller" then style1, style2 = 1, 1 end
		local comment1, comment2 = line.comment, false
		if not config.u_comment_line then comment1, comment2 = 1, 1 end
			if style1 == style2 and comment1 == comment2 then
			local text_len = len(line.text)
				if not mag.match(line.text,"\\N") and config.u_talking or not mag.match(line.text,"\\N") and config.u_sentence then
				local w, word      = mag.words(line.text)
				local tt           = ""
					if config.u_talking then
					local talk = mag.ccount(mag.full_strip(line.text),"%-%s[A-Za-zöÖüÜçÇşŞıİ]","")
						if talk == 2 then
						pcs                = true
						local talk_counter = 0
							for k = 1, w do
							if mag.match(mag.full_strip(word[k]),"%-%s") then talk_counter = talk_counter + 1 end
							if talk_counter == 2 then tt = tt.."\\N" talk_counter = 0 end
							tt = tt..word[k]
							end
						line.text = tt
						end
						if talk == 1 then
						pcs = true
							for k = 1, w do
							if mag.match(mag.full_strip(word[k]),"%-%s") then tt = tt.."\\N" end
							tt = tt..word[k]
							end
						line.text = tt
						end
					end
					if config.u_sentence and not mag.match(line.text,"\\N") and len(line.text) <= max_char and len(line.text) > max_char / 2 then
					local sent = mag.ccount(mag.full_strip(line.text).." A","[%.%!%?]%s[A-ZÖÜÇŞİ]","")
						if sent == 2 then
						pcs                = true
						local sent_counter = 0
							for k = 1, w do
							tt = tt..word[k]
								if mag.match(mag.full_strip(word[k]),"[%.%!%?]%s") and sent_counter == 0 then
								tt = tt.."\\N"
								sent_counter = sent_counter + 1
								end
							end
						line.text = tt
						end
					end
				end
				if not mag.match(line.text,"\\N") and mag.match(line.text," ") and max_char <= text_len then
				pcs                 = true
				local text_half_len = mag.floor(len(line.text) / 2)
				local w, word       = mag.words(line.text)
				local cc            = 0
				local ptext         = ""
				local ntext         = ""
				local kp            = 0
					if not config.u_balance then
						for k = 1, w do
						cc = cc + len(word[k])
							if cc <= text_half_len then
							ptext = ptext..word[k]
							kp    = k
							else
							ntext = ntext..word[k]
							end
						end
						if len(ntext) - len(ptext) >= 10 then
						ptext = ""
						ntext = ""
							for t = 1, w do
								if t <= kp + 1 then
								ptext = ptext..word[t]
								else
								ntext = ntext..word[t]
								end
							end
						end
					else
					local last_diff = {}
						repeat
						ptext = ""
						ntext = ""
						kp = kp + 1
							for k = 1, w do
								if k <= kp then
								ptext = ptext..word[k]
								else
								ntext = ntext..word[k]
								end
							end
						table.insert(last_diff,mag.positive(len(ntext) - len(ptext)))
						if w == kp then break end
						until false
					local ldiff
						for j = 1, table.getn(last_diff) - 1 do
							if last_diff[j] < last_diff[j + 1] then
							ldiff = j
							break
							end
						end
					ptext = ""
					ntext = ""
						for g = 1, w do
							if g <= ldiff then
							ptext = ptext..word[g]
							else
							ntext = ntext..word[g]
							end
						end
					end
				line.text = ptext.."\\N"..ntext
				end
					if mag.match(line.text,"%s+\\N") and config.u_break_space  then
					pcs = true
					line.text = mag.gsub(line.text,"%s+(\\N)","%1")
					end
					if pcs then
					subs[i] = line
					end
			end
		end
	end
	if not pcs then mag.log(2,"Hiçbir işlem yapılmadı.") end
	end

	function remove_breaker(str)
	local function strip(text,special)
	text = mag.gsub(text,"%s"..special," ")
	text = mag.gsub(text,special.."%s"," ")
	text = mag.gsub(text,special," ")
	return text
	end
	str = strip(str,"\\N")
	return str
	end

	function len(str) return mag.len(mag.removedot(mag.full_strip(str))) end

	function text_len(text)
	text = mag.full_strip(text)
	text = mag.removedot(text)
	text = mag.gsub(text," +","")
	return text, mag.len(text)
	end

	function strip_len(text)
	text = remove_special(text)
	text = mag.strip(text)
	text = mag.removedot(text)
	text = mag.gsub(text," +","")
	text = mag.len(text)
	return text
	end

	function remove_special(text) return mag.gsub(text,"\\[nNh]","") end

	c_max_char     = 44
	c_style_name   = "Tüm stiller" 
	c_comment_line = true
	c_talking      = true
	c_break_space  = true
	c_balance      = false
	c_sentence     = false

	function remove_line_breaker_gui(subs)
	local gui =
	{{class = "label",                                                                         x = 0, y = 0, width = 1, height = 1, label = "Karakter sınırı:"}
	,{class = "intedit",  name = "u_max_char",     value = c_max_char,     min = 35, max = 50, x = 1, y = 0, width = 1, height = 1}
	,{class = "label",                                                                         x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",18).."Stil:"}
	,{class = "dropdown", name = "u_style_name",   value = c_style_name,                       x = 1, y = 1, width = 1, height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_line", value = c_comment_line,                     x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."}
	}
	mag.styles_insert(subs,gui,4,"comment","")
	local ok, config = mag.dlg(gui,{"Kaldır","Kapat"})
	if ok == mag.ascii("Kaldır") then
	if config.u_style_name == "" then config.u_style_name = "Tüm stiller" end
	c_max_char     = config.u_max_char
	c_style_name   = config.u_style_name
	c_comment_line = config.u_comment_line
	remove_line_breaker(subs,sel,config)
	aegisub.set_undo_point(script_name)
	end
	end

	function line_breaker_check_gui(subs)
	local gui =
	{{class = "label",                                                                         x = 0, y = 0, width = 1, height = 1, label = "Karakter sınırı:"}
	,{class = "intedit",  name = "u_max_char",     value = c_max_char,     min = 35, max = 50, x = 1, y = 0, width = 1, height = 1}
	,{class = "label",                                                                         x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",18).."Stil:"}
	,{class = "dropdown", name = "u_style_name",   value = c_style_name,                       x = 1, y = 1, width = 1, height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_line", value = c_comment_line,                     x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."}
	}
	mag.styles_insert(subs,gui,4,"comment","")
	local ok, config = mag.dlg(gui,{"Kontrol et","Kapat"})
	if ok == "Kontrol et" then
	if config.u_style_name == "" then config.u_style_name = "Tüm stiller" end
	c_max_char     = config.u_max_char
	c_style_name   = config.u_style_name
	c_comment_line = config.u_comment_line
	line_breaker_check(subs,sel,config)
	aegisub.set_undo_point(script_name)
	end
	end

	function line_breaker_gui(subs)
	local gui =
	{{class = "label",                                                                         x = 0, y = 0, width = 1, height = 1, label = "Karakter sınırı:"}
	,{class = "intedit",  name = "u_max_char",     value = c_max_char,     min = 35, max = 50, x = 1, y = 0, width = 1, height = 1, hint = "Bu değer sadece sembolüktür. \\N karakterinin koyulması için yapılan hesaplamaya bir etkisi yoktur. \\N koyulacak satırları tespit etmeye etkisi vardır."}
	,{class = "label",                                                                         x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",18).."Stil:"}
	,{class = "dropdown", name = "u_style_name",   value = c_style_name,                       x = 1, y = 1, width = 1, height = 1, items = {"Tüm stiller"}, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_line", value = c_comment_line,                     x = 1, y = 2, width = 1, height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_talking",      value = c_talking,                          x = 1, y = 3, width = 1, height = 1, label = "Konuşma çizgilerini çizgiden böl.", hint = "Karakter sınırının altında veya üstünde olan ikili veya tekli konuşma satırlarını konuşma çizgisinden böler."}
	,{class = "checkbox", name = "u_break_space",  value = c_break_space,                      x = 1, y = 4, width = 1, height = 1, label = "Boşlukları sil.", hint = "Karakter sınırı alanından bağımsız olarak satır bölme karakterinin yanındaki boşluk alanı siler."}
	,{class = "checkbox", name = "u_balance",      value = c_balance,                          x = 1, y = 5, width = 1, height = 1, label = "Dengeli böl."}
	,{class = "checkbox", name = "u_sentence",     value = c_sentence,                         x = 1, y = 6, width = 1, height = 1, label = "İki cümleli satırların ikinci cümlesinden böl.", hint = "Karakter sınırına girilen değerin yarısıyle onun altında kalan karakter sayısına sahip iki cümleli satırların ikinci cümlesinden böler."}
	}
	mag.styles_insert(subs,gui,4,"comment","")
	local ok, config = mag.dlg(gui,{"Böl","Kapat"})
	if ok == mag.ascii("Böl") then
	if config.u_style_name == "" then config.u_style_name = "Tüm stiller" end
	c_max_char     = config.u_max_char
	c_style_name   = config.u_style_name
	c_comment_line = config.u_comment_line
	c_talking      = config.u_talking
	c_break_space  = config.u_break_space
	c_balance      = config.u_balance
	c_sentence     = config.u_sentence
	line_breaker(subs,sel,config)
	aegisub.set_undo_point(script_name)
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
		mag.register(false,line_breaker_gui)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end