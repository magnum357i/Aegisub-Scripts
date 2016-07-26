	script_name        = "Karaoke Cleaner"
	script_description = "Şablon efeklerinin oluşturduğu girdileri temizler."
	script_author      = "Magnum357"
	script_version     = "1.2"

	mag_import, mag = pcall(require,"mag")

	c_delete_fx        = true
	c_delete_furigana  = true
	c_strip_apply      = true
	c_reset_template   = true

	function add_macro(subs)
	local gui =
	{
	 {class = "checkbox", name = "u_delete_fx",       value = c_delete_fx,       x = 0, y = 0, width = 1, height = 1, label = "Oluşturulan satırları sil.", hint = "Effect kutucuğunda fx yazan satırları siler."}
	,{class = "checkbox", name = "u_delete_furigana", value = c_delete_furigana, x = 0, y = 1, width = 1, height = 1, label = "Furigana stillerini sil."}
	,{class = "checkbox", name = "u_strip_apply",     value = c_strip_apply,     x = 0, y = 2, width = 1, height = 1, label = "Uygulanan satırları önceki haline çevir."}
	,{class = "checkbox", name = "u_reset_template" , value = c_reset_template,  x = 0, y = 3, width = 1, height = 1, label = "Şablon satırlarının sürelerini sıfırla."}
	}
	local ok, config = mag.dlg(gui,{"Temizle","Kapat"})
	if ok == "Temizle" then
	c_delete_fx       = config.u_delete_fx
	c_delete_furigana = config.u_delete_furigana
	c_strip_apply     = config.u_strip_apply
	c_reset_template  = config.u_reset_template
	local pcs = false
		for i = #subs, 1 , -1 do
		local line = subs[i]
			if c_strip_apply then
				if line.effect == "karaoke" and line.comment then
				pcs          = true
				line.comment = false
				line.effect  = ""
				end
			end
			if c_reset_template then
				if line.comment then
					if line.effect:match("template") or line.effect:match("code") then
						if line.start_time > 0 or line.end_time > 0 then
						pcs             = true
						line.start_time = 0
						line.end_time   = 0
						end
					end
				end
			end
			if pcs then
			subs[i] = line
			end
			if c_delete_fx then
				if line.effect == "fx" then
				pcs = true
				subs.delete(i)
				end
			end
			if c_delete_furigana then
				if line.class == "style" then
					if line.name:match("-furigana") then
					pcs = true
					subs.delete(i)
					end
				end
			end
		end
		if not pcs then
		mag.log(2,"Hiçbir işlem yapılmadı.")
		end
	end
	end

	if mag_import then mag.register(false,add_macro) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro("M357/"..""..script_name,script_desription,mag) end