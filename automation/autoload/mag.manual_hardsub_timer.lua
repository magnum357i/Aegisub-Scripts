	script_name       = "Manual Hardsub Timer"
	script_desription = "Manuel olarak hardsub alt yazıya zamanlama yapmaya yarar."
	script_version    = "1.0.2"
	script_author     = "Magnum357"

	mag_import, mag = pcall(require,"mag")

	start_time = 0
	end_time   = 0
	count      = 0

	function timing(subs,sel,act)
	local current_time = aegisub.ms_from_frame(aegisub.project_properties().video_position)
	if current_time < 0 then current_time = 0 end
	if current_time == 0 or not current_time then
	mag.log(2,"İşlem yapabilmek için video gereklidir.")
	else
		if start_time == 0 then
		start_time = current_time
		else
		end_time = current_time
			if start_time > end_time then
			mag.log(1,"Başlangıç süresi(%s), bitiş süresinden(%s) büyük.",{aegisub.frame_from_ms(start_time),aegisub.frame_from_ms(end_time)})
			start_time = 0
			end_time   = 0
			end
		end
		if start_time ~= 0 and end_time ~= 0 then
		count = count + 1
		local l = table.copy(subs[act])
		l.layer      = 0
		l.start_time = start_time
		l.end_time   = end_time
		l.text       = mag.format("{örnek yazı %s}",count)
		l.actor      = ""
		l.effect     = ""
		l.margin_l   = 0
		l.margin_r   = 0
		l.margin_t   = 0
		subs.insert(act + 1,l)
		start_time   = 0
		end_time     = 0
		return {act + 1}
		end
	end
	end
	
	if mag_import then mag.register(script_name,timing) else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end
