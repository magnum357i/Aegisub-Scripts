	script_name        = "List Comments"
	script_description = "Listelediği yorum parantezlerine atlar."
	script_version     = "1.0"
	script_author      = "Magnum357"

	mag_import, mag = pcall(require,"mag")

	c_page     = 10
	c_max_char = 60

	function list_comments(subs)
	local count = 0
	local line_index, line_comment = {}, {}
	for i = 1, #subs do
	local line = subs[i]
		if line.class == "dialogue" then
		local cbc = mag.ccount(line.text,"{[^\\]-}")
			if cbc == 1 then
			count = count + 1
			local comment_text = mag.match(line.text,"{([^\\]-)}")
			mag.insert(line_index,i)
			mag.insert(line_comment,mag.format("(%s) %s",count,mag.text_limit(comment_text,c_max_char,true)))
			end
		end
	end
	return line_index, line_comment
	end

	function jumping_comments(subs)
	local gui, buttons, ok, config
	local cindex, cline = list_comments(subs)
	local page          = c_page
	local p_index       = #cline
	local p_count       = mag.ceil(p_index / page)
	local p             = 1
	repeat
	local cline_page    = {}
	mag.insert(cline_page,"Seç")
	if #cline == 0 then
	buttons = {"Kapat"}
	gui     =
	{
	 {class = "label", x = 0, y = 0, width = 1, height = 1, label = "Yorum parantezi bulunamadı."}
	}
	else
	if p_count == 1                 then buttons = {"Atla","Kapat"}                    end
	if p_count > 1                  then buttons = {"Atla","Sonraki","Kapat"}          end
	if p_count > 1 and p >       1  then buttons = {"Atla","Önceki","Sonraki","Kapat"} end
	if p_count == p and p_count > 1 then buttons = {"Atla","Önceki","Kapat"}           end
	local p_start, p_end = (p - 1) * page, p * page
	if p > 1 then p_start = p_start + 1 end
		for i = p_start, p_end do
		mag.insert(cline_page,cline[i])
		end
	gui =
	{
	 {class = "label",                                               x = 0, y = 0, width = 1, height = 1, label = "Yorum parantezleri:"}
	,{class = "dropdown", name = "u_comment_bracket", value = "Seç", x = 1, y = 0, width = 1, height = 1, items = cline_page}
	,{class = "label",                                               x = 0, y = 1, width = 1, height = 1, label = mag.format("%s - %s / %s",p_index,p_count,p)}
	}
	end
	ok, config = mag.dlg(gui,buttons)
	if ok == mag.ascii("Önceki") then p = p - 1 end
	if ok == "Sonraki"           then p = p + 1 end
	until ok == "Atla" and config.u_comment_bracket ~= "Seç" or ok == "Kapat"
	if ok == "Atla" then
	local row = mag.n(mag.match(config.u_comment_bracket,"%((%d+)%)"))
	return {cindex[row]}
	end
	end

	function config_comments()
	local gui =
	{
	 {class = "label",                                                   x = 0, y = 0, width = 1, height = 1, label = "Maksimum karakter:"}
	,{class = "edit",  name = "u_max_char", value = c_max_char, min = 1, x = 1, y = 0, width = 1, height = 1}
	,{class = "label",                                                   x = 0, y = 1, width = 1, height = 1, label = "Satır sayısı:"}
	,{class = "edit",  name = "u_page",     value = c_page,     min = 1, x = 1, y = 1, width = 1, height = 1, hint = "Bir sayfada kaç adet yorum parantezi gösterileceğine karar verirsiniz."}
	}
	local ok, config = mag.dlg(gui,{"Kaydet","Kapat"})
	if ok == "Kaydet" then
	c_max_char = mag.n(config.u_max_char)
	c_page     = mag.n(config.u_page)
	end
	end
	
	if mag_import then
	mag.register(script_name.."/Aç",jumping_comments)
	mag.register(script_name.."/Ayarlar",config_comments)
	else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro("M357/"..""..script_name,script_desription,mag) end