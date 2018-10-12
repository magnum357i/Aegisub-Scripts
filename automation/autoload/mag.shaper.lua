	function lang_switch_keys(lang)
	local in_lang = {}
	local langs   =
	{
	[1] = {lang_key = "tr", lang_name = "Türkçe",  script_name = "Şekil Çiz"},
	[2] = {lang_key = "en", lang_name = "English", script_name = "Shaper"}
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
	in_lang["s_desc"]              = "Aktif satıra resim, ızgara veya dörtgen ekler."
	in_lang["tabKey1"]             = "Resim"
	in_lang["tabKey2"]             = "Izgara"
	in_lang["tabKey3"]             = "Dörtgen"
	in_lang["buttonKey1"]          = "Çiz"
	in_lang["buttonKey2"]          = "Kapat"
	in_lang["buttonKey3"]          = "Ekle"
	in_lang["buttonKey4"]          = "Resim Seç..."
	in_lang["buttonKey5"]          = "Notu Görüntüle"
	in_lang["buttonKey6"]          = "Git"
	in_lang["buttonKey7"]          = "Geri Dön"
	in_lang["guiLabelKey2"]        = "Adet:"
	in_lang["guiLabelKey3"]        = "Boşluk (px):"
	in_lang["guiLabelKey4"]        = "Kalınlık (px):"
	in_lang["guiLabelKey6"]        = "Renk:"
	in_lang["guiLabelKey7"]        = "Görünecek koordinat(lar):"
	in_lang["guiLabelKey8"]        = "Görünürlülük (yüzde):"
	in_lang["guiLabelKey9"]        = "En"
	in_lang["guiLabelKey10"]       = "Boy"
	in_lang["guiLabelKey11"]       = "Ebatlar (px):"
	in_lang["guiLabelKey12"]       = "Sadece var olan şekil çizme kodunu değiştir"
	in_lang["guiLabelKey13"]       = "Yol:"
	in_lang["guiLabelKey14"]       = "Sadece resim yolunu değiştir"
	in_lang["guiLabelKey15"]       = "\"\'{%s}\' butonuna tıklayın.\""
	in_lang["guiLabelKey16"]       = "Hizalama yönü:"
	in_lang["guiHintKey1"]         = "Tek bir koordinattaki çizgilerin sayısı."
	in_lang["key1"]                = "Şekil çizme kodu bulunamadı."
	in_lang["key2"]                = "Bir resim dosyası seçin"
	in_lang["key3"]                = "Resim Dosyası (*.png)|*.png"
	in_lang["key4"]                = "Resim kodu bulunamadı."
	in_lang["key5"]                = "Shaper doğrudan resim ekleyemez. Bunun için VSFilterMOD içinde bulunan img etiketini kullanır.\nEğer alt yazı işleyicisi olarak VSFilterMOD kullanmıyorsanız resmi göremezsiniz.\n\nKurulumu nasıl yapacağınızı bilmiyorsanız \"{%s}\" butonuna tıklayın."
	in_lang["key6"]                = "Aktif satır"
	in_lang["gridTypeListKey1"]    = "Yatay + Dikey"
	in_lang["gridTypeListKey2"]    = "Yatay"
	in_lang["gridTypeListKey3"]    = "Dikey"
	in_lang["shapeAlignListKey1"]  = "Sol"
	in_lang["shapeAlignListKey2"]  = "Sağ"
	in_lang["shapeAlignListKey3"]  = "Üst"
	in_lang["shapeAlignListKey4"]  = "Alt"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Adds image, grid or quad to active line."
	in_lang["tabKey1"]             = "Image"
	in_lang["tabKey2"]             = "Grid"
	in_lang["tabKey3"]             = "Quad"
	in_lang["buttonKey1"]          = "Draw"
	in_lang["buttonKey2"]          = "Close"
	in_lang["buttonKey3"]          = "Insert"
	in_lang["buttonKey4"]          = "Select Image..."
	in_lang["buttonKey5"]          = "View Note"
	in_lang["buttonKey6"]          = "Go"
	in_lang["buttonKey7"]          = "Back"
	in_lang["guiLabelKey2"]        = "Number:"
	in_lang["guiLabelKey3"]        = "Space (px):"
	in_lang["guiLabelKey4"]        = "Thickness (px):"
	in_lang["guiLabelKey6"]        = "Color:"
	in_lang["guiLabelKey7"]        = "Coordinate(s) to appear:"
	in_lang["guiLabelKey8"]        = "Visibility (percent):"
	in_lang["guiLabelKey9"]        = "Width"
	in_lang["guiLabelKey10"]       = "Height"
	in_lang["guiLabelKey11"]       = "Dimensions (px):"
	in_lang["guiLabelKey12"]       = "Just change the existing shape code"
	in_lang["guiLabelKey13"]       = "Path:"
	in_lang["guiLabelKey14"]       = "Just change image path"
	in_lang["guiLabelKey15"]       = "\"Click on the \'{%s}\' button.\""
	in_lang["guiLabelKey16"]       = "Align to:"
	in_lang["guiHintKey1"]         = "The number of lines in a single coordinate."
	in_lang["key1"]                = "Shape drawing code could not found."
	in_lang["key2"]                = "Select an image file"
	in_lang["key3"]                = "Image File (*.png)|*.png"
	in_lang["key4"]                = "Image code not found."
	in_lang["key5"]                = "Shaper can not add images directly. It uses the img tag in VsFilterMOD for this.\nYou can not see the image if VSFilterMod is not use as subtitle renderer.\n\nIf you don't know how to make it, click on the \"{%s}\" button."
	in_lang["key6"]                = "Active line"
	in_lang["gridTypeListKey1"]    = "Horizontal + Vertical"
	in_lang["gridTypeListKey2"]    = "Horizontal"
	in_lang["gridTypeListKey3"]    = "Vertical"
	in_lang["shapeAlignListKey1"]  = "Left"
	in_lang["shapeAlignListKey2"]  = "Right"
	in_lang["shapeAlignListKey3"]  = "Top"
	in_lang["shapeAlignListKey4"]  = "Bottom"
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
	script_version       = "1.5.0"
	script_mag_version   = "1.1.4.4"
	script_file_name     = "mag.shaper"
	script_file_ext      = ".lua"

	include_unicode      = true
	include_karaskel     = true
	mag_import, mag      = pcall(require, "mag")

	if mag_import then
	mag.lang             = c_lang_switch

	c_lock_gui           = false
	c_grid_type_list     = {c_lang.gridTypeListKey1, c_lang.gridTypeListKey2, c_lang.gridTypeListKey3}
	c_shape_align_list   = {mag.window.lang.message("select"), c_lang.shapeAlignListKey1, c_lang.shapeAlignListKey2, c_lang.shapeAlignListKey3, c_lang.shapeAlignListKey4}
	c_buttons1           = {c_lang.buttonKey3, c_lang.buttonKey4, c_lang.buttonKey5, c_lang.buttonKey2}
	c_buttons2           = {c_lang.buttonKey1, c_lang.buttonKey2}
	c_buttons3           = {c_lang.buttonKey6, c_lang.buttonKey7}

	c                    = {}
	c.image_path         = ""
	c.image_width        = 0
	c.image_height       = 0
	c.image_only         = false
	c.shape_width        = 0
	c.shape_height       = 0
	c.shape_color        = "#000000"
	c.shape_transparency = 100
	c.shape_only         = false
	c.shape_align        = mag.window.lang.message("select")
	c.grid_number        = 15
	c.grid_space         = 30
	c.grid_thickness     = 2
	c.grid_color         = "#FF19CD"
	c.grid_transparency  = 50
	c.grid_type          = c_grid_type_list[1]

	gui                  = {
		main1              = {
		                     {class = "label",                                                       x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey2},
		grid_number        = {class = "intedit",  name = "u_grid_number",        min = 2,            x = 1, y = 0, width = 1, height = 1, hint = c_lang.guiHintKey1},
		                     {class = "label",                                                       x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabelKey3},
		grid_space         = {class = "intedit",  name = "u_grid_space",         min = 1,            x = 1, y = 1, width = 1, height = 1},
		                     {class = "label",                                                       x = 0, y = 2, width = 1, height = 1, label = c_lang.guiLabelKey4},
		grid_thickness     = {class = "intedit",  name = "u_grid_thickness",     min = 1,            x = 1, y = 2, width = 1, height = 1},
		                     {class = "label",                                                       x = 0, y = 3, width = 1, height = 1, label = c_lang.guiLabelKey8},
		grid_transparency  = {class = "intedit",  name = "u_grid_transparency",  min = 1, max = 100, x = 1, y = 3, width = 1, height = 1},
		                     {class = "label",                                                       x = 0, y = 4, width = 1, height = 1, label = c_lang.guiLabelKey6},
		grid_color         = {class = "color",    name = "u_grid_color",                             x = 1, y = 4, width = 1, height = 1},
		                     {class = "label",                                                       x = 0, y = 5, width = 1, height = 1, label = c_lang.guiLabelKey7},
		grid_type          = {class = "dropdown", name = "u_grid_type",                              x = 1, y = 5, width = 1, height = 1, items = c_grid_type_list},
		                     {class = "label",                                                       x = 0, y = 6, width = 1, height = 1, label = mag.window.lang.message("apply")},
		                     {class = "label",                                                       x = 1, y = 6, width = 2, height = 1, label = c_lang.key6},
		},
		main2              = {
		                     {class = "label",                                                       x = 1, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey9},
		                     {class = "label",                                                       x = 3, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey10},
		                     {class = "label",                                                       x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabelKey11},
		shape_width        = {class = "intedit",  name = "u_shape_width",        min = 0,            x = 1, y = 1, width = 1, height = 1},
		                     {class = "label",                                                       x = 2, y = 1, width = 1, height = 1, label = "x"},
		shape_height       = {class = "intedit",  name = "u_shape_height",       min = 0,            x = 3, y = 1, width = 1, height = 1},
		                     {class = "label",                                                       x = 0, y = 2, width = 1, height = 1, label = c_lang.guiLabelKey8},
		shape_transparency = {class = "intedit",  name = "u_shape_transparency", min = 1, max = 100, x = 1, y = 2, width = 1, height = 1},
		                     {class = "label",                                                       x = 0, y = 3, width = 1, height = 1, label = c_lang.guiLabelKey6},
		shape_color        = {class = "color",    name = "u_shape_color",                            x = 1, y = 3, width = 1, height = 1},
		                     {class = "label",                                                       x = 0, y = 4, width = 1, height = 1, label = c_lang.guiLabelKey16},
		shape_align        = {class = "dropdown", name = "u_shape_align",                            x = 1, y = 4, width = 2, height = 1, items = c_shape_align_list},
		shape_only         = {class = "checkbox", name = "u_shape_only",                             x = 1, y = 5, width = 3, height = 1, label = c_lang.guiLabelKey12},
		                     {class = "label",                                                       x = 0, y = 6, width = 1, height = 1, label = mag.window.lang.message("apply")},
		                     {class = "label",                                                       x = 1, y = 6, width = 2, height = 1, label = c_lang.key6},
		},
		main3              = {
		                     {class = "label",                                                       x = 1, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey9},
		                     {class = "label",                                                       x = 3, y = 0, width = 1, height = 1, label = c_lang.guiLabelKey10},
		                     {class = "label",                                                       x = 0, y = 1, width = 1, height = 1, label = c_lang.guiLabelKey11},
		image_width        = {class = "intedit",  name = "u_image_width",        min = 0,            x = 1, y = 1, width = 1, height = 1},
		                     {class = "label",                                                       x = 2, y = 1, width = 1, height = 1, label = "x"},
		image_height       = {class = "intedit",  name = "u_image_height",       min = 0,            x = 3, y = 1, width = 1, height = 1},
		                     {class = "label",                                                       x = 0, y = 2, width = 1, height = 1, label = c_lang.guiLabelKey13},
		label1             = {class = "label",                                                       x = 1, y = 2, width = 3, height = 1},
		image_only         = {class = "checkbox", name = "u_image_only",                             x = 1, y = 3, width = 3, height = 1, label = c_lang.guiLabelKey14},
		                     {class = "label",                                                       x = 0, y = 4, width = 1, height = 1, label = mag.window.lang.message("apply")},
		                     {class = "label",                                                       x = 1, y = 4, width = 2, height = 1, label = c_lang.key6},
		},
		main4              = {
		                     {class = "label",                                                       x = 1, y = 0, width = 1, height = 1, label = mag.string.format(c_lang.key5, c_lang.buttonKey6)},
		}
	}
	end

	function shaper_mode1(subs,sel,act)
	local ok, config
	local image_filename
	if not mag.is.video() then
	mag.show.log(1, mag.window.lang.message("is_video"))
	else
	local view_note = false
	local my_gui, button
		repeat
			if not view_note then
			my_gui  = gui.main3
			buttons = c_buttons1
				if c.image_path ~= "" then
				my_gui.label1.label = mag.format("\"%s\"", mag.limit.path(c.image_path, 20, 15))
				else
				my_gui.label1.label = mag.string.format(c_lang.guiLabelKey15, c_lang.buttonKey4)
				end
			my_gui.image_width.value  = c.image_width
			my_gui.image_height.value = c.image_height
			my_gui.image_only.value   = c.image_only
			else
			my_gui  = gui.main4
			buttons = c_buttons3
			end
			ok, config = mag.window.dialog(my_gui, buttons)
			if ok == mag.convert.ascii(c_buttons1[3]) then
			view_note = true
			elseif ok == mag.convert.ascii(c_buttons3[2]) then
			view_note = false
			end
			if not view_note then
			c.image_width  = config.u_image_width
			c.image_height = config.u_image_height
			c.image_only   = config.u_image_only
				if ok == mag.convert.ascii(c_buttons1[2]) then
				image_filename = aegisub.dialog.open(c_lang.key2, aegisub.decode_path("?script\\"), "", c_lang.key3, false, true)
					if image_filename then
					c.image_path = image_filename
					end
				end
			else
				if ok == mag.convert.ascii(c_buttons3[1]) then
				os.execute("start https://biskuvininkirintilari.blogspot.com.tr/2016/03/textsubmod-kurulumu.html")
				end
			end
		until ok == mag.convert.ascii(c_buttons1[1]) and c.image_path ~= "" or ok == mag.convert.ascii(c_buttons1[4]) or ok == mag.convert.ascii(c_buttons3[1])
		if ok == mag.convert.ascii(c_buttons1[1]) then
		local line = subs[act]
		local shape_line
			if not c.image_only then
			local meta           = karaskel.collect_head(subs)
			local xres, yres     = aegisub.video_size()
			local xratio, yratio = meta.res_x/xres, meta.res_y/yres
			local width          = mag.floor(c.image_width * xratio)
			local height         = mag.floor(c.image_height * yratio)
			local shape          = mag.format("m 0 0 l %s 0 l %s %s l 0 %s l 0 0", width, width, height, height)
			shape_line           = mag.format("{\\an5\\pos(%s,%s)\\bord0\\shad0\\1img(%s)\\p1}%s", xres / 2, yres / 2, c.image_path, shape)
			else
			local image_code_pattern = "(\\1img%().-(%))"
				if mag.find(line.text, image_code_pattern) then
				shape_line = mag.gsub(line.text, image_code_pattern, "%1"..c.image_path.."%2")
				else
				mag.show.log(1, c_lang.key4)
				end
			end
			if shape_line ~= nil then
			line.text = shape_line
			subs[act] = line
			end
		end
	end
	end

	function shaper_mode2(subs,sel,act)
	if not mag.is.video() then
	mag.show.log(1, mag.window.lang.message("is_video"))
	else
	gui.main1.grid_number.value       = c.grid_number
	gui.main1.grid_space.value        = c.grid_space
	gui.main1.grid_thickness.value    = c.grid_thickness
	gui.main1.grid_transparency.value = c.grid_transparency
	gui.main1.grid_color.value        = c.grid_color
	gui.main1.grid_type.value         = c.grid_type
	local ok, config                  = mag.window.dialog(gui.main1, c_buttons2)
	c.grid_number                     = config.u_grid_number
	c.grid_space                      = config.u_grid_space
	c.grid_thickness                  = config.u_grid_thickness
	c.grid_transparency               = config.u_grid_transparency
	c.grid_color                      = config.u_grid_color
	c.grid_type                       = config.u_grid_type
		if ok == mag.convert.ascii(c_buttons2[1]) then
		local meta       = karaskel.collect_head(subs)
		local width      = meta.res_x
		local height     = meta.res_y
		local shape      = ""
		local px         = c.grid_thickness
		local size       = c.grid_space + px
		local number     = c.grid_number - 1
			if c.grid_type == c_grid_type_list[1] then
				for i = 0, number do
					for k = 0, number - 1 do
					shape =
					shape..mag.format("m %s %s l %s %s l %s %s l %s %sm %s %s l %s %s l %s %s l %s %s",
					px + (0 + k * size), i * size,
					size + k * size,     i * size,
					size + k * size,     px + i * size,
					px + (0 + k * size), px + i * size,
					size * i,      0 + k * size,
					size * i,      (size + k * size) + px,
					px + size * i, (size + k * size) + px,
					px + size * i, 0 + k * size)
					end
				end
			end
			if c.grid_type == c_grid_type_list[2] then
				for i = 0, number do
					for k = 0, number - 1 do
					shape =
					shape..mag.format("m %s %s l %s %s l %s %s l %s %s",
					0 + k * size,    i * size,
					size + k * size, i * size,
					size + k * size, px + i * size,
					0 + k * size,    px + i * size)
					end
				end
			end
			if c.grid_type == c_grid_type_list[3] then
				for i = 0, number do
					for k = 0, number - 1 do
					shape =
					shape..mag.format("m %s %s l %s %s l %s %s l %s %s",
					size * i,      0 + k * size,
					size * i,      size + k * size,
					px + size * i, size + k * size,
					px + size * i, 0 + k * size)
					end
				end
			end
		shape      = mag.gsub(shape, "(%d)(m)", "%1 %2")
		local line = subs[act]
		line.text  =
		mag.format("{\\an5\\pos(%s,%s)\\c%s\\1a&H%s&\\bord0\\shad0\\p1}%s",
		width / 2,
		height / 2,
		mag.convert.html_from_ass(c.grid_color),
		mag.convert.alpha_from_percent(c.grid_transparency, true),
		shape)
		subs[act]  = line
		end
	end
	end

	function shaper_mode3(subs,sel,act)
	if not mag.is.video() then
	mag.show.log(1, mag.window.lang.message("is_video"))
	else
	c.shape_align                      = mag.array.search_apply(c_shape_align_list, c.shape_align)
	gui.main2.shape_width.value        = c.shape_width
	gui.main2.shape_height.value       = c.shape_height
	gui.main2.shape_transparency.value = c.shape_transparency
	gui.main2.shape_color.value        = c.shape_color
	gui.main2.shape_only.value         = c.shape_only
	gui.main2.shape_align.value        = c.shape_align
	local ok, config                   = mag.window.dialog(gui.main2, c_buttons2)
	c.shape_width                      = config.u_shape_width
	c.shape_height                     = config.u_shape_height
	c.shape_transparency               = config.u_shape_transparency
	c.shape_color                      = config.u_shape_color
	c.shape_only                       = config.u_shape_only
	c.shape_align                      = config.u_shape_align
		if ok == mag.convert.ascii(c_buttons2[1]) then
		local line  = subs[act]
		local shape = mag.format("m 0 0 l %s 0 l %s %s l 0 %s l 0 0",
		c.shape_width,
		c.shape_width,
		c.shape_height,
		c.shape_height)
		local shape_line
			if not c.shape_only then
			local meta       = karaskel.collect_head(subs)
			local width      = meta.res_x
			local height     = meta.res_y
			local align_data = mag.format("\\an%s\\pos(%s,%s)",
				5,
				width / 2,
				height / 2)
					if c.shape_align ~= mag.window.lang.message("select") then
						if c.shape_align == c_shape_align_list[2] then
						align_data = mag.format("\\an%s\\pos(%s,%s)",
							4,
							0,
							height / 2)
						elseif c.shape_align == c_shape_align_list[3] then
						align_data = mag.format("\\an%s\\pos(%s,%s)",
							6,
							width,
							height / 2)
						elseif c.shape_align == c_shape_align_list[4] then
						align_data = mag.format("\\an%s\\pos(%s,%s)",
							8,
							width / 2,
							0)
						elseif c.shape_align == c_shape_align_list[5] then
						align_data = mag.format("\\an%s\\pos(%s,%s)",
							2,
							width / 2,
							height)
						end
					end
			shape_line =
			mag.format("{%s\\c%s\\1a&H%s&\\bord0\\shad0\\p1}%s",
			align_data,
			mag.convert.html_from_ass(c.shape_color),
			mag.convert.alpha_from_percent(c.shape_transparency, true),
			shape)
			else
			local shape_code_pattern = "m%s[%d%.]*%s[%d%.]*%s[%d%s%.lbm]*"
				if mag.find(line.text, shape_code_pattern) then
				shape_line = mag.gsub(line.text, shape_code_pattern, shape)
				else
				mag.show.log(1, c_lang.key1)
				end
			end
			if shape_line ~= nil then
			line.text = shape_line
			subs[act] = line
			end
		end
	end
	end

	function check_macro1(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(shaper_mode1, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro2(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(shaper_mode2, subs, sel, act)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	mag.config.set(c)
	end
	end

	function check_macro3(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	mag.config.get(c)
	local fe, fee = pcall(shaper_mode3, subs, sel, act)
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
		mag.window.register(script_name.."/"..c_lang.tabKey2, check_macro2)
		mag.window.register(script_name.."/"..c_lang.tabKey3, check_macro3)
		mag.window.lang.register()
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end