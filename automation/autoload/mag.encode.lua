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
	in_lang["s_desc"]              = "FFmpeg kullanarak klip almanızı veya gif oluşturmanızı sağlar."
	in_lang["tabKey1"]             = "Pencere"
	in_lang["guiLabelKey1"]        = "Özel FFmpeg komutları:"
	in_lang["guiLabelKey2"]        = "Ses olsun"
	in_lang["guiLabelKey3"]        = "Alt yazı olsun"
	in_lang["guiLabelKey4"]        = "Çıktı yolu:"
	in_lang["guiLabelKey5"]        = "FPS:"
	in_lang["guiLabelKey6"]        = "Genişlik:"
	in_lang["guiLabelKey7"]        = "[GELİŞMİŞ AYARLAR]"
	in_lang["guiLabelKey8"]        = "Filtreler:"
	in_lang["guiLabelKey9"]        = "Palettegen:"
	in_lang["guiLabelKey10"]       = "Paletteuse:"
	in_lang["buttonKey1"]          = "Klip"
	in_lang["buttonKey2"]          = "Bütün video"
	in_lang["buttonKey3"]          = "GIF"
	in_lang["buttonKey4"]          = "İptal"
	in_lang["buttonKey5"]          = "Yap"
	in_lang["buttonKey6"]          = "Geri"
	in_lang["key1"]                = "Video Oluşturuldu: {%s} kare, {%s} FPS, {%s}"
	in_lang["key2"]                = "GIF Oluşturuldu"
	in_lang["key3"]                = "Kaydedilmemiş değişiklikler var! Lütfen dosyayı kaydedin."
	in_lang["key4"]                = "Ses listesi alınıyor... Bu işlem program açıldığında tek seferliğine yapılır."
	in_lang["key5"]                = "FFmpeg Komutunuz:\n{%s}"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Allows you to take clips or create gif using FFmpeg."
	in_lang["tabKey1"]             = "Window"
	in_lang["guiLabelKey1"]        = "Custom FFmpeg commands:"
	in_lang["guiLabelKey2"]        = "Put audio"
	in_lang["guiLabelKey3"]        = "Put subtitle"
	in_lang["guiLabelKey4"]        = "Output path:"
	in_lang["guiLabelKey5"]        = "FPS:"
	in_lang["guiLabelKey6"]        = "Width:"
	in_lang["guiLabelKey7"]        = "[ADVANCED SETTINGS]"
	in_lang["guiLabelKey8"]        = "Filters:"
	in_lang["guiLabelKey9"]        = "Palettegen:"
	in_lang["guiLabelKey10"]       = "Paletteuse:"
	in_lang["buttonKey1"]          = "Clip"
	in_lang["buttonKey2"]          = "Full video"
	in_lang["buttonKey3"]          = "GIF"
	in_lang["buttonKey4"]          = "Cancel"
	in_lang["buttonKey5"]          = "Make"
	in_lang["buttonKey6"]          = "Back"
	in_lang["key1"]                = "Video Created: {%s} frames, {%s} FPS, {%s}"
	in_lang["key2"]                = "GIF Created: {%s}"
	in_lang["key3"]                = "There are unsaved changes! Please save the file."
	in_lang["key4"]                = "Getting audio list... This process runs just once when the program starts."
	in_lang["key5"]                = "Your FFmpeg Command:\n{%s}"
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
	script_version       = "1.4.0"
	script_mag_version   = "1.1.5.0"
	script_file_name     = "mag.encode"
	script_file_ext      = ".lua"

	include_unicode      = true
	include_karaskel     = true
	mag_import, mag      = pcall(require, "mag")

	if mag_import then
	mag.lang             = c_lang_switch

	c_lock_gui           = false
	c_buttons1           = {c_lang.buttonKey1, c_lang.buttonKey3, c_lang.buttonKey2, c_lang.buttonKey4}
	c_buttons2           = {c_lang.buttonKey5, c_lang.buttonKey6, c_lang.buttonKey4}
	c_lastbutton         = ""
	c_audiolist          = {}

	c                    = {}
	c.customcommands     = "-c:v libx265 -c:a aac -b:a 192k -x265-params crf=23 -vf \"scale=1280:720\""
	c.putaudio           = true
	c.putsubtitle        = true
	c.putsubtitle2       = false
	c.outputpath         = "$subtitle\\output{n}.mp4"
	c.outputpath2        = "$subtitle\\scene{n}.gif"
	c.selectaudio        = "jpn"
	c.giffps             = "20"
	c.gifwidth           = "620"
	c.giffilter          = "fps=$fps,scale=$width:-1:flags=lanczos"
	c.palettegenparams   = "stats_mode=diff"
	c.paletteuseparams   = "dither=bayer:bayer_scale=5:diff_mode=rectangle"

	gui = {
		main1 = {
			             {class = "label",                             x = 0, y = 0, width = 35, height = 1, label = c_lang.guiLabelKey4},
		outputpath     = {class = "edit",     name = "outputpath",     x = 0, y = 1, width = 35, height = 1},
		   	             {class = "label",                             x = 0, y = 2, width = 35, height = 1, label = c_lang.guiLabelKey1},
		customcommands = {class = "textbox",  name = "customcommands", x = 0, y = 3, width = 35, height = 4},
		putaudio       = {class = "checkbox", name = "putaudio",       x = 0, y = 7, width = 25, height = 1, label=c_lang.guiLabelKey2},
		putsubtitle    = {class = "checkbox", name = "putsubtitle",    x = 0, y = 8, width = 35, height = 1, label=c_lang.guiLabelKey3}
		},
		main2 = {
		   	               {class = "label",                               x = 0, y = 0,  width = 35, height = 1, label = c_lang.guiLabelKey4},
		outputpath2      = {class = "edit",     name = "outputpath2",      x = 0, y = 1,  width = 35, height = 1},
		   	               {class = "label",                               x = 0, y = 2,  width = 5,  height = 1, label = c_lang.guiLabelKey5},
		giffps           = {class = "intedit",  name = "giffps",           x = 0, y = 3,  width = 5,  height = 1},
		   	               {class = "label",                               x = 0, y = 4,  width = 5,  height = 1, label = c_lang.guiLabelKey6},
		gifwidth         = {class = "intedit",  name = "gifwidth",         x = 0, y = 5,  width = 5,  height = 1},
		putsubtitle2     = {class = "checkbox", name = "putsubtitle2",     x = 0, y = 6,  width = 5,  height = 1, label=c_lang.guiLabelKey3},
		                   {class = "label",                               x = 0, y = 8,  width = 5,  height = 1, label = c_lang.guiLabelKey7},
		                   {class = "label",                               x = 0, y = 9,  width = 5,  height = 1, label = c_lang.guiLabelKey8},
		giffilter        = {class = "edit",     name = "giffilter",        x = 0, y = 10, width = 35, height = 1},
		                   {class = "label",                               x = 0, y = 11, width = 5,  height = 1, label = c_lang.guiLabelKey9},
		palettegenparams = {class = "edit",     name = "palettegenparams", x = 0, y = 12, width = 35, height = 1},
		                   {class = "label",                               x = 0, y = 13, width = 5,  height = 1, label = c_lang.guiLabelKey10},
		paletteuseparams = {class = "edit",     name = "paletteuseparams", x = 0, y = 14, width = 35, height = 1}
		}
	}
	end

	function clipline(startt,endt)
	local fcommand = ""
	--trim
	if mag.n(startt) ~= 0 and mag.n(endt) ~= 0 then
	fcommand = fcommand..mag.string.format("-ss {%s} -to {%s}", startt / 1000, endt / 1000)
	end
	--input video
	fcommand = fcommand.." "..mag.string.format("-i \"{%s}\"", pathconversion(getfilepath("video")))
	--sync and reset
	fcommand = fcommand.." -copyts -avoid_negative_ts 2 -map_metadata -1 -map_chapters -1"
	--custom commands
	if not mag.is.empty(c.customcommands) then
	fcommand = fcommand.." "..c.customcommands
	end
	--subtitle
	if c.putsubtitle then
	local subpath = pathconversion(getfilepath("subtitle"))
	subpath       = mag.gsub(subpath, ":", "\\:")
		if mag.match(fcommand, "%-vf%s+\"") then
		fcommand = mag.gsub(fcommand, "(%-vf%s+\"[^\"]*)", "%1"..mag.string.format(",ass='{%s}'", subpath))
		else
		fcommand = fcommand.." "..mag.string.format("-vf \"ass='{%s}'\"", subpath)
		end
	end
	--audio
	if not c.putaudio then
	fcommand = fcommand.." -an"
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
	if not mag.match(c.outputpath, "{n}") then
	fcommand = fcommand.." -y"
	end
	--progress
	fcommand = fcommand.." -progress pipe:1 -nostats"
	--bench
	fcommand = fcommand.." -benchmark"
	--output video
	local outputpath = c.outputpath
	outputpath       = mag.gsub(outputpath, "$subtitle", aegisub.decode_path("?script"))
	outputpath       = mag.gsub(outputpath, "$video",    aegisub.decode_path("?video"))
	outputpath       = pathconversion(outputpath)
	if mag.match(outputpath, "{n}") then
		for i = 1, 999 do
			if not fileexists(mag.gsub(outputpath, "{n}", tostring(i))) then
			outputpath = mag.gsub(outputpath, "{n}", tostring(i))
			break
			end
		end
	end
	fcommand = fcommand.." ".."\""..outputpath.."\""
	fcommand = mag.string.format("ffmpeg {%s} 2>&1", fcommand)
	mag.show.log(mag.string.format(c_lang.key5, fcommand))
	return fcommand
	end

	function gifline(startt,endt)
	local fcommand = ""
	--trim
	fcommand = fcommand..mag.string.format("-ss {%s} -to {%s}", startt / 1000, endt / 1000)
	--input video
	fcommand = fcommand.." "..mag.string.format("-i \"{%s}\"", pathconversion(getfilepath("video")))
	--sync
	fcommand = fcommand.." -copyts"
	--filter and palette
	local convertedfilter = c.giffilter
	convertedfilter = mag.gsub(convertedfilter, "$fps",   c.giffps)
	convertedfilter = mag.gsub(convertedfilter, "$width", c.gifwidth)
	fcommand        = fcommand.." "..mag.string.format("-filter_complex \"{%s},split[a][b];[a]palettegen[p];[b][p]paletteuse\"", convertedfilter)
	--palettegen
	if not mag.is.empty(c.palettegenparams) then
	fcommand = mag.gsub(fcommand, "palettegen", "palettegen="..c.palettegenparams)
	end
	--paletteuse
	if not mag.is.empty(c.paletteuseparams) then
	fcommand = mag.gsub(fcommand, "paletteuse", "paletteuse="..c.paletteuseparams)
	end
	--subtitle
	if c.putsubtitle2 then
	local subpath = pathconversion(getfilepath("subtitle"))
	subpath       = mag.gsub(subpath, ":", "\\:")
	fcommand      = mag.gsub(fcommand, "(%-filter_complex%s+\")", "%1"..mag.string.format("ass='{%s}',", subpath))
	end
	--overwrite
	if not mag.match(c.outputpath, "{n}") then
	fcommand = fcommand.." -y"
	end
	--progress
	fcommand = fcommand.." -progress pipe:1 -nostats"
	--bench
	fcommand = fcommand.." -benchmark"
	--output video
	local outputpath = c.outputpath2
	outputpath       = mag.gsub(outputpath, "$subtitle", aegisub.decode_path("?script"))
	outputpath       = mag.gsub(outputpath, "$video",    aegisub.decode_path("?video"))
	outputpath       = pathconversion(outputpath)
	if mag.match(outputpath, "{n}") then
		for i = 1, 999 do
			if not fileexists(mag.gsub(outputpath, "{n}", tostring(i))) then
			outputpath = mag.gsub(outputpath, "{n}", tostring(i))
			break
			end
		end
	end
	fcommand = fcommand.." ".."\""..outputpath.."\""
	fcommand = mag.string.format("ffmpeg {%s} 2>&1", fcommand)
	mag.show.log(mag.string.format(c_lang.key5, fcommand))
	return fcommand
	end

	function trimvalues(subs,sel)
	local vstart, vend = 0, 0
	local lines_index = mag.line.index(subs, sel, mag.window.lang.message("selected_lines"), false, false)
	for i = 1, #lines_index do
	index = lines_index[i]
	line  = subs[index]
	if line.start_time < vstart or vstart == 0 then vstart = line.start_time end
	if line.end_time > vend or vend == 0       then vend   = line.end_time   end
	end
	return vstart, vend
	end

	function makeclip(subs,sel)
	local vstart, vend = 0, 0
	if c_lastbutton == mag.convert.ascii(c_buttons1[1]) then
	vstart, vend = trimvalues(subs,sel)
	end
	local duration = (vstart > 0 and vend > 0) and (vend - vstart) / 1000 or getvideoduration()
	local output   = runffmpegcommand(clipline(vstart, vend), duration, "Encoding...")
	estatistics(output, "clip")
	end

	function makegif(subs,sel)
	local vstart, vend = trimvalues(subs, sel)
	local duration     = (vend - vstart) / 1000
	local output       = runffmpegcommand(gifline(vstart, vend), duration, "Creating...")
	estatistics(output, "gif")
	end

	function estatistics(output,type)
	local rtime = mag.match(output,"\nbench:.*rtime=%s*([%d%.]+.)\n")
	if rtime then
	local totalframe, fps = mag.match(output, "frame=%s*(%d+)%s*fps=%s*([%d%.]+)%s*q=%s*[%-%d%.]+")
		if not totalframe or not fps then
		totalframe = 0
		fps        = 0
		else
		fps   = math.floor(mag.n(fps))
		rtime = mag.gsub(rtime, "%.%d+", "")
		end
		if type == "clip" then
		mag.show.log(mag.string.format(c_lang.key1, totalframe, fps, rtime))
		else
		mag.show.log(mag.string.format(c_lang.key2, rtime))
		end
	else
	mag.show.log(1, output)
	end
	end

	function getaudiolist()
	local ffmpegline = mag.string.format("ffprobe -v error -select_streams a -show_entries stream=index,codec_type:stream_tags=language -of csv=p=0 \"{%s}\" 2>&1", pathconversion(getfilepath("video")))
    local file       = io.popen(ffmpegline)
    local output     = file:read("*all")
    file:close()
	if mag.match(output, "1,audio,") then
	local audiolist = mag.string.split(mag.gsub(output, "%d+,audio,", ""), "\n")
	mag.array.remove(audiolist, #audiolist)
	return audiolist
	else
	mag.show.log(mag.string.format(c_lang.key5, ffmpegline))
	mag.show.log(1, output)
	end
    return nil
	end

	function getvideoduration()
	local ffmpegline = mag.string.format("ffprobe -v error -show_entries format=duration -of default=nk=1:nw=1 \"{%s}\"  2>&1", pathconversion(getfilepath("video")))
  	local file       = io.popen(ffmpegline, 'r')
	local output     = file:read("*all")
	file:close()
	local duration   = mag.match(output, "([%d%.]+)")
	if duration then return mag.match(duration, "%d+") end
	mag.show.log(mag.string.format(c_lang.key5, ffmpegline))
	mag.show.log(1, output)
	return 0
	end

	function fileexists(name)
	local f = io.open(name, 'r')
	if f ~= nil then
	io.close(f)
	return true
	else
    return false
	end
	end

	function runffmpegcommand(content,duration,message)
	local file       = io.popen(content, 'r')
	local progressok = false
	local output     = ""
	local boxcount   = 20
	for line in file:lines() do
	output = output..line.."\n"
    local h, m, s = line:match("out_time=(%d+):(%d+):(%d+)")
    	if h and m and s and mag.n(h) < 1000 and mag.n(duration) > 0 then
			if not progressok then
			progressok = true
			mag.show.log(message)
			end
        local elapsed   = mag.n(h) * 3600 + mag.n(m) * 60 + mag.n(s)
        local progress  = elapsed / duration
        local eta       = math.floor(duration - elapsed)
        if eta < 0 then eta = 0 end
        local filledbox = math.floor(progress * boxcount)
        local emptybox  = boxcount - filledbox
        local bar       = string.rep("◼", filledbox)..string.rep("◻", emptybox)
        mag.show.log(mag.string.format("[{%s}] {%s}% | {%s}", bar, math.floor(progress * 100), mag.convert.ms_to_time(eta * 100)))
    	end
	end
	if progressok then mag.show.log(mag.string.format("[{%s}] {%s}% | {%s}", string.rep("◼", boxcount), 100, "0:00:00.00")) end
	file:close()
	return output
	end

	function getfilepath(type)
	if type == "subtitle" then
	return mag.string.format("{%s}\\{%s}", aegisub.decode_path("?script"), aegisub.file_name())
	elseif type == "video" then
	local properties = aegisub.project_properties()
	return properties.video_file
	end
	end

	function pathconversion(path)
	path = mag.gsub(path, "\\", "/")
	return path
	end

	function add_macro1(subs, sel)
	if #c_audiolist == 0 then
	mag.show.log(3, c_lang.key4)
	c_audiolist = getaudiolist()
	end
	if #c_audiolist > 1 then
	local selectaudio = (mag.array.search(c_audiolist, c.selectaudio)) and c.selectaudio or c_audiolist[1]
	gui.main1.selectaudio = {class = "dropdown", name = "selectaudio", x = 25, y = 7, width = 10, height = 1, items=c_audiolist, value=selectaudio}
	end
	local ok, config
	repeat
		if ok == mag.convert.ascii(c_buttons1[2]) then
		mag.config.put(gui.main2)
		ok, config = mag.window.dialog(gui.main2, c_buttons2)
		else
		mag.config.put(gui.main1)
		ok, config = mag.window.dialog(gui.main1, c_buttons1)
		end
	mag.config.take(config)
	until ok == mag.convert.ascii(c_buttons1[1]) or ok == mag.convert.ascii(c_buttons1[3]) or ok == mag.convert.ascii(c_buttons1[4]) or ok == mag.convert.ascii(c_buttons2[1])
	if ok == mag.convert.ascii(c_buttons1[1]) or ok == mag.convert.ascii(c_buttons1[3]) then
		if c.putsubtitle and aegisub.gui and aegisub.gui.is_modified() then
		mag.show.log(1, c_lang.key3)
		else
		c_lastbutton = ok
		makeclip(subs, sel)
		end
	elseif ok == mag.convert.ascii(c_buttons2[1]) then
		if c.putsubtitle2 and aegisub.gui and aegisub.gui.is_modified() then
		mag.show.log(1, c_lang.key3)
		else
		makegif(subs, sel)
		end
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