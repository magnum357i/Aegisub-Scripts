	script_name="Fix Timing"
	script_description="Ön izlemede görünmeyen satırların zamanlamasını düzeltir."
	script_author="Magnum357"
	script_version="1.1"

	function fix_timing(subs)
	pcs = false
	local st, et
	for i = 1, #subs do
	if subs[i].class == "dialogue" then
	line = subs[i]
	st = aegisub.ms_from_frame(aegisub.frame_from_ms(line.start_time))
	et = aegisub.ms_from_frame(aegisub.frame_from_ms(line.end_time))
	if line.start_time > st or line.end_time > et then
	pcs = true
	line.start_time = st
	line.end_time = et
	subs[i] = line
	end
	end
	end
	if pcs == true then prog("Satırlar kare sürelerine göre zamanlanıyor...")
	else aegisub.log("Düzeltilecek zaman bulunamadı.") end
	aegisub.set_undo_point(script_name)
	end

	function delay()
	local st = ""
	for i = 0, 50000 do
	st = st .. i
	end
	return st
	end

	function prog(str)
	aegisub.progress.task(string.format("%s",str))
	aegisub.progress.set(100)
	delay()
	end

	aegisub.register_macro(script_name,script_description,fix_timing)
