	script_name = "Text Align"
	script_description = "Yazıyı hizalar."
	script_author = "Magnum357"
	script_version = "0.7"

	mag_import, mag = pcall(require,"mag")

	function text_align(subs,sel,config)
	local line_height = config["line_height"]
	local align = config["align"]
	local line_width = config["line_width"]
	local sline = config["sline"]
	local n = 0
	local select_index = {}
	local line_text
	local line, l, pos_x, pos_y, scount, stext
	for si, li in pairs(sel) do
	li = li + n
	table.insert(select_index,li)
	line = subs[li]
	line_text = line.text
	pos_x, pos_y = mag.get_pos(line_text, true)
	line_text = mag.gsub(line_text,"{\\pos%(%d+%.-%d-,%d+%.-%d-%)}","")
	line_text = mag.gsub(line_text,"\\pos%(%d+%.-%d-,%d+%.-%d-%)","")
		if pos_x and pos_y then
		line.comment = true
		if align == "Sağdan" or align == "Soldan" then scount, stext = split(line_text,line_width) end
		if align == "Ortadan" then scount, stext = split2(line_text,line_width) end
			if scount ~= false or stext ~= false then
				for i = 1, scount do
				n = n + 1
				l = table.copy(line)
				l.comment = false
				if align == "Sağdan"  then l.text = mag.format("{\\an6\\pos(%s,%s)}%s",pos_x,pos_y + ((i - 1) * line_height),stext[i]) end
				if align == "Soldan"  then l.text = mag.format("{\\an4\\pos(%s,%s)}%s",pos_x,pos_y + ((i - 1) * line_height),stext[i]) end
				if align == "Ortadan" then l.text = mag.format("{\\an4\\pos(%s,%s)}%s",pos_x,pos_y + ((i - 1) * line_height),stext[i]) end
				subs.insert(li + i,l)
				end
			end		
		else mag.log(2,"Satırda pos etiketi bulunamadı.")
		end
		subs[li] = line
		end
	if select_index[1] ~= nil then return select_index end
	end

	function strip_and_len(str) return mag.len(mag.full_strip(str)) end

	function split(str,max_char)
	local split   = {}
	local word    = {}
	local s       = ""
	local in_tags = false
	local n       = 0
	max_char = max_char + 1
	str = str.." "
	for char in unicode.chars(str) do
	s = s..char
	if char == "{" then in_tags = true end
		if in_tags == false and char == " " then
		table.insert(word,s)
		s = ""
		end
		if char == "}" then in_tags = false end
		end
	s = ""
	table.insert(word,"")
	for k = 1, table.getn(word) - 1 do
	s = s..word[k]
		if strip_and_len(s) + (strip_and_len(word[k + 1]) - 1) >= max_char then
		s = mag.sub(s,1,-2)
		table.insert(split,s)
		n = n + 1
		s = ""
		end
	end
	s = mag.sub(s,1,-2)
	table.insert(split,s)
	n = n + 1
	if n == 0 then return false, false else return n, split end
	end

	function space(sp,co)
	sp = sp - 1
	local space = {}
	for t = 1, co do table.insert(space,"") end
	local n = 0
	local m = 0
	repeat
	n = n + 1
	m = m + 1
	space[m] = space[m].."\\h"
	if m == table.getn(space) then m = 0 end
	until n == sp
	return space
	end

	function split2(str,max_char)
	local split   = {}
	local word    = {}
	local s       = ""
	local s2      = ""
	local in_tags = false
	local n       = 0
	local spc     = {}
	local sp      = 0
	max_char = max_char + 1
	str = str.." "
	for char in unicode.chars(str) do
	s = s..char
	if char == "{" then in_tags = true end
		if in_tags == false and char == " " then
		table.insert(word,s)
		s = ""
		end
	if char == "}" then in_tags = false end
	end
	s = ""
	table.insert(word,"")
	for k = 1, table.getn(word) - 1 do
	s = s..word[k]
		if strip_and_len(s) + (strip_and_len(word[k + 1]) - 1) >= max_char then
		s = mag.sub(s,1,-2)
			if mag.match(s,"%s") then
			spc = space(max_char-strip_and_len(s),mag.ccount(mag.full_strip(s),"%s"))
			spc = mag.reverse_short_array(spc)
				for ch in unicode.chars(s) do
				if ch == "{" then in_tags = true end
				if ch == " " and in_tags == false then sp = sp + 1 ch = "\\h"..spc[sp] end
				s2 = s2..ch
				if ch == "}" then in_tags = false end
				end
			s = s2
			end
	table.insert(split,s)
	n = n + 1
	sp = 0
	s = ""
	s2 = ""
	spc = {}
	end
	end
	s = mag.sub(s,1,-2)
	table.insert(split,s)
	n = n + 1
	if n == 0 then return false, false else return n, split end
	end

	line_height = 50
	line_width  = 30
	align       = "Soldan"
	save_conf   = false

	function add_macro(subs,sel)
	local ok, config, buttons, index
	buttons = {"Hizala","Kapat"}
	local dialog_config =
	{{class = "label",                                               x = 0, y = 0, width = 1, height = 1, label = mag.wall(" ",5).."Satır aralığı:"}
	,{class = "intedit",  name = "line_height", value = line_height, x = 1, y = 0, width = 1, height = 1, min = -100, max = 100}
	,{class = "label",                                               x = 0, y = 1, width = 1, height = 1, label = "Karakter sınırı:"}
	,{class = "intedit",  name = "line_width",  value = line_width,  x = 1, y = 1, width = 1, height = 1, min = 1, max = 2000, hint = "Bir satırdaki maksimum karakterdir. Satır uzunluğu için bir değer de diyebiliriz."}
	,{class = "label",                                               x = 0, y = 2, width = 1, height = 1, label = mag.wall(" ",7).."Hizalama:"}
	,{class = "dropdown", name = "align",       value = align,       x = 1, y = 2, width = 1, height = 1, items = {"Soldan","Sağdan","Ortadan"}}
	,{class = "checkbox", name = "save_conf",   value = save_conf,   x = 0, y = 4, width = 2, height = 1, label = "Arayüzdeki tercihleri hatırla."}
	}
	ok, config = mag.dlg(dialog_config,buttons)
	if ok == buttons[1] then
		save_conf   = config.save_conf
		if config.save_conf == true then
		line_height = config.line_height
		line_width  = config.line_width
		align       = config.align
		end
	index = text_align(subs,sel,config)
	aegisub.set_undo_point(script_name)
	return index
	end
	end

	if mag_import then mag.register(false,add_macro) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end