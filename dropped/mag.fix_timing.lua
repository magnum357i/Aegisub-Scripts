	script_name        = "Fix Timing"
	script_description = "Satır sürelerini kare sürelerine göre zamanlayarak ön izlemede görünmeyen satırların görünmesini sağlar."
	script_author      = "Magnum357"
	script_version     = "1.2"

	mag_import, mag = pcall(require,"mag")

	function add_macro(subs)
	if not aegisub.frame_from_ms(0) then
	mag.log(1,"Bir hata oluştu. Video yükleyerek tekrar deneyiniz.")
	else
	local pcs = false
		for i = 1, #subs do
			if subs[i].class == "dialogue" then
			local line    = subs[i]
			local sf_time = frame_time(line.start_time)
			local ef_time = frame_time(line.end_time)
				if line.start_time > sf_time or ef_time < line.end_time then
				pcs             = true
				line.start_time = sf_time
				line.end_time   = ef_time
				subs[i]         = line
				end
			end
		end
		if not pcs then
		mag.log(2,"Tüm satırlar zaten kare sürelerine zamanlanmış.")
		end
	end
	aegisub.set_undo_point(script_name)
	end

	function frame_time(time) return aegisub.ms_from_frame(aegisub.frame_from_ms(time)) end

	if mag_import then mag.register(false,add_macro)
	else function mag()
	local k = aegisub.dialog.display({{class = "label", label="Mag modülü bulunamadı. \nBu lua dosyasını kullanmak için Mag modülünü İndirmek ister misiniz?"}},{"Evet","Kapat"})
	if k == "Evet" then os.execute("start https://github.com/magnum357i/Magnum-s-Aegisub-Scripts") end end
	aegisub.register_macro(script_name,script_desription,mag) end