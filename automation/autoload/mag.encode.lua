	--[[
	## Requirements
	- FFmpeg
	]]

	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Kodla"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Encode"}
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
	in_lang["s_desc"]              = "FFmpeg kullanarak Klip almanızı sağlar."
	in_lang["tabKey1"]             = "Pencere"
	in_lang["guiLabelKey1"]        = "Özel FFmpeg komutları:"
	in_lang["guiLabelKey2"]        = "Ses olsun"
	in_lang["guiLabelKey3"]        = "Alt yazı olsun"
	in_lang["guiLabelKey4"]        = "Çıktı yolu:"
	in_lang["buttonKey1"]          = "Klip"
	in_lang["buttonKey2"]          = "Bütün video"
	in_lang["buttonKey4"]          = "İptal"
	in_lang["key1"]                = "FFmpeg Sonucu:\n{%s} kare, {%s} FPS, {%s}"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Allows you to take clips using FFmpeg."
	in_lang["tabKey1"]             = "Window"
	in_lang["guiLabelKey1"]        = "Custom FFmpeg commands:"
	in_lang["guiLabelKey2"]        = "Put audio"
	in_lang["guiLabelKey3"]        = "Put subtitle"
	in_lang["guiLabelKey4"]        = "Output path:"
	in_lang["buttonKey1"]          = "Clip"
	in_lang["buttonKey2"]          = "Full video"
	in_lang["buttonKey4"]          = "Cancel"
	in_lang["key1"]                = "FFmpeg Output:\n{%s} frames, {%s} FPS, {%s}"
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
	script_version       = "1.1.0"
	script_mag_version   = "1.1.5.0"
	script_file_name     = "mag.encode"
	script_file_ext      = ".lua"

	include_unicode      = true
	include_karaskel     = true
	mag_import, mag      = pcall(require, "mag")

	if mag_import then
	mag.lang             = c_lang_switch

	c_lock_gui           = false
	c_buttons1           = {c_lang.buttonKey1, c_lang.buttonKey2, c_lang.buttonKey4}
	c_cspace_list        = {c_lang.dModeListKey1, c_lang.dModeListKey1, c_lang.dModeListKey2, c_lang.dModeListKey3, c_lang.dModeListKey4}
	c_lastbutton         = ""
	c_audiolist          = {}

	c                    = {}
	c.customcommands     = "-c:v libx265 -c:a aac -b:a 128k -x265-params crf=20"
	c.putaudio           = true
	c.putsubtitle        = true
	c.outputpath         = "$subtitle\\encout.mp4"
	c.selectaudio        = "jpn"

	gui                  = {
		main1              = {
		                 {class = "label",                             x = 0, y = 0, width = 35, height = 1, label = c_lang.guiLabelKey4},
		outputpath     = {class = "edit",     name = "outputpath",     x = 0, y = 1, width = 35, height = 1},
		                 {class = "label",                             x = 0, y = 2, width = 35, height = 1, label = c_lang.guiLabelKey1},
		customcommands = {class = "textbox",  name = "customcommands", x = 0, y = 3, width = 35, height = 4},
		putaudio       = {class = "checkbox", name = "putaudio",       x = 0, y = 7, width = 25, height = 1, label=c_lang.guiLabelKey2},
		putsubtitle    = {class = "checkbox", name = "putsubtitle",    x = 0, y = 8, width = 35, height = 1, label=c_lang.guiLabelKey3}
		}
	}
	end

	function runcommand(content)
	local file = assert(io.popen(content, 'r'))
	local output = file:read('*all')
	file:close()
	return output
	end

	function getfilepath(type)
	if type == "subtitle" then
	return mag.string.format("{%s}\\{%s}",aegisub.decode_path("?script"), aegisub.file_name())
	elseif type == "video" then
	local properties = aegisub.project_properties()
	return properties.video_file
	end
	end

	function pathconversion(path)
	path = mag.gsub(path, "\\", "/")
	return path
	end

	function ffmpegline(startt,endt)
	local fcommand = ""
	--input video
	fcommand = fcommand..mag.string.format("-i \"{%s}\"", pathconversion(getfilepath("video")))
	--trim
	if mag.n(startt) ~= 0 and mag.n(endt) ~= 0 then
	fcommand = fcommand.." "..mag.string.format("-ss {%s} -to {%s}", mag.convert.ms_to_time(startt), mag.convert.ms_to_time(endt))
	end
	--custom commands
	if not mag.is.empty(c.customcommands) then
	fcommand = fcommand.." "..c.customcommands
	end
	--subtitle
	if c.putsubtitle then
	local subpath = pathconversion(getfilepath("subtitle"))
	subpath = mag.gsub(subpath, ":", "\\:")
		if mag.match(fcommand, "%-vf%s+\"") then
		fcommand = mag.gsub(fcommand, "(%-vf%s+\"[^\"]*)", "%1"..mag.string.format(",ass='{%s}'", subpath))
		else
		fcommand = fcommand.." "..mag.string.format("-vf \"ass='{%s}'\"", subpath)
		end
	end
	--audio
	if not c.putaudio then
	fcommand = fcommand.." ".."-an"
	else if #c_audiolist > 1 then
	local audioindex = 1
    	for aindex, alang in pairs(c_audiolist) do
        	if alang == c.selectaudio then
            audioindex = aindex
			break
        	end
    	end
	fcommand = fcommand.." "..mag.string.format("-map 0:0 -map 0:{%s}", audioindex)
	end
	end
	--quiet mode
	--fcommand = fcommand.." ".."-v quiet"
	--fcommand = fcommand.." ".."-stats"
	--overwrite
	fcommand = fcommand.." ".."-y"
	--output video
	local outputpath = c.outputpath
	outputpath       = mag.gsub(outputpath, "$subtitle", aegisub.decode_path("?script"))
	outputpath       = mag.gsub(outputpath, "$video",    aegisub.decode_path("?video"))
	outputpath       = pathconversion(outputpath)
	fcommand         = fcommand.." ".."\""..outputpath.."\""
	mag.show.log(fcommand)
	return mag.string.format("ffmpeg {%s} 2>&1", fcommand)
	end

	function encodevideo(subs,sel)
	local vstart, vend = 0, 0
	if c_lastbutton == mag.convert.ascii(c_buttons1[1]) then
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
	end
	mag.show.log("Encoding...")
	local output = runcommand(ffmpegline(vstart,vend))
	estatistics(output)
	end

	function estatistics(output)
	local staline = mag.match(output,"\n(encoded [^\n]*)\n")
	if staline then
	local fps = mag.match(staline, "([%d%.]+) fps")
	local totalframe = mag.match(staline, "encoded ([%d]+) frames")
	local elevatedtime = mag.match(staline, "frames in ([%d%.]+[sm])")
	if mag.n(totalframe) > 0 then mag.show.log(mag.string.format(c_lang.key1,totalframe,fps,elevatedtime)) end
	else
	mag.show.log(output)
	end
	end

	function getaudiolist()
    local file   = io.popen(mag.string.format("ffprobe -v error -select_streams a -show_entries stream=index,codec_type:stream_tags=language -of csv=p=0 \"{%s}\" 2>&1", pathconversion(getfilepath("video"))))
    local output = file:read("*all")
    file:close()
	if mag.match(output, "1,audio,") then
	local audiolist = mag.string.split(mag.gsub(output, "%d+,audio,", ""), "\n")
	mag.array.remove(audiolist, #audiolist)
	return audiolist
	else
	mag.show.log("DK3M1")
	end
    return nil
	end

	function add_macro1(subs, sel)
	mag.config.put(gui.main1)
	if #c_audiolist == 0 then c_audiolist = getaudiolist() end
	if #c_audiolist > 1 then
	local selectaudio = (mag.array.search(c_audiolist, c.selectaudio)) and c.selectaudio or c_audiolist[1]
	gui.main1.selectaudio = {class = "dropdown", name = "selectaudio", x = 25, y = 7, width = 10, height = 1, items=c_audiolist, value=selectaudio}
	end
	local ok, config = mag.window.dialog(gui.main1, c_buttons1)
	mag.config.take(config)
	if ok == mag.convert.ascii(c_buttons1[1]) or ok == mag.convert.ascii(c_buttons1[2]) then
	c_lastbutton = ok
	encodevideo(subs, sel)
	end
	end

	function check_macro1(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(add_macro1, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
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