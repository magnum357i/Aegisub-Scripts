	mag_module_name    = "Mag"
	mag_module_version = "1.1.4.4"
	mag_module_author  = "Magnum357"

	if include_unicode   == true then unicode   = require 'aegisub.unicode'   end
	if include_clipboard == true then clipboard = require 'aegisub.clipboard' end
	if include_karaskel  == true then include("karaskel.lua")                 end

	local mag                 = {}
	mag.pattern               = {}
	mag.strip                 = {}
	mag.list                  = {}
	mag.is                    = {}
	mag.trim                  = {}
	mag.config                = {}
	mag.config.file           = {}
	mag.directory             = {}
	mag.index                 = {}
	mag.show                  = {}
	mag.limit                 = {}
	mag.string                = {}
	mag.convert               = {}
	mag.line                  = {}
	mag.sort                  = {}
	mag.window                = {}
	mag.window.lang           = {}
	mag.array                 = {}
	mag.clip                  = {}

	mag.default_lang          = "en"
	mag.lang                  = mag.default_lang

	mag.pattern.punc          = "%p"
	mag.pattern.uppercase     = "%uÇŞİÖÜĞÂÎÔÛ"
	mag.pattern.lowercase     = "%lçşıöüğâîôû"
	mag.pattern.letter        = mag.pattern.uppercase..mag.pattern.lowercase
	mag.pattern.number        = "%d"

	if include_clipboard == true then
	mag.clip.get              = clipboard.get
	mag.clip.set              = clipboard.set
	end
	mag.s                     = tostring
	mag.n                     = tonumber
	mag.floor                 = math.floor
	mag.ceil                  = math.ceil
	mag.rand                  = math.random
	mag.char                  = string.char
	mag.find                  = string.find
	mag.format                = string.format
	mag.gmatch                = string.gmatch
	mag.gsub                  = string.gsub
	mag.rep                   = string.rep
	mag.reverse               = string.reverse
	mag.match                 = string.match
	mag.sub                   = string.sub
	if include_unicode == true then
	mag.convert.up            = unicode.to_upper_case
	mag.convert.low           = unicode.to_lower_case
	mag.convert.len           = unicode.len
	mag.convert.chars         = unicode.chars
	end
	mag.convert.ms_from_frame = aegisub.ms_from_frame
	mag.convert.frame_from_ms = aegisub.frame_from_ms
	mag.sort.basic            = table.sort
	mag.array.concat          = table.concat
	mag.array.remove          = table.remove
	mag.array.insert          = table.insert
	mag.window.macro          = aegisub.register_macro

	--ok, config = mag.window.dialog(gui_array, {"OK", "Cancel"})
	function mag.window.dialog(var,buttons)
	local ok, config
	for i = 1, #buttons do buttons[i] = mag.convert.ascii(buttons[i]) end
	ok, config = aegisub.dialog.display(var, buttons)
	return ok, config
	end

	--mag.window.register(script_name, add_macro)
	--mag.window.register(script_name, add_macro, false)
	function mag.window.register(name,macro,visible)
	if visible == nil then
	visible = true
	end
	if visible == true then
		if name == false then
		name = script_name
		end
	mag.window.macro(name, script_desription, macro)
	end
	end

	--mag.window.undo_point()
	function mag.window.undo_point() aegisub.set_undo_point("\""..script_name.."\"") end

	--mag.window.funce(fe, fee)
	function mag.window.funce(fe,fee)
	if not fe then
	local err = mag.gsub(fee, "%[.-%]:", "")
	mag.show.log(1, mag.string.format(mag.window.lang.message("code_error"), mag.match(err, "(%d+)%:"), mag.match(err, "%:%s(.+)")))
	end
	end

	--mag.window.progress(i, #lines_index)
	function mag.window.progress(i,max)
	aegisub.progress.set(mag.convert.percent(max, i, true, "percent"))
	end

	--mag.window.progress2("Process...", i, #lines_index)
	function mag.window.progress2(str,i,max)
	aegisub.progress.task(mag.format("(%s/%s) %s", max, i, str))
	aegisub.progress.set(mag.convert.percent(max, i, true, "percent"))
	aegisub.progress.title(mag.format("%s %s%%", script_name, mag.convert.percent(max, i, true, "percent")))
	end

	--mag.lang = "en"
	--mag.window.lang.message("select")
	function mag.window.lang.message(name)
	local allow        = false
	lang_allow_check   = false
	local allowed_lang = {"tr", "eng"}
	if not lang_allow_check then
	lang_allow_check = true
	for i = 1, #allowed_lang do if allowed_lang[i] == mag.lang then allow = true end end
	end
	if not allow then mag.lang = mag.default_lang end
	local out
	if name == "log_mOk" then
		if mag.lang == "tr" then out = "YAPILDI" end
		if mag.lang == "en" then out = "DONE" end
	end
	if name == "log_mError" then
		if mag.lang == "tr" then out = "BAŞARISIZ" end
		if mag.lang == "en" then out = "FAIL" end
	end
	if name == "guilabel1" then
		if mag.lang == "tr" then out = "Tüm kullanılabilir diller:" end
		if mag.lang == "en" then out = "All available languages:" end
	end
	if name == "guilabel2" then
		if mag.lang == "tr" then out = "Dilinizi değiştirdikten sonra tercihleriniz sıfırlanacaktır." end
		if mag.lang == "en" then out = "Your options will be reset after you changed your language." end
	end
	if name == "guilabel3" then
		if mag.lang == "tr" then out = "Şu an kullandığınız dil: " end
		if mag.lang == "en" then out = "The language you are currently using: " end
	end
	if name == "changebutton" then
		if mag.lang == "tr" then out = "Değiştir" end
		if mag.lang == "en" then out = "Change" end
	end
	if name == "closebutton" then
		if mag.lang == "tr" then out = "Kapat" end
		if mag.lang == "en" then out = "Close" end
	end
	if name == "style_hint1" then
		if mag.lang == "tr" then out = "Sadece kullanılan stiller listelenir. Parantez içindeki sayılar açıklama satırı yapılmamış ve yapılmış satırların sayısıdır." end
		if mag.lang == "en" then out = "Used styles are listed only. The numbers in parentheses are the number of uncomment and comment lines." end
	end
	if name == "style_hint2" then
		if mag.lang == "tr" then out = "Sadece kullanılan stiller listelenir. Parantez içindeki sayı, toplam satır sayısıdır." end
		if mag.lang == "en" then out = "Used styles are listed only. The numbers in parentheses are the total number of lines." end
	end
	if name == "all_lines" then
		if mag.lang == "tr" then out = "Tüm satırlar" end
		if mag.lang == "en" then out = "All lines" end
	end
	if name == "selected_lines" then
		if mag.lang == "tr" then out = "Seçili satırlar" end
		if mag.lang == "en" then out = "Selected lines" end
	end
	if name == "select" then
		if mag.lang == "tr" then out = "Seç" end
		if mag.lang == "en" then out = "Select" end
	end
	if name == "apply" then
		if mag.lang == "tr" then out = "Uygulanacak satırlar:" end
		if mag.lang == "en" then out = "Apply to:" end
	end
	if name == "apply2" then
		if mag.lang == "tr" then out = "Uygulanacak satırlar" end
		if mag.lang == "en" then out = "Apply to" end
	end
	if name == "comment_mode" then
		if mag.lang == "tr" then out = "Açıklama satırlarını atla" end
		if mag.lang == "en" then out = "Skip comment lines" end
	end
	if name == "empty_mode" then
		if mag.lang == "tr" then out = "Boş satırları atla" end
		if mag.lang == "en" then out = "Skip empty lines" end
	end
	if name == "log_error" then
		if mag.lang == "tr" then out = "HATA" end
		if mag.lang == "en" then out = "ERROR" end
	end
	if name == "log_warning" then
		if mag.lang == "tr" then out = "UYARI" end
		if mag.lang == "en" then out = "WARNING" end
	end
	if name == "log_note" then
		if mag.lang == "tr" then out = "NOT" end
		if mag.lang == "en" then out = "NOTE" end
	end
	if name == "no_file" then
		if mag.lang == "tr" then out = "Belirtilen dosya bulunamadı." end
		if mag.lang == "en" then out = "The specified file not found." end
	end
	if name == "is_video" then
		if mag.lang == "tr" then out = "Aegisub üzerinde sahte veya gerçek bir video açmadan yapmaya çalıştığınız işlemi yapamazsınız." end
		if mag.lang == "en" then out = "You can not do the action you tried to do without opening a fake or real video on Aegisub." end
	end
	if name == "error" then
		if mag.lang == "tr" then out = "Bir hata çıktı." end
		if mag.lang == "en" then out = "There was an error." end
	end
	if name == "code_error" then
		if mag.lang == "tr" then out = "{%1}. satırda bir hata çıktı: \"{%2}\"\n\nKullanmaya çalıştığınız lua eklentisinin ve mag modülünün son sürümünü indirdiğinize emin olun." end
		if mag.lang == "en" then out = "There is an error on line {%1}: \"{%2}\"\n\nMake sure you download the latest version of the lua plugin and the mag module you are trying to use." end
	end
	if name == "no_process" then
		if mag.lang == "tr" then out = "Hiçbir işlem yapılmadı. Ya geçersiz bir işlem yaptınız ya da tercihlerinize göre yapılacak bir şey yoktu." end
		if mag.lang == "en" then out = "Nothing was done. Either you did something invalid or there was nothing to do with your preferences." end
	end
	if name == "no_process2" then
		if mag.lang == "tr" then out = "Hiçbir işlem yapılmadı. Çünkü efekt kutularında şu girdi(ler) bulunamadı:\n{%s}" end
		if mag.lang == "en" then out = "Nothing was done. Because the following entry(s) not found in the effect boxes:\n{%s}" end
	end
	if name == "select_save_place" then
		if mag.lang == "tr" then out = "Kaydedilecek yeri seçin" end
		if mag.lang == "en" then out = "Select the place to save" end
	end
	if name == "text_file_type" then
		if mag.lang == "tr" then out = "Metin dosyası (*.txt)|*.txt" end
		if mag.lang == "en" then out = "Text file (*.txt)|*.txt" end
	end
	if name == "error_config_file_write" then
		if mag.lang == "tr" then out = "Ayar dosyası oluşturulamadı." end
		if mag.lang == "en" then out = "Config file not create." end
	end
	if name == "error_open_file" then
		if mag.lang == "tr" then out = "Dosya açma işlemi başarısız oldu." end
		if mag.lang == "en" then out = "File failed to open." end
	end
	if name == "error_write_file" then
		if mag.lang == "tr" then out = "Dosya yazma işlemi başarısız oldu." end
		if mag.lang == "en" then out = "File failed to write." end
	end
	if name == "restart_aegisub" then
		if mag.lang == "tr" then out = "Değişiklikleri görmek için Aegisub programını tekrar açın veya \"Automation / Automation... / Rescan Automation Dir\" butonuna basın." end
		if mag.lang == "en" then out = "To see the changes, reopen the Aegisub software or press the \"Automation / Automation... / Rescan Automation Dir\" button." end
	end
	if name == "lang_tabname" then
		if mag.lang == "tr" then out = "Dil Değiştir" end
		if mag.lang == "en" then out = "Change Language" end
	end
	if name == "gui_tabname" then
		if mag.lang == "tr" then out = "Pencere" end
		if mag.lang == "en" then out = "Window" end
	end
	if name == "mark_all" then
		if mag.lang == "tr" then out = "Aşağıdaki tercihlerin hepsini uygulamak için bu kutuyu işaretleyin." end
		if mag.lang == "en" then out = "Mark this box to apply all the options below." end
	end
	if name == "new_script_name" then
		if mag.lang == "tr" then out = "Bundan sonra bu lua eklentisini Automation alt menüsünde yeni ismiyle göreceksiniz:\n\"{%s}\"" end
		if mag.lang == "en" then out = "From now on you will see this lua extension with a new name on the automation submenu:\n\"{%s}\"" end
	end
	if name == "report_mheader" then
		if mag.lang == "tr" then out = "[Tercih: \"{%s}\"]" end
		if mag.lang == "en" then out = "[Preference: \"{%s}\"]" end
	end
	if name == "report_mheader2" then
		if mag.lang == "tr" then out = "[Tercih: \"{%1}\", Değer: \"{%2}\"]" end
		if mag.lang == "en" then out = "[Preference: \"{%1}\", Value: \"{%2}\"]" end
	end
	if name == "report_msuccess" then
		if mag.lang == "tr" then out = "{%s} satır" end
		if mag.lang == "en" then out = "{%s:# [line][lines]}" end
	end
	if name == "report_mfail" then
		if mag.lang == "tr" then out = "Yapılacak bir şey yoktu." end
		if mag.lang == "en" then out = "There was nothing to do." end
	end
	return out
	end

	--c = {c_lang_switch = "tr"}
	--mag.window.lang.gui({tr = "Türkçe", en = "English"})
	function mag.window.lang.gui(lang_list)
	local is_config_file = false
	if c ~= nil then is_config_file = true end
	if is_config_file then mag.config.get(c) end
	local lang_gui = {
	selected_lang  = {class = "label",                      x = 0, y = 0,  width = 2, height = 1},
	label1         = {class = "label",                      x = 0, y = 2,  width = 1, height = 1, label = mag.window.lang.message("guilabel1")},
	lang_list      = {class = "dropdown", name = "u_langs", x = 1, y = 2,  width = 1, height = 1},
	label2         = {class = "label",                      x = 0, y = 3,  width = 2, height = 1, label = mag.window.lang.message("guilabel2")}
	}
	if not is_config_file then lang_gui.label2 = nil end
	local ok, config
	local buttons     = {mag.window.lang.message("changebutton"), mag.window.lang.message("closebutton")}
	local all_lang    = lang_list
	local select_lang = ""
	local langs       = {mag.window.lang.message("select")}
		for key, lang_name in pairs(all_lang) do
			if key ~= c_lang_switch then
			mag.array.insert(langs, lang_name)
			else
			select_lang = lang_name
			end
		end
	lang_gui.selected_lang.label = mag.window.lang.message("guilabel3")..select_lang
	lang_gui.lang_list.items     = langs
	lang_gui.lang_list.value     = mag.window.lang.message("select")
	repeat
	ok, config = mag.window.dialog(lang_gui, buttons)
	until ok == mag.convert.ascii(buttons[1]) and config.u_langs ~= mag.window.lang.message("select") or ok == mag.convert.ascii(buttons[2])
	if ok == mag.convert.ascii(buttons[1]) then
	local set_lang = ""
		for key, lang_name in pairs(all_lang) do
			if lang_name == config.u_langs then
			set_lang = key
			end
		end
	local file
	file = io.open(mag.directory.automation..script_file_name..script_file_ext)
		if file then
		local in_lang = lang_switch_keys(set_lang)
		local lua_content = file:read("*all")
		file = io.open(mag.directory.automation..script_file_name..script_file_ext, "w")
			if file then
			c_lock_gui  = true
			mag.lang    = set_lang
			lua_content = mag.gsub(lua_content, "(c_lang_switch%s-=%s-\").-(\")", "%1"..set_lang.."%2")
			file:write(lua_content)
				if is_config_file then
				c = {}
				end
			mag.show.log(2, mag.window.lang.message("restart_aegisub"))
			local new_script_name = c_sub_name_list ~= nil and c_sub_name_list[set_lang] or c_script_name_list[set_lang]
			mag.show.log(3, mag.string.format(mag.window.lang.message("new_script_name"), new_script_name))
			else
			mag.show.log(1, mag.window.lang.message("error_write_file"))
			end
		io.close(file)
		else
		mag.show.log(1, mag.window.lang.message("error_open_file"))
		end
	end
	if is_config_file then mag.config.set(c) end
	end

	--c_lock_gui  = true
	--c_lang_list = {tr = "Türkçe", en = "English"}
	--mag.window.lang.register()
	function mag.window.lang.register(submenu)
	local function gui()
		if c_lock_gui then
		mag.show.log(1, mag.window.lang.message("restart_aegisub"))
		else
		local fe, fee = pcall(mag.window.lang.gui, c_lang_list)
		mag.window.funce(fe, fee)
		end
	end
	local sub = submenu ~= nil and submenu.."/"..mag.window.lang.message("lang_tabname") or script_name.."/"..mag.window.lang.message("lang_tabname")
	mag.window.register(sub, gui)
	end

	--wall = mag.string.wall("-", 10)
	function mag.string.wall(s,loop) return mag.rep(mag.s(s), loop) end

	--last_find = mag.string.last_find("Fusce scelerisque dignissim dolor a vehicula.", "vehicula")
	function mag.string.last_find(str,pattern)
	local result
	local len = mag.convert.len(str)
	for i = len, 1, -1 do
	result = mag.find(str, pattern, i)
		if result ~= nil then
		break
		end
	end
	return result
	end

	--str = mag.string.format("{%s} > {%s}", 100, 50)
	--str = mag.string.format("{%2} < {%1}", 100, 50)
	--str = mag.string.format("I think {%s:# [line][lines]} is better than {%s} line(s)", 100, 50)
	function mag.string.format(str,...)
	local args    = {...}
	local regular = true
	if mag.match(str, "%{%%1.*%}") then
	regular = false
	end
	local function replace(m,v)
	local match_var = mag.match(str, "%{%%"..m..".-%}")
	local value     = mag.s(v)
		if match_var and mag.match(match_var, "%{%%"..m.."%}") then
		str = mag.gsub(str, "%{%%"..m.."%}", value, 1)
		elseif match_var and mag.match(match_var, "%{%%"..m..":.-%[.-%]%[.-%].-%}") then
			str = mag.gsub(str, "%{%%"..m..":(.-)%[(.-)%]%[(.-)%](.-)%}",
			function (a,b,c,d)
			local r
				if mag.match(a, "#") then
					if mag.n(value) <= 1 then
					r = mag.gsub(a, "#", value, 1)..b
					else
					r = mag.gsub(a, "#", value, 1)..c
					end
				elseif mag.match(d, "#") or mag.match(d, "#") then
					if mag.n(value) <= 1 then
					r = b..mag.gsub(d, "#", value, 1)
					else
					r = c..mag.gsub(d, "#", value, 1)
					end
				else
					if mag.n(value) <= 1 then
					r = b
					else
					r = c
					end
				end
			return r
			end, 1)
		end
	end
	for i = #args, 1, -1 do
	local n = #args + 1 - i
		if regular then
		replace("s", args[n])
		else
		replace(n, args[n])
		end
	end
	return mag.s(str)
	end

	--string = mag.string.combine("example1", "example2", "{%s} -> {%s}")
	function mag.string.combine(prev_str,next_str,format)
	prev_str  = mag.s(prev_str)
	next_str  = mag.s(next_str)
	local str = next_str
	if prev_str ~= "" then str = mag.string.format(format, prev_str, next_str) end
	return str
	end

	--vars = mag.string.vars("log, dam, dem, mag, yum, qam")
	function mag.string.vars(str)
	local vars = {}
	if mag.find(mag.reverse(mag.strip.space(str)), ",") ~= 1 then str = str.."," end
	for s in mag.gmatch(str, "(.-),%s*") do mag.array.insert(vars, s) end
	return vars
	end

	--cc = mag.string.count("Ut eget pulvinar erat, eu eleifend lectus.", "e")
	function mag.string.count(str,regex) local _, count = mag.gsub(str, regex, "") return count end

	--words = mag.string.words("In in ligula vitae nulla dignissim suscipit et id lectus.")
	function mag.string.words(str)
	str              = str.." d "
	str              = mag.gsub(str, "(\\[nNh])", " %1")
	local words      = {}
	local w          = "" 
	local n          = 0
	local in_tags    = false
	local chars      = {}
	local in_special = {false, false}
	for c in mag.convert.chars(str) do mag.array.insert(chars, c) end
	for c in mag.convert.chars(str) do
	n = n + 1
	w = w..c
	if c == "{" then in_tags = true end
		if not in_tags then
			if in_special[1] and mag.match(c, "[nNh]") then in_special[2] = true else in_special[1], in_special[2] = false, false end
			if c == "\\" then in_special[1] = true end
				if not in_special[1] and not in_special[2] then
				if chars[n + 1] ~= nil then
					if mag.match(chars[n], "%S") and mag.match(chars[n + 1], "%s") then
					w = mag.gsub(w, " (\\[nNh])", "%1")
					mag.array.insert(words, w)
					w = ""
					end
				end
			end
		end
	if c == "}" then in_tags = false end
	end
	words[#words] = mag.sub(words[#words], 1, -3)
	return words
	end

	--split_string = mag.string.split(true, "Lorem ipsum dolor sit amet, consectetur, adipiscing elit. Proin posuere sed, libero ac, consectetur.", ",")
	function mag.string.split(last,str,split)
	local parts = {}
	if last == true then
	str = str..mag.match(str, split)
	end
	for part in mag.gmatch(str, ".-"..split) do
	part = mag.gsub(part, split, "")
	mag.array.insert(parts, part)
	end
	return parts
	end

	--strip_text = mag.strip.bracket("{\bord3}This is an {Holla!}example.")
	function mag.strip.bracket(str) return mag.gsub(str, "{[^}]+}", "") end

	--strip_text = mag.strip.special("This is an example.\\NThis is an example.",{true[N], true[n], true[h]}, " ")
	function mag.strip.special(str,replace_char,escape_special_Nnh)
	local function strip(text,special)
	text = mag.gsub(text, "%s"..special, replace_char)
	text = mag.gsub(text, special.."%s", replace_char)
	text = mag.gsub(text, special,       replace_char)
	return text
	end
	if escape_special_Nnh[1] == true then str = strip(str, "\\N") end
	if escape_special_Nnh[2] == true then str = strip(str, "\\n") end
	if escape_special_Nnh[3] == true then str = strip(str, "\\h") end
	return str
	end

	--strip_text = mag.strip.space("This is an example.")
	function mag.strip.space(str) return mag.gsub(str, "%s+", "") end

	--strip_text = mag.strip.double_space("This is an    example.")
	function mag.strip.double_space(str)
	local l          = ""
	local space      = 0
	local in_tag     = false
	local in_special = {false, false}
	for char in mag.convert.chars(str) do
	if char == "{" then in_tag = true end
		if not in_tag then
		if in_special[1] and mag.match(char, "[nNh]") then in_special[2] = true else in_special[1], in_special[2] = false, false end
		if char == "\\" then in_special[1] = true end
			if not in_special[1] and not in_special[2] then
			if mag.match(char, "%s") then space = space + 1 else space = 0 end
			if space > 1 then char = "" end
			end
		end
	if char == "}" then in_tag = false end
	l = l..char
	end
	return l
	end

	--strip_text = mag.strip.tag("{\bord3}This is an example.")
	function mag.strip.tag(str) return mag.gsub(str, "{[^}]-\\[^{]-}", "") end

	--strip_text = mag.strip.comment("{\bord3}This is an {Holla!}example.")
	function mag.strip.comment(str) return mag.gsub(str, "{[^\\]-}", "") end

	--strip_text = mag.strip.all("{\bord3}This is\h an {Holla!}example.")
	function mag.strip.all(str)
	str = mag.gsub(str, "{[^}]+}", "")
	str = mag.gsub(str, "\\N", " ")
	str = mag.gsub(str, "\\n", " ")
	str = mag.gsub(str, "\\h", " ")
	str = mag.gsub(str, "%s+", " ")
	str = mag.trim.all(str)
	return str
	end

	--strip_text = mag.strip.punc(";Thi:s .is; .a!n .example!")
	function mag.strip.punc(str) return mag.gsub(str, "["..mag.pattern.punc.."]", "") end

	--style_name = mag.strip.apply("Default (50+50)")
	function mag.strip.apply(stylename)
	stylename = mag.gsub(stylename, "(.*)(%s%(%d+%))",      "%1")
	stylename = mag.gsub(stylename, "(.*)(%s%(%d+%+%d+%))", "%1")
	return stylename
	end

	--line.text = mag.strip.any_tag(line.text, "i[01]")
	function mag.strip.any_tag(str,tag)
	str = mag.gsub(str, "{%s-\\"..tag.."%s-}",   "")
	str = mag.gsub(str, "({.*)\\"..tag.."(.*})", "%1%2")
	return str
	end

	--collect_number = mag.convert.number_collector({7, 8, 9, 10, 15, 16, 20, 21, 22, 24, 35, 37, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 80})
	--collect_number = mag.convert.number_collector({7 ,8 ,9 ,10, 15, 16, 20, 21, 22, 24, 35, 37, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 80}, true, mag.index.first(subs))
	function mag.convert.number_collector(numbers,index_mode,first_index)
	local t = ""
	if #numbers == 1 then
	t = numbers[1]
	else
	mag.array.insert(numbers,0)
	local g = false
	local c = 0
		for _, n in pairs(numbers) do
		c = c + 1
		mag.window.progress(c, #numbers)
			if numbers[c + 1] ~= nil then
				if index_mode == true then
				n = n - first_index + 1
				end
				if numbers[c] + 1 == numbers[c + 1] then
					if not g then
					g = true
					t = mag.string.combine(t, n, "{%1}, {%2}")
					end
				else
				g = false
				end
				if numbers[c] + 1 ~= numbers[c + 1] then
					if numbers[c] ~= numbers[c - 1] + 1 then
					t = mag.string.combine(t, n, "{%1}, {%2}")
					else
					t = mag.string.combine(t, n, "{%1} - {%2}")
					end
				end
			end
		end
	end
	return t
	end

	--ascii_text = mag.convert.ascii("Çekmece")
	function mag.convert.ascii(str)
	str = mag.gsub(str, "ç", mag.char(231))
	str = mag.gsub(str, "Ç", mag.char(199))
	str = mag.gsub(str, "ü", mag.char(252))
	str = mag.gsub(str, "Ü", mag.char(220))
	str = mag.gsub(str, "ö", mag.char(246))
	str = mag.gsub(str, "Ö", mag.char(214))
	str = mag.gsub(str, "ğ", mag.char(240))
	str = mag.gsub(str, "Ğ", mag.char(208))
	str = mag.gsub(str, "ş", mag.char(254))
	str = mag.gsub(str, "Ş", mag.char(222))
	str = mag.gsub(str, "ı", mag.char(253))
	str = mag.gsub(str, "İ", mag.char(221))
	return str
	end

	--string = mag.convert.esc("[example]")
	function mag.convert.esc(str)
	str = mag.gsub(str, "(%()",  "%%%1")
	str = mag.gsub(str, "(%))",  "%%%1")
	str = mag.gsub(str, "(%.)",  "%%%1")
	str = mag.gsub(str, "(%%)",  "%%%1")
	str = mag.gsub(str, "(%+)",  "%%%1")
	str = mag.gsub(str, "(%-)",  "%%%1")
	str = mag.gsub(str, "(%*)",  "%%%1")
	str = mag.gsub(str, "(%?)",  "%%%1")
	str = mag.gsub(str, "(%[)",  "%%%1")
	str = mag.gsub(str, "(%])",  "%%%1")
	str = mag.gsub(str, "(%^)",  "%%%1")
	str = mag.gsub(str, "(%$)",  "%%%1")
	str = mag.gsub(str, "(%\\)", "\\\\%1")
	return str
	end

	--positive = mag.convert.positive(-50)
	function mag.convert.positive(int) return int < 0 and int*-1 or int end

	--zero = mag.convert.zero(300, 20)
	function mag.convert.zero(total,number)
	local zero_count = mag.convert.len(mag.s(total)) - mag.convert.len(mag.s(number))
	if zero_count > 0 then number = mag.format("%s%s", mag.rep("0", zero_count), number) end
	return mag.s(number)
	end

	--percent = mag.convert.percent(300, 150, false, ["percent", "number"])
	function mag.convert.percent(number1,number2,remove_digit,return_value)
	number1 = mag.n(number1)
	number2 = mag.n(number2)
	local calc
	if return_value == "percent" then
	calc = 100 - ((number1 - number2) / number1 * 100)
		if remove_digit == false then
		calc = mag.gsub(calc, "(%.5[^%d]-)", "%10")
			if mag.match(calc, "%.%d+") then
			calc = mag.gsub(calc, "(%.%d%d)%d+", "%1")
			else
				if mag.match(calc, "100") then
				calc = calc..".0"
				else
				calc = calc..".00"
				end
			end
		end
	elseif return_value == "number" then
		number2 = number2 > 100 and 100 or number2
		number2 = number2 < 0   and 0   or number2
		calc = (number2 / 100) * number1
	end
	if remove_digit == true then
	calc = mag.floor(calc)
	end
	return mag.s(calc)
	end

	--frame_time = mag.convert.frame_time(14554)
	function mag.convert.frame_time(time) return aegisub.ms_from_frame(aegisub.frame_from_ms(time)) end
	
	--ass_color = mag.convert.html_to_ass("#FFFFFF")
	function mag.convert.html_from_ass(color) return ass_color(extract_color(color)) end

	--filename = mag.convert.filename("Random Text")
	function mag.convert.filename(filename)
	return mag.gsub(string.lower(filename), " ", "_")
	end

	--alpha_value = mag.convert.alpha_from_number(50)
	function mag.convert.alpha_from_number(value) return mag.format("%X", value) end

	--alpha_value = mag.convert.alpha_from_percent(50, true)
	function mag.convert.alpha_from_percent(value,fconv)
	value = mag.n(value)
	if mag.is.number(value) then
	if value > 100 or value < 0 then value = 100 end
	value = 100 - value
	value = mag.n(mag.convert.percent(256, value, true, "number"))
	if value > 255 then value = 255 end
	if fconv == true then value = mag.convert.alpha_from_number(value) end
	else
	value = nil
	end
	return value
	end

	--time = mag.convert.ms_from_time("00:02:03.20")
	function mag.convert.ms_from_time(time)
	local result
	if mag.match(time, "(%d+):(%d+):(%d+)%.(%d+)") then
	local hour, min, sec, ms = mag.match(time, "(%d+):(%d+):(%d+)%.(%d+)")
	result = mag.format("%s%s%s", hour * 36, mag.n(min) * 60 + sec, ms)
	result = mag.n(result)
	result = result * 10
	end
	return result ~= nil and result or 0
	end

	--time = mag.convert.time_from_ms(46587)
	function mag.convert.time_from_ms(time)
	time = mag.s(mag.sub(time, 1, -2))
	local hour, min, sec, ms = "0", "00", "00", "00"
	if mag.convert.len(time) <= 2 then
	hour, min, sec, ms = hour, min, sec, time
	time = mag.format("%s:%s:%s.%s", hour, mag.convert.zero(10, min), mag.convert.zero(10, sec), mag.convert.zero(10, ms))
	else
	sec, ms = mag.match(time, "(%d+)(%d%d)")
	min = mag.floor(sec / 60)
		if mag.n(sec) >= 60 then
		sec = sec - min * 60
		end
		if mag.n(min) >= 60 then
		hour = mag.floor(min / 60)
		min = min - hour * 60
		end
	hour, min, sec, ms = hour / 100, mag.convert.zero(10, min), mag.convert.zero(10, sec), mag.convert.zero(10, ms)
	time = mag.format("%s:%s:%s.%s", hour, min, sec, ms)
	end
	return time
	end

	--text = mag.string.sub("Mauris vitae mauris eget orci egestas porta.", 0,  20)
	--text = mag.string.sub("Mauris vitae mauris eget orci egestas porta.", 20, 0)
	function mag.string.sub(text,trim1,trim2)
	local s = ""
	local n = 0
	if trim2 == 0 then
	trim2 = mag.convert.len(text)
	end
	for c in mag.convert.chars(text) do
	n = n + 1
		if n >= trim1 and n <= trim2 then
		s = s..c
		end
	end
	return s
	end

	--apply = mag.list.full_apply(subs, sel, ["default", "comment", "fast"])
	function mag.list.full_apply(subs,sel,select_mode)
	local mode_list     = {"default", "comment", "fast"}
	local apply_items   = {}
	local styles        = mag.list.style(subs)
	local apply_format1 = "{%1} ({%2})"
	local apply_format2 = "{%1} ({%2}+{%3})"
	if select_mode == mode_list[1] or select_mode == mode_list[2] then
	local line, index
	local counter = {selected = {uncomment = 0, comment = 0, both = 0}, all = {uncomment = 0, comment = 0, both = 0}}
		if styles[1] ~= nil then
			for s = 1, #styles do
			counter[styles[s]] = {uncomment = 0, comment = 0, both = 0}
			end
		end
		for _, i in pairs(sel) do
		index = i
		line  = subs[i]
			if select_mode == mode_list[1] then
			counter["selected"]["both"] = counter["selected"]["both"] + 1
			elseif select_mode == mode_list[2] then
				if not line.comment then
				counter["selected"]["uncomment"] = counter["selected"]["uncomment"] + 1
				else
				counter["selected"]["comment"]   = counter["selected"]["comment"] + 1
				end
			end
		end
		for i = 1, #subs do
		mag.window.progress(i, #subs)
		index = i
		line  = subs[i]
			if line.class == "dialogue" then
				if select_mode == mode_list[1] then
				counter["all"]["both"] = counter["all"]["both"] + 1
				elseif select_mode == mode_list[2] then
					if not line.comment then
					counter["all"]["uncomment"] = counter["all"]["uncomment"] + 1
					else
					counter["all"]["comment"]   = counter["all"]["comment"] + 1
					end
				end
				for k = 1, #styles do
					if line.style == styles[k] then
						if select_mode == mode_list[1] then
						counter[styles[k]]["both"] = counter[styles[k]]["both"] + 1
						elseif select_mode == mode_list[2] then
							if not line.comment then
							counter[styles[k]]["uncomment"] = counter[styles[k]]["uncomment"] + 1
							else
							counter[styles[k]]["comment"]   = counter[styles[k]]["comment"] + 1
							end
						end
					end
				end
			end
		end
		if select_mode == mode_list[1] then
		mag.array.insert(apply_items, mag.window.lang.message("select"))
		mag.array.insert(apply_items, mag.string.format(apply_format1, mag.window.lang.message("selected_lines"), counter["selected"]["both"]))
		mag.array.insert(apply_items, mag.string.format(apply_format1, mag.window.lang.message("all_lines"),      counter["all"]["both"]))
			for s = 1, #styles do
				if counter[styles[s]]["both"] > 0 then
				mag.array.insert(apply_items, mag.string.format(apply_format1, styles[s], counter[styles[s]]["both"]))
				end
			end
		elseif select_mode == mode_list[2] then
		mag.array.insert(apply_items, mag.window.lang.message("select"))
		mag.array.insert(apply_items, mag.string.format(apply_format2, mag.window.lang.message("selected_lines"), counter["selected"]["uncomment"], counter["selected"]["comment"]))
		mag.array.insert(apply_items, mag.string.format(apply_format2, mag.window.lang.message("all_lines"),      counter["all"]["uncomment"],      counter["all"]["comment"]))
			for s = 1, #styles do
				if counter[styles[s]]["uncomment"] > 0 or counter[styles[s]]["comment"] > 0 then
				mag.array.insert(apply_items, mag.string.format(apply_format2, styles[s], counter[styles[s]]["uncomment"], counter[styles[s]]["comment"]))
				end
			end
		end
	elseif select_mode == mode_list[3] then
	local lines_types = {mag.window.lang.message("select"), mag.window.lang.message("selected_lines"), mag.window.lang.message("all_lines")}
	apply_items       = mag.array.merge(lines_types, styles)
	end
	return apply_items
	end

	--apply = mag.list.apply(subs,["default", "comment"])
	function mag.list.apply(subs,select_mode)
	local mode_list     = {"default", "comment"}
	local apply_items   = {}
	local styles        = mag.list.style(subs)
	if select_mode == mode_list[1] or select_mode == mode_list[2] then
	local line, index
	local apply_format1 = "{%1} ({%2})"
	local apply_format2 = "{%1} ({%2}+{%3})"
	local counter       = {}
		if styles[1] ~= nil then
			for s = 1, #styles do
			counter[styles[s]] = {uncomment = 0, comment = 0, both = 0}
			end
		end
		for i = 1, #subs do
		mag.window.progress(i, #subs)
		index = i
		line  = subs[i]
			if line.class == "dialogue" then
				for k = 1, #styles do
					if line.style == styles[k] then
						if select_mode == mode_list[1] then
						counter[styles[k]]["both"] = counter[styles[k]]["both"] + 1
						elseif select_mode == mode_list[2] then
							if not line.comment then
							counter[styles[k]]["uncomment"] = counter[styles[k]]["uncomment"] + 1
							else
							counter[styles[k]]["comment"]   = counter[styles[k]]["comment"] + 1
							end
						end
					end
				end
			end
		end
		if select_mode == mode_list[1] then
			for s = 1, #styles do
				if counter[styles[s]]["both"] > 0 then
				mag.array.insert(apply_items, mag.string.format(apply_format1, styles[s], counter[styles[s]]["both"]))
				end
			end
		elseif select_mode == mode_list[2] then
			for s = 1, #styles do
				if counter[styles[s]]["uncomment"] > 0 or counter[styles[s]]["comment"] > 0 then
				mag.array.insert(apply_items, mag.string.format(apply_format2, styles[s], counter[styles[s]]["uncomment"], counter[styles[s]]["comment"]))
				end
			end
		end
	end
	return apply_items
	end

	--style_list = mag.list.style(subs)
	function mag.list.style(subs)
	local styles = {}
	for i = 1, #subs do
		if subs[i].class == "style" then
		mag.array.insert(styles, subs[i].name)
		elseif subs[i].class == "dialogue" then
		break
		end
	end
	return styles
	end

	--actor_list = mag.list.actor(subs, true)
	function mag.list.actor(subs,count)
	local actor_list1 = {}
	local actor_list2 = {}
	if count == true or count == false then
		for i = 1, #subs do
		mag.window.progress(i, #subs)
		local line = subs[i]
			if line.class == "dialogue" and line.actor ~= "" then
			local actor = line.actor
			mag.array.insert(actor_list1, actor)
			end
		end
	mag.sort.double(actor_list1)
	end
	if count == true and actor_list1[1] ~= nil then
	local actor_pattern   = "{%1} ({%2})"
	local counter         = {}
		for _, name in pairs(actor_list1) do
		counter[name] = 0
		end
		for i = 1, #subs do
		mag.window.progress(i, #subs)
		local line = subs[i]
			if line.class == "dialogue" then
				for _, name in pairs(actor_list1) do
					if name == line.actor then
					counter[name] = counter[name] + 1
					end
				end
			end
		end
		for _, name in pairs(actor_list1) do
		local actor = mag.string.format(actor_pattern, name, counter[name])
		mag.array.insert(actor_list2, actor)
		end
	end
	if count == false and actor_list1[1] ~= nil then
	return actor_list1
	elseif count == true and actor_list2[1] ~= nil then
	return actor_list2
	else
	return nil
	end
	end

	--effect_list = mag.list.effect(subs, true)
	function mag.list.effect(subs,count)
	local effect_list1 = {}
	local effect_list2 = {}
	if count == true or count == false then
		for i = 1, #subs do
		mag.window.progress(i, #subs)
		local line = subs[i]
			if line.class == "dialogue" and line.effect ~= "" then
			local effect = line.effect
			mag.array.insert(effect_list1, effect)
			end
		end
	mag.sort.double(effect_list1)
	end
	if count == true and effect_list1[1] ~= nil then
	local effect_pattern   = "{%1} ({%2})"
	local counter         = {}
		for _, name in pairs(effect_list1) do
		counter[name] = 0
		end
		for i = 1, #subs do
		mag.window.progress(i, #subs)
		local line = subs[i]
			if line.class == "dialogue" then
				for _, name in pairs(effect_list1) do
					if name == line.effect then
					counter[name] = counter[name] + 1
					end
				end
			end
		end
		for _, name in pairs(effect_list1) do
		local effect = mag.string.format(effect_pattern, name, counter[name])
		mag.array.insert(effect_list2, effect)
		end
	end
	if count == false and effect_list1[1] ~= nil then
	return effect_list1
	elseif count == true and effect_list2[1] ~= nil then
	return effect_list2
	else
	return nil
	end
	end

	--mag.show.log(1, "This is an error.")
	function mag.show.log(alert,str)
	local alert_message
	local result
	local divide = mag.string.wall("-", 114)
	if str == nil then
	str   = alert
	alert = nil
	end
	if alert ~= nil then
		if alert > 3 or alert < 1 then
		alert = nil
		end
	end
	if alert ~= nil then
	if alert == 1 then alert_message = mag.window.lang.message("log_error")   end
	if alert == 2 then alert_message = mag.window.lang.message("log_warning") end
	if alert == 3 then alert_message = mag.window.lang.message("log_note")    end
	end
	if alert ~= nil then
	result = mag.format("[%s]\n%s\n%s", alert_message, mag.s(str), divide)
	else
	result = mag.format("%s\n%s", mag.s(str), divide)
	end
	aegisub.log(result)
	end

	--mag.show.basic_log("Hello", ["autobreak", "nobreak"])
	function mag.show.basic_log(str,mode)
	local t
	if mode == "autobreak" then
	t = mag.s(str).."\n"
	elseif mode == "nobreak" then
	t = mag.s(str)
	end
	aegisub.log(t)
	end

	--mag.show.array({5, 8, 1, 7, 6, 1})
	function mag.show.array(array)
	local format1 = "[{%s}] = {%s}"
	local format2 = "[{%s}]"
		for key, value in pairs(array) do
			if mag.is.array(value) then
			mag.show.basic_log(mag.string.format(format2, key), "autobreak")
				for key2, value2 in pairs(value) do
				mag.show.basic_log(mag.string.format(mag.string.wall(" ", 5)..format1, key2, value2), "autobreak")
				end
			else
			mag.show.basic_log(mag.string.format(format1, key, value), "autobreak")
			end
		end
	end

	--mag.show.report(c.comment_line, counter["comment_count"], "Delete comment line.", "", "", "")
	--mag.show.report(c.comment_line, counter["comment_count"], "Delete comment line.", "", "", "")
	function mag.show.report(check,count,preference,value,desc,custom_text)
	if check then
	local header, message = "", ""
		if value == "" then
		header = mag.string.format(mag.window.lang.message("report_mheader"),  preference)
		else
		header = mag.string.format(mag.window.lang.message("report_mheader2"), preference, value)
		end
		if count > 0 then
			if desc ~= "" then
			message = desc
			end
			if custom_text ~= "" then
			message = mag.string.combine(message, custom_text,                                                  "{%s}\n{%s}")
			else
			message = mag.string.combine(message, mag.string.format(mag.window.lang.message("report_msuccess"), count), "{%s}\n{%s}")
			end
		else
		message = mag.window.lang.message("report_mfail")
		end
	mag.show.log(mag.string.format("{%s}\n{%s}", header, message))
	end
	end

	--mag.show.action(true, "File opened")
	function mag.show.action(value,print)
	if value then
	mag.show.log(mag.string.format("[{%s}] {%s}", mag.window.lang.message("log_mOk"),    print))
	else
	mag.show.log(mag.string.format("[{%s}] {%s}", mag.window.lang.message("log_mError"), print))
	end
	end

	--mag.show.no_op(false)
	--mag.show.no_op(false, "effect", "Chimi Changa")
	function mag.show.no_op(value, format_select, text)
	local print_text
	if value == false then
		if format_select == nil then
		print_text = mag.window.lang.message("no_process")
		elseif format_select == "effect" then
		print_text = mag.string.format(mag.window.lang.message("no_process2"), text)
		end
		if print_text ~= nil then
		mag.show.log(1, print_text)
		end
	end
	end

	--total_line = mag.index.total(subs)
	function mag.index.total(subs)
	local first_index = mag.index.first(subs) - 1
	return #subs - first_index 
	end

	--selected_lines = mag.index.sel(subs, sel)
	function mag.index.sel(subs,sel)
	local index = {}
	for si, li in pairs(sel) do
	mag.window.progress(si, #sel)
	mag.array.insert(index, li)
	end
	return index
	end

	--first_index = mag.index.first(subs)
	function mag.index.first(subs)
	local first_index
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
		first_index = i
		break
		end
	end
	return first_index
	end

	--real_index = mag.index.real(subs, 50)
	function mag.index.real(subs,index)
	local first_index = mag.index.first(subs)
	index = index - (first_index - 1)
	return index
	end

	--last_index = mag.index.last(subs)
	function mag.index.last(subs) return #subs end

	--limited_text = mag.limit.text("Sed orci tellus, fermentum tempus risus eu, consectetur ullamcorper lacus.", 20, true)
	function mag.limit.text(text,limit,dot)
	limit      = mag.n(limit)
	local dots = ""
	if dot == true and limit < mag.convert.len(text) then dots = "..." end
	local s, n = "", 0
	for c in mag.convert.chars(text) do
	n = n + 1
	s = s..c
		if n == limit then
		break
		end
	end
	if dot == true then
	s = mag.trim.right(s)
	end
	return s..dots
	end

	--limited_path = mag.limit.path("C:\\Program Files (x86)\\Aegisub\\automation\\include", 20, 15)
	function mag.limit.path(f,left_limit,right_limit)
	local t
	f                         = mag.gsub(f, ".+\\", "")
	local file_name, file_ext = mag.match(f, "(.+)%.(.+)")
	if file_name ~= nil and file_ext ~= nil then
		if mag.convert.len(file_name) > left_limit + right_limit then
		t = mag.string.format("{%1}...{%2}.{%3}",
		mag.string.sub(file_name, 1,                                        left_limit),
		mag.string.sub(file_name, mag.convert.len(file_name) - right_limit, 0),
		file_ext)
		else
		t = f
		end
	end
	return t
	end

	--trim_text = mag.trim.all("     Nam risus arcu, posuere vitae ipsum ac, molestie suscipit nisi.     ")
	function mag.trim.all(text)
	text = mag.trim.left(text)
	text = mag.trim.right(text)
	return text
	end

	--trim_text = mag.trim.left("          Nam risus arcu, posuere vitae ipsum ac, molestie suscipit nisi.")
	function mag.trim.left(text)
	local l          = ""
	local first      = false
	local in_tag     = false
	local in_special = {false, false}
	for char in mag.convert.chars(text) do
	if char == "{" then in_tag = true end
		if not in_tag then
		if in_special[1] and mag.match(char, "[nNh]") then in_special[2] = true else in_special[1], in_special[2] = false, false end
		if char == "\\" then in_special[1] = true end
			if not in_special[1] and not in_special[2] then
				if not first and mag.match(char, "%s") then
				char = ""
				else
				first = true
				end
			end
		end
	if char == "}" then in_tag = false end
	l = l..char
	end
	return l
	end

	--trim_text = mag.trim.right("Nam risus arcu, posuere vitae ipsum ac, molestie suscipit nisi.       ")
	function mag.trim.right(text)
	local in_tag      = false
	local l           = ""
	local in_special  = {false, false}
	local space_count = 0
	local space       = false
	local last_char   = 0
	local char_count  = 0
	for char in mag.convert.chars(text) do
	if char == "{" then in_tag = true end
		if not in_tag then
		if in_special[1] and mag.match(char, "[nNh]") then in_special[2] = true else in_special[1], in_special[2] = false, false end
		if char == "\\" then in_special[1] = true end
			if not in_special[1] and not in_special[2] then
				if mag.match(char, "%S") then
				last_char = last_char + 1
				end
			end
		end
	if char == "}" then in_tag = false end
	end
	for char in mag.convert.chars(text) do
	if char == "{" then in_tag = true end
		if not in_tag then
		if in_special[1] and mag.match(char, "[nNh]") then in_special[2] = true else in_special[1], in_special[2] = false, false end
		if char == "\\" then in_special[1] = true end
			if not in_special[1] and not in_special[2] then
				if mag.match(char, "%S") then
				char_count = char_count + 1
				end
				if char_count >= last_char and mag.match(char, "%s") then
				char = ""
				end
			end
		end
	if char == "}" then in_tag = false end
	l = l..char
	end
	return l
	end

	--value = mag.is.even(50)
	function mag.is.even(t) return t % 2 == 0 end

	--value = mag.is.string("example")
	function mag.is.string(t) return type(t) == "string" end

	--value = mag.is.boolean(true)
	function mag.is.boolean(t) return type(t) == "boolean" end

	--value = mag.is.number(58)
	function mag.is.number(t) return type(t) == "number" end

	--value = mag.is.array({"example"})
	function mag.is.array(t) return type(t) == "table" end

	--value = mag.is.video()
	function mag.is.video() return mag.convert.ms_from_frame(0) ~= nil end

	--value = mag.is.empty("  ")
	function mag.is.empty(t)
	t = mag.strip.all(t)
	t = mag.strip.space(t)
	return mag.convert.len(t) == 0
	end

	mag.directory.automation  = aegisub.decode_path("?data\\automation\\autoload\\")
	mag.directory.include     = aegisub.decode_path("?data\\automation\\include\\")
	mag.directory.temp        = aegisub.decode_path("?user\\")

	mag.config.file.directory = mag.directory.temp
	mag.config.file.ext       = "config"
	if c_script_name_list ~= nil and c_script_name_list[mag.default_lang] ~= nil then
	mag.config.file.name      = c_script_name_list[mag.default_lang]
	else
	mag.config.file.name      = script_name
	end
	mag.config.file.name      = mag.format("[%s]_%s.%s", script_author, mag.convert.filename(mag.config.file.name), mag.config.file.ext)
	mag.config.file.path      = mag.config.file.directory..mag.config.file.name

	--c = {value1 = false}
	--mag.config.set(c)
	function mag.config.set(conf)
	local file = io.open(mag.config.file.path, "w")
	if not file then
	mag.show.log(1, mag.window.lang.message("error_config_file_write"))
	else
	local cvals  = {}
		for config, value in pairs(conf) do
			if mag.match(mag.s(value), "\n") then
			value = mag.gsub(value, "\n", "\\n")
			end
		mag.array.insert(cvals, mag.format("%s=%s", config, value))
		end
	mag.sort.basic(cvals)
	local header = mag.format("[%s]", script_name)
	local cval   = ""
		for i = 1, #cvals + 1 do
			if i == 1 then cval = header
			else
			cval = cval.."\n"..cvals[i - 1]
			end
		end
	cval = cval.."\n"..header
	file:write(cval)
	file:close()
	end
	end

	--c = {value1 = false}
	--mag.config.get(c)
	function mag.config.get(conf)
	local file = io.open(mag.config.file.path)
	if file then
	local configs = file:read("*all")
	file:close()
		for config in pairs(conf) do
		local v = mag.match(configs, "\n"..config.."=(.-)\n")
			if v ~= nil then
				if mag.s(v) == "true" then
				v = true
				elseif mag.s(v) == "false" then
				v = false
				end
				if mag.match(mag.s(v), "\\n") then
				v = mag.gsub(v, "\\n", "\n")
				end
			c[config] = v
			end
		end
	end
	end

	--apply_item = mag.array.search_apply(appy_items, "Default")
	function mag.array.search_apply(items,search)
	local i = mag.window.lang.message("select")
	for _, item in ipairs(items) do if mag.strip.apply(item) == mag.strip.apply(search) then i = item end end
	return i
	end

	--sitem = mag.array.search({"foo", "bar"}, "foo")
	function mag.array.search(items,i)
	local r = false
	for _, item in ipairs(items) do
		if item == i then
		r = true
		break
		end
	end
	return r
	end

	--sitem = mag.array.count({"foo", "foo", "bar"}, "foo")
	function mag.array.count(items,i)
	local r = 0
	for _, item in ipairs(items) do
		if item == i then
		r = r + 1
		end
	end
	return r
	end

	--c = mag.array.merge({"aa", "bb"}, {"cc", "dd"})
	function mag.array.merge(first_array,second_array)
	local merge_array = first_array
	for _, value in pairs(second_array) do
	mag.array.insert(merge_array, value)
	end
	return merge_array
	end

	--lines_index = mag.line.index(subs, sel, ["All lines", "Selected lines", "A Style Name"], true, true)
	function mag.line.index(subs,sel,apply,comment,empty)
	local line, index
	local lines = {}
	apply       = mag.strip.apply(apply)
	if apply == mag.window.lang.message("all_lines") then
		for i = 1, #subs do
		mag.window.progress(i, #subs)
		index = i
		line  = subs[index]
			if line.class == "dialogue" then
			local ok = true
				if comment == true and line.comment            then ok = false end
				if empty   == true and mag.is.empty(line.text) then ok = false end
				if ok then
				mag.array.insert(lines, index)
				end
			end
		end
	elseif apply == mag.window.lang.message("selected_lines") then
		for n, i in pairs(sel) do
		mag.window.progress(n, #sel)
		index = i
		line  = subs[index]
			if line.class == "dialogue" then
			local ok = true
				if comment == true and line.comment            then ok = false end
				if empty   == true and mag.is.empty(line.text) then ok = false end
				if ok then
				mag.array.insert(lines, index)
				end
			end
		end
	else
		for i = 1, #subs do
		mag.window.progress(i, #subs)
		index = i
		line  = subs[index]
			if line.class == "dialogue" and line.style == apply then
			local ok = true
				if comment == true and line.comment            then ok = false end
				if empty   == true and mag.is.empty(line.text) then ok = false end
				if ok then
				mag.array.insert(lines, index)
				end
			end
		end
	end
	return lines
	end

	--mag.line.sort(subs, lines_index)
	function mag.line.sort(subs,idx)
	if #idx > 0 then
	local sort            = {}
	local sort_index      = {}
	local start_time_list = {}
		for i = 1, #idx do
		mag.window.progress(i, #idx)
		local start_time = subs[idx[i]].start_time
			if not sort[start_time] then
			sort[start_time] = {}
			mag.array.insert(start_time_list, start_time)
			end
		mag.array.insert(sort[start_time], subs[idx[i]])
		end
	mag.sort.bubble(start_time_list)
		for k = 1, #start_time_list do
		mag.window.progress(k, #start_time_list)
			for _, line in pairs(sort[start_time_list[k]]) do
			subs[idx[k]] = line
			end
		end
	end
	end

	--mag.line.delete(subs, {50, 80, 90})
	function mag.line.delete(subs,index)
	index = mag.sort.reverse(index)
	for i = 1, #index do
	mag.window.progress(i, #index)
	subs.delete(index[i])
	end
	end

	--mag.sort.bubble(5, 8, 4, 2, 7)
	function mag.sort.bubble(array)
	local sort = array
	for i = 1, #sort do
	mag.window.progress(i, #sort)
		for j = 1, #sort - 1 do
			if mag.n(sort[j]) > mag.n(sort[j + 1]) then
			local sort_temp = sort[j + 1]
			sort[j + 1]     = sort[j]
			sort[j]         = sort_temp
			end
		end
	end
	end

	--sorted_index_list = mag.sort.index(subs, lines_index)
	function mag.sort.index(subs,idx)
	local sort_index = {}
	if #idx > 0 then
	local sort            = {}
	local start_time_list = {}
		for i = 1, #idx do
		mag.window.progress(i, #idx)
		local start_time = subs[idx[i]].start_time
			if not sort[start_time] then
			sort[start_time] = {}
			mag.array.insert(start_time_list, start_time)
			end
		mag.array.insert(sort[start_time], idx[i])
		end
	mag.sort.bubble(start_time_list)
		for k = 1, #start_time_list do
		mag.window.progress(k, #start_time_list)
			for _, index in pairs(sort[start_time_list[k]]) do
			mag.array.insert(sort_index, index)
			end
		end
	end
	return sort_index
	end

	--mag.sort.double({5, 8, 1, 6, 7, 32, 745, 8, 25, 5, 1, 7})
	function mag.sort.double(array)
	local c, index = 0, {}
	for i = 1, #array do
	mag.window.progress(i, #array)
	c = 0
	for j = i, #array do if array[i] == array[j] then c = c + 1 end end
	if c > 1 then mag.array.insert(index, i) end
	end
	c = 0
	for k = 1, #index do
	mag.array.remove(array, index[k] - c)
	c = c + 1
	end
	end

	--reverse_array = mag.sort.reverse({"5", "10", "15", "20"})
	function mag.sort.reverse(array)
	local array_temp = {}
	for i = 1, #array do
	mag.window.progress(i, #array)
	array_temp[i] = array[(#array + 1) - i]
	end
	return array_temp
	end

	return mag