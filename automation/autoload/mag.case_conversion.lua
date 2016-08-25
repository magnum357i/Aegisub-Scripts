	script_name        = "Case Conversion"
	script_description = "Harflerle ilgili işlemler yapar."
	script_version     = "0.8"
	script_author      = "Magnum357"
	script_mag_version = "1.1.1.9"

	mag_import, mag = pcall(require,"mag")

	c_comment_lines = true
	c_reset_chars   = true
	c_buttons       = {"C / B","C / K","C / İ","K / B","K / BT","Kapat"}
	c_chars         = "a-zA-ZçÇşŞıIiİüÜöÖ"
	c_conjunction   = {"ama","fakat","için","ile","ve","veya","de","da",
	                   "sanki","yani","hem","ya","ancak","bile","gerek",
	                   "hatta","hem","ise","ki","yine","yoksa","zira",
	                   "yalnız","veyahut","oysa","oysaki","öyleyse","lakin"
	                   ,"lâkin","ya","nitekim","çünkü","bari","eğer","keza"
	                   ,"şayet"}

	function case_conversion(subs,sel,ok,config)
	local apply_lines = mag.unstyles(config.u_apply_lines)
	local first_index = mag.first_index(subs) - 1
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
	if c_comment_lines then comment1, comment2 = line.comment, false end
	if apply_lines ~= "Tüm stiller" then if apply_lines ~= "Seçili satırlar" then style1, style2 = line.style, apply_lines end end
		if comment1 == comment2 and style1 == style2 and line.class == "dialogue" then
			if c_reset_chars and c_buttons[2] ~= ok then
			line.text = ck(line.text)
			end
			if c_buttons[1] == ok then
			line.text = cb(line.text)
			end
			if c_buttons[2] == ok then
			line.text = ck(line.text)
			end
			if c_buttons[3] == ok then
			line.text = ci(line.text)
			end
			if c_buttons[4] == ok then
			line.text = kb(line.text)
			end
			if c_buttons[5] == ok then
			line.text = kbt(line.text)
			end
		subs[k]   = line
		end
	end
	end

	function cb(text)
	local in_tag     = false
	local l          = ""
	local in_special = false
	for char in unicode.chars(text) do
	if char == "{" then in_tag = true end
	if char == "}" then in_tag = false end
		if char:match("["..c_chars.."]") and not in_tag and not in_special then
		char = mag.up(char)
		end
	l = l..char
	if in_special then in_special = false end
	if char == "\\" then in_special = true end
	end
	return l
	end

	function ck(text)
	local in_tag     = false
	local l          = ""
	local in_special = false
	for char in unicode.chars(text) do
	if char == "{" then in_tag = true end
	if char == "}" then in_tag = false end
		if char:match("["..c_chars.."]") and not in_tag and not in_special then
		char = mag.low(char)
		end
	l = l..char
	if in_special then in_special = false end
	if char == "\\" then in_special = true end
	end
	return l
	end

	function ci(text)
	local dot        = "%.%?%!"
	local in_tag     = false
	local l          = ""
	local in_special = false
	local in_s1      = false
	local in_s2      = false
	local count      = 0
	for char in unicode.chars("."..text) do
	count = count + 1
	if char == "{" then in_tag = true end
	if char == "}" then in_tag = false end
		if not in_tag and not in_special then
		if mag.match(char,"["..dot.."]") then in_s1 = true end
		if in_s1 then in_s2 = true end
			if char:match("["..c_chars.."]") and in_s2 then
			char = mag.up(char)
			if in_s2 then in_s1, in_s2 = false, false end
			end
		end
	if count > 1 then l = l..char end
	if in_special then in_special = false end
	if char == "\\" then in_special = true end
	end
	return l
	end

	function kb(text)
	text             = mag.gsub(text,"(\\[nNh])","%1 ")
	local in_tag     = false
	local l          = ""
	local in_special = false
	local in_space   = false
	local count      = 0
	for char in unicode.chars(" "..text) do
	count = count + 1
	if char == "{" then in_tag = true end
	if char == "}" then in_tag = false end
		if not in_tag then
			if char:match("["..c_chars.."]") and in_space and not in_special then
			char     = mag.up(char)
			in_space = false
			end
		if char == " " then in_space = true end
		if in_special then in_special = false end
		if char == "\\" then in_special = true end
		end
	if count > 1 then l = l..char end
	end
	l = mag.gsub(l,"(\\[nNh])(%s)","%1")
	return l
	end

	function kbt(text)
	text          = mag.gsub(text,"(\\[nNh])","%1 ")
	local _, word = mag.words(text)
	local in_con  = false
	local wd      = ""
	local l       = ""
	local ln      = ""
	local count   = 0
	for w = 1, #word do
	count = count + 1
	ln    = word[w]
	wd    = mag.full_strip(ln)
	wd    = mag.removedot(wd)
	wd    = mag.gsub(wd,"%s-","")
		for v = 1, #c_conjunction do
			if c_conjunction[v] == wd then
			in_con = true
			end
		end	
		if not in_con or count == 1 then
		ln = kb(ln)
		end
	l      = l..ln
	in_con = false
	wd     = ""
	end
	l = mag.gsub(l,"(\\[nNh])(%s)","%1")
	return l
	end

	function add_macro(subs,sel)
	local sel_total_format  = sel_total_format(subs,sel,"comment","Seçili satırlar")
	local subs_total_format = subs_total_format(subs,sel,"comment","Tüm stiller")
	local apply_items       = {"Seç",sel_total_format,subs_total_format}
	local z                 = false
	local ok, config
	repeat
	local gui =
	{
	 {class = "label",                                                       x = 0, y = 0, width = 2, height = 1, label = "\"C / B\": Cümlelerin tüm harflerini büyük yapar."}
	,{class = "label",                                                       x = 0, y = 1, width = 2, height = 1, label = mag.wall(" ",14).."\"C / K\": Cümlelerin tüm harflerini küçük yapar."}
	,{class = "label",                                                       x = 0, y = 2, width = 2, height = 1, label = mag.wall(" ",28).."\"C / İ\": Cümlelerin ilk harflerini büyük yapar."}
	,{class = "label",                                                       x = 0, y = 3, width = 2, height = 1, label = mag.wall(" ",42).."\"K / B\": Kelimelerin baş harflerini büyük yapar."}
	,{class = "label",                                                       x = 0, y = 4, width = 2, height = 1, label = mag.wall(" ",57).."\"K / BT\": Kelimelerin baş harflerini büyük yapar. (Bağlaçlara duyarlı.)"}
	,{class = "label",                                                       x = 0, y = 5, width = 1, height = 1, label = "Uygulanacak satırlar:"}
	,{class = "dropdown", name = "u_apply_lines",   value = "Seç",           x = 1, y = 5, width = 1, height = 1, items = apply_items, hint = "Sadece kullanılan stiller listelenir. İlk sayı yorum satırı yapılmamış iken ikinci sayı yapılmış satırların sayısıdır."}
	,{class = "checkbox", name = "u_comment_lines", value = c_comment_lines, x = 1, y = 6, width = 1, height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_reset_chars",   value = c_reset_chars,   x = 1, y = 7, width = 1, height = 1, label = "Harfleri sıfırla.", hint = "Uygulacağınız moddan önce harfleri sıfırlayarak yapmak istediğiniz modu tek seferde yapabilirsiniz."}
	}
		if not z then
		z = true
		mag.styles_insert(subs,gui,7,"comment","")
		end
	ok, config = mag.dlg(gui,c_buttons)
	c_comment_lines = config.u_comment_lines
	c_reset_chars   = config.u_reset_chars
	mag.remove(gui,2)
	until ok == "Kapat" or ok ~= c_buttons[6] and config.u_apply_lines ~= "Seç"
	if ok ~= c_buttons[6] then
	case_conversion(subs,sel,ok,config)
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
		mag.register(false,add_macro)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end