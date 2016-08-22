	script_name        = "Timer"
	script_description = "Yeni satır oluşturur."
	script_version     = "1.1"
	script_author      = "Magnum357"
	script_mag_version = "1.1.1.9"

	mag_import, mag = pcall(require,"mag")

	hardsub_start_time    = 0
	hardsub_end_time      = 0
	hardsub_count         = 0
	karaoke_line_duration = "0:00:30.00"

	function hardsub(subs,sel,act)
	local current_time = aegisub.ms_from_frame(aegisub.project_properties().video_position)
	if current_time < 0 then
	current_time = 0
	end
	if current_time == 0 or not current_time then
	mag.log(2,"İşlem yapabilmek için video gereklidir.")
	else
		if hardsub_start_time == 0 then
		hardsub_start_time = current_time
		else
		hardsub_end_time = current_time
			if hardsub_start_time > hardsub_end_time then
			mag.log(1,"Başlangıç süresi(%s), bitiş süresinden(%s) büyük.",{aegisub.frame_from_ms(hardsub_start_time),aegisub.frame_from_ms(hardsub_end_time)})
			hardsub_start_time = 0
			hardsub_end_time   = 0
			end
		end
		if hardsub_start_time ~= 0 and hardsub_end_time ~= 0 then
		hardsub_count      = hardsub_count + 1
		local l            = table.copy(subs[act])
		l.layer            = 0
		l.start_time       = hardsub_start_time
		l.end_time         = hardsub_end_time
		l.text             = mag.format("{örnek yazı %s}",hardsub_count)
		l.actor            = ""
		l.effect           = ""
		l.margin_l         = 0
		l.margin_r         = 0
		l.margin_t         = 0
		subs.insert(act + 1,l)
		hardsub_start_time = 0
		hardsub_end_time   = 0
		mag.undo_point()
		return {act + 1}
		end
	end
	end

	function karaoke(subs,sel,act)
	local l              = table.copy(subs[act])
	l.layer              = 0
	l.start_time         = subs[act].end_time
	l.end_time           = l.start_time + mag.time_strip(karaoke_line_duration)
	l.text               = mag.space_trim(mag.cget())
	l.actor              = ""
	l.effect             = ""
	l.margin_l           = 0
	l.margin_r           = 0
	l.margin_t           = 0
	subs.insert(act + 1,l)
	mag.undo_point()
	return {act + 1}
	end

	function usage()
	local gui =
	{
	{class = "label", x = 0, y = 0, width = 1, height = 1, label = "[HARDSUB]"
	                                                             .."\nHardsub yazının başına gelip bu seçeneğe basın."
	                                                             .."\nDaha sonra o yazının sonuna gelerek bir daha"
	                                                             .."\nbu seçeneğe basın. Size o sürelerde yeni bir"
	                                                             .."\nsatır oluşturacaktır."
	                                                             .."\n\n[KARAOKE]"
	                                                             .."\nBu seçeneği seçtiğinizde aktif satırın bitiş süresini"
	                                                             .."\nbaşlangıç süresi diye alıp 30 saniyelik yeni bir satır"
	                                                             .."\noluşturacaktır."}
	}
	local ok, config = mag.dlg(gui,{"Kapat"})
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
		mag.register(script_name.."/Hardsub",  hardsub)
		mag.register(script_name.."/Karaoke",  karaoke)
		mag.register(script_name.."/Kullanım", usage)
		end
	else
	function mag_module() local k = aegisub.dialog.display({{class = "label", label = "Mag modülü bulunamadı.\nBu lua dosyasını kullanmak için Mag modülünü indirip kurmanız gerelidir.\nŞimdi indirme sayfasına gitmek ister misiniz?"}},{"Evet","Kapat"}) if k == "Evet" then os.execute("start "..mag_update_link) end end
	aegisub.register_macro(script_name,script_desription,mag_module)
	end