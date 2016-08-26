	script_name        = "Finder"
	script_description = "Yorum parantezlerine veya girilen kelimeye göre listeleme yapar. Listeledikleri arasında geçiş de yapabilir."
	script_version     = "1.1"
	script_author      = "Magnum357"
	script_mag_version = "1.1.1.9"

	mag_import, mag = pcall(require,"mag")

	c_page            = 10
	c_max_char        = 60
	c_query_word      = ""
	c_comment         = false
	c_case_sensitive  = false
	c_regex           = false
	c_comment_bracket = false

	function listing(subs,pattern,pattern2,class,case)
	local first_index           = mag.first_index(subs) - 1
	local total_line            = mag.total_full(subs)
	local count                 = 0
	local line_index, line_text = {}, {}
	for i = 1, #subs do
	local line = subs[i]
	local comment1, comment2 = 1, 1
		if c_comment then
		comment1, comment2 = line.comment, false
		end
		if line.class == "dialogue" and comment1 == comment2 then
			local line_temp_text = line.text
				if c_comment_bracket then
				line_temp_text = mag.full_strip(line_temp_text)
				end
			if mag.match(line_temp_text,pattern) or mag.match(mag.low(line_temp_text),mag.low(pattern)) and case then
			local text
				if class == "match" then
				text = mag.match(line.text,pattern2)
				elseif class == "full" then
				text = mag.full_strip(line.text)
				end
			text = mag.space_trim(text)
				if mag.gsub(text,"%s+","") ~= "" then
				count = count + 1
				mag.insert(line_index,i)
				mag.insert(line_text,mag.format("(%s) %s -> (%s)",count,mag.zero(total_line,i - first_index),mag.text_limit(text,c_max_char,true)))
				end
			end
		end
	end
	return line_index, line_text
	end

	function jumping(subs,err,ms,cii,cll)
	local gui, buttons, ok, config
	local ci, cl        = cii, cll
	local page          = c_page
	local p_index       = #cl
	local p_count       = mag.ceil(p_index / page)
	local p             = 1
	repeat
	local line_page    = {}
	mag.insert(line_page,"Seç")
	if #cl == 0 then
	buttons = {"Kapat"}
	gui     =
	{
	 {class = "label", x = 0, y = 0, width = 1, height = 1, label = err}
	}
	else
	if p_count == 1                 then buttons = {"Atla","Kapat"}                    end
	if p_count > 1                  then buttons = {"Atla","Sonraki","Kapat"}          end
	if p_count > 1 and p >       1  then buttons = {"Atla","Önceki","Sonraki","Kapat"} end
	if p_count == p and p_count > 1 then buttons = {"Atla","Önceki","Kapat"}           end
	local p_start, p_end = (p - 1) * page, p * page
	if p > 1 then p_start = p_start + 1 end
		for i = p_start, p_end do
		mag.insert(line_page,cl[i])
		end
	gui =
	{
	 {class = "label",                                               x = 0, y = 0, width = 1, height = 1, label = ms}
	,{class = "dropdown", name = "u_comment_bracket", value = "Seç", x = 1, y = 0, width = 1, height = 1, items = line_page}
	,{class = "label",                                               x = 0, y = 1, width = 2, height = 1, label = mag.format("[%s / %s (%s)] - %s / %s",p_index,c_page,c_max_char,p_count,p)}
	}
	end
	ok, config = mag.dlg(gui,buttons)
	if ok == mag.ascii("Önceki") then p = p - 1 end
	if ok == "Sonraki"           then p = p + 1 end
	until ok == "Atla" and config.u_comment_bracket ~= "Seç" or ok == "Kapat"
	if ok == "Atla" then
	local row = mag.n(mag.match(config.u_comment_bracket,"%((%d+)%)"))
	return ci[row]
	end
	end

	function config()
	local gui =
	{
	 {class = "label",                                                   x = 0, y = 0, width = 1, height = 1, label = "Maksimum karakter:"}
	,{class = "edit",  name = "u_max_char", value = c_max_char, min = 1, x = 1, y = 0, width = 1, height = 1}
	,{class = "label",                                                   x = 0, y = 1, width = 1, height = 1, label = mag.wall(" ",17).."Satır sayısı:"}
	,{class = "edit",  name = "u_page",     value = c_page,     min = 1, x = 1, y = 1, width = 1, height = 1, hint = "Bir sayfada kaç adet yorum parantezi gösterileceğine karar verirsiniz."}
	}
	local ok, config = mag.dlg(gui,{"Kaydet","Kapat"})
	if ok == "Kaydet" then
	c_max_char = mag.n(config.u_max_char)
	c_page     = mag.n(config.u_page)
	end
	end

	function finder(subs)
	local cindex, cline
	local ok, config, gui
	gui =
	{
	 {class = "label",x = 0, y = 0, width = 1, height = 1, label = "Devam etmek için aşağıdaki seçeneklerden birini seçiniz."}
	}
	ok, config = mag.dlg(gui,{"Yorum parantezleri","Kelimeler","Kapat"})
	if ok == "Yorum parantezleri" then
	cindex, cline = listing(subs,"{[^\\]-}","{([^\\]-)}","match")
	local jump = jumping(subs,"Girilen kelime bulunamadı.","Yorum parantezleri:",cindex,cline)
	if mag.n(jump) then return {jump} end
	elseif ok == "Kelimeler" then
	gui =
	{
	 {class = "label",                                                           x = 0, y = 0, width = 1, height = 1, label = "Aranacak kelime:"}
	,{class = "edit",     name = "u_query_word",      value = c_query_word,      x = 1, y = 0, width = 1, height = 1}
	,{class = "checkbox", name = "u_comment",         value = c_comment,         x = 0, y = 1, width = 2, height = 1, label = "Yorum satırlarını geç."}
	,{class = "checkbox", name = "u_case_sensitive",  value = c_case_sensitive,  x = 0, y = 2, width = 2, height = 1, label = "Büyük-küçük kelimeleri ara."}
	,{class = "checkbox", name = "u_regex",           value = c_regex,           x = 0, y = 3, width = 2, height = 1, label = "Regex komutlarını aktif et."}
	,{class = "checkbox", name = "u_comment_bracket", value = c_comment_bracket, x = 0, y = 4, width = 2, height = 1, label = "Yorum parantezlerini arama."}
	}
	ok, config = mag.dlg(gui,{"Ara","Kapat"})
		if ok == "Ara" then
		c_query_word      = config.u_query_word
		c_comment         = config.u_comment
		c_case_sensitive  = config.u_case_sensitive
		c_regex           = config.u_regex
		c_comment_bracket = config.u_comment_bracket
			if not config.u_regex then
			config.u_query_word = mag.esc(config.u_query_word)
			end
		cindex, cline = listing(subs,config.u_query_word,"","full",config.u_case_sensitive)
		local jump = jumping(subs,"Girilen kelime bulunamadı.","Bulunan satırlar:",cindex,cline)
		if mag.n(jump) then return {jump} end
		end
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
		mag.register(script_name.."/Aç",      finder)
		mag.register(script_name.."/Ayarlar", config)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end