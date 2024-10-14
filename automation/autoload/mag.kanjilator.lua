	--[[
	## Requirements
	- Conda & Whisper (https://www.youtube.com/watch?v=R5pZPpIIUzA&loop=0)
	- FFmpeg
	]]

	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Kanji Makinesi"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Kanjilator"}
	}
	local lang_list        = {}
	local script_name_list = {}
	for i = 1, #langs do
	lang_list[langs[i].lang_key]        = langs[i].lang_name
	script_name_list[langs[i].lang_key] = langs[i].script_name
	end
	if lang == langs[1].lang_key then
	in_lang["module_incompatible"] = "Mag modülünün kurulu sürümü bu lua dosyası ile uyumsuz!\n\nModül dosyasının en az \"%s\" sürümü veya daha üstü gerekiyor.\n\n\nŞimdi indirme sayfasına gitmek ister misiniz?"
	in_lang["module_not_found"]    = "Mag modülü bulunamadı!\n\nBu lua dosyasını kullanmak için Mag modülünü indirip Aegisub programı kapalıyken\n\"Aegisub/automation/include/\" dizinine taşımanız gerekiyor.\n\n\nŞimdi indirme sayfasına gitmek ister misiniz?"
	in_lang["module_yes"]          = "Git"
	in_lang["module_no"]           = "Daha Sonra"
	in_lang["s_name"]              = langs[1].script_name
	in_lang["s_desc"]              = "Klip almanızı sağlar."
	in_lang["tabKey1"]             = "Pencere"
	in_lang["key1"]                = "SONUÇ:\n{%s}"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Allows you to take clips using ffmpeg."
	in_lang["tabKey1"]             = "Window"
	in_lang["key1"]                = "RESULT:\n{%s}"
	end
	return in_lang, lang_list, script_name_list
	end

	c_lang_switch        = "en"
	c_lang,
	c_lang_list,
	c_script_name_list   = lang_switch_keys(c_lang_switch)

	script_name          = c_lang.s_name
	script_description   = c_lang.s_desc
	script_author        = "Magnum357"
	script_version       = "1.0.0"
	script_mag_version   = "1.1.5.0"
	script_file_name     = "mag.kanjilator"
	script_file_ext      = ".lua"

	include_unicode      = true
	include_karaskel     = true
	mag_import, mag      = pcall(require, "mag")

	if mag_import then
	mag.lang             = c_lang_switch

	c_lock_gui           = false
	end

	function runcommand(content)
	local file = io.popen(content, 'r')
	local output = file:read('*all')
	file:close()
	return output
	end

	function getfilepath(type)
	if type == "subtitle" then
	return mag.string.format("{%s}{%s}",aegisub.decode_path("?script\\"), aegisub.file_name())
	elseif type == "video" then
	local properties = aegisub.project_properties()
	return properties.video_file
	end
	end

	function ffmpegline(startt,endt)
	local fcommand = ""
	--input video
	fcommand = fcommand..mag.string.format("-i \"{%s}\"", getfilepath("video"))
	--trim
	fcommand = fcommand.." "..mag.string.format("-ss {%s} -to {%s}", mag.convert.ms_to_time(startt), mag.convert.ms_to_time(endt))
	--overwrite
	fcommand = fcommand.." ".."-y"
	--output video
	fcommand = fcommand.." "..mag.string.format("\"{%s}kanjilatoraudio.wav\"", mag.gsub(aegisub.decode_path("?temp\\"), "\\", "\\\\"))
	return mag.string.format("ffmpeg {%s} 2>&1", fcommand)
	end

	function whisperline()
	local wcommand = ""
	--input audio
	wcommand = wcommand..mag.string.format("\"{%s}\"", aegisub.decode_path("?temp\\kanjilatoraudio.wav"))
	--language
	wcommand = wcommand..mag.string.format(" --language {%s}", "Japanese")
	--model
	wcommand = wcommand..mag.string.format(" --model {%s}", "large")
	--format
	wcommand = wcommand..mag.string.format(" --output_format {%s}", "txt")
	--temp
	wcommand = wcommand..mag.string.format(" --output_dir \"{%s}\\\\\"", mag.gsub(aegisub.decode_path("?temp"), "\\", "\\\\"))
	return mag.string.format("@chcp 65001 > nul && @set PYTHONIOENCODING=utf-8 && conda activate whisper && whisper {%s}", wcommand)
	end

	function add_macro1(subs, sel)
	local vstart, vend = 0, 0
	local lines_index = mag.line.index(subs, sel, mag.window.lang.message("selected_lines"), false, false)
	for i = 1, #lines_index do
	index = lines_index[i]
	line  = subs[index]
		if line.start_time < vstart or vstart == 0 then
		vstart = line.start_time
		end
		if line.end_time > vend or vend == 0 then
		vend = line.end_time
		end
	end
	mag.show.log("Extracting audio...")
	runcommand(ffmpegline(vstart,vend))
	mag.show.log("Creating kanji...")
	local output = runcommand(whisperline())
	output = mag.gsub(output, "%[[^%]]+%] ", "")
	local kanjiresult = ""
	local kcounter    = 1
	local linebreak   = ""
	for kanjiline in mag.gmatch(output, "([^\n]*)\n") do
	kanjiresult = kanjiresult..linebreak..mag.string.format("#{%s} ", kcounter)..kanjiline
	kcounter    = kcounter + 1
	linebreak   = "\n"
	end
	mag.show.log(mag.string.format(c_lang.key1, kanjiresult))
	end

	function check_macro1(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro1, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	end
	end

	function mag_redirect_gui()
	local mag_module_link = "https://github.com/magnum357i/Magnum-s-Aegisub-Scripts"
	local k = aegisub.dialog.display({{class = "label", label = mag_gui_message}}, {c_lang.module_yes, c_lang.module_no})
	if k == c_lang.module_yes then os.execute("start "..mag_module_link) end
	end

	if mag_import then
		if mag_module_version:gsub("%.", "") < script_mag_version:gsub("%.", "") then
		mag_gui_message = string.format(c_lang.module_incompatible, script_mag_version)
		aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
		else
		mag.window.register(script_name.."/"..c_lang.tabKey1, check_macro1)
		mag.window.lang.register()
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end