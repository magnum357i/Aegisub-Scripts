	--[[
	## Requirements
	- Conda & Whisper (https://www.youtube.com/watch?v=R5pZPpIIUzA&loop=0)
	- manga_ocr
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
	in_lang["tabKey1"]             = "Çalıştır"
	in_lang["tabKey1"]             = "Ses"
	in_lang["tabKey2"]             = "Resim"
	in_lang["key1"]                = "SONUÇ:\n{%s}\n{%s} SANİYE"
	in_lang["out1"]                = "Panodan resim alınıyor..."
	in_lang["out2"]                = "Bu bir resim değil."
	in_lang["out3"]                = "İşleniyor..."
	in_lang["out4"]                = "Ses çıkarılıyor..."
	in_lang["out5"]                = "Kanji oluşturuluyor..."
	in_lang["out6"]                = "{%s} saniye sürdü"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Allows you to take clips using ffmpeg."
	in_lang["tabKey1"]             = "Audio"
	in_lang["tabKey2"]             = "Image"
	in_lang["key1"]                = "RESULT:\n{%s}\n{%s} seconds"
	in_lang["out1"]                = "Getting image from clipboard..."
	in_lang["out2"]                = "This is not a image."
	in_lang["out3"]                = "Processing..."
	in_lang["out4"]                = "Extracting audio..."
	in_lang["out5"]                = "Creating kanjis..."
	in_lang["out6"]                = "Took {%s} seconds"
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
	script_file_name     = "mag.kanjilator"
	script_file_ext      = ".lua"

	include_unicode      = true
	include_clipboard    = true
	mag_import, mag      = pcall(require, "mag")

	local ffi = require("ffi")

	if mag_import then
	mag.lang             = c_lang_switch

	c_lock_gui           = false
	c_temppath           = mag.gsub(aegisub.decode_path("?temp"),"\\","\\\\").."\\\\kanjilator\\\\"
	end

	function createmangaocrfile()
	if io.open(c_temppath.."newmangaocr.py", "r") then return nil end
	local content = [[
import sys
import time
from pathlib import Path

import fire
import numpy as np
import pyperclip
from PIL import Image
from PIL import UnidentifiedImageError
from loguru import logger

from manga_ocr import MangaOcr


def process_and_write_results(mocr, img_or_path, write_to):
	t0 = time.time()
	text = mocr(img_or_path)
	t1 = time.time()

	logger.info(f"Text recognized in {t1 - t0:0.03f} s: {text}")

	if write_to == "clipboard":
		pyperclip.copy(text)
	else:
		write_to = Path(write_to)
		if write_to.suffix != ".txt":
			raise ValueError('write_to must be either "clipboard" or a path to a text file')

		with write_to.open("a", encoding="utf-8") as f:
			f.write(text + "\n")


def run(
	read_from="clipboard",
	write_to="clipboard",
	pretrained_model_name_or_path="kha-white/manga-ocr-base",
	force_cpu=False,
	verbose=False,
):

	mocr = MangaOcr(pretrained_model_name_or_path, force_cpu)
	process_and_write_results(mocr, read_from, write_to)


if __name__ == "__main__":
	fire.Fire(run)
]]

	local file = io.open(c_temppath.."newmangaocr.py", "w")
	if file then
	file:write(content)
	file:close()
	else
	mag.show.log("???")
	end
	end

	function getfilecontent(path)
	local file    = io.open(path, "r")
	local content = ""
	if not file then return nil end
	content = file:read('*all')
	file:close()
	return content
	end

	function deletefile(path)
	os.remove(path)
	end

	function runcommand(content)
	local stime = os.clock()
	local file = io.popen(content, 'r')
	local output = file:read('*all')
	file:close()
	local etime = os.clock()
	return output, math.floor(etime - stime)
	end

	function getfilepath(type)
	if type == "subtitle" then
	return mag.string.format("{%s}{%s}",aegisub.decode_path("?script\\"), aegisub.file_name())
	elseif type == "video" then
	local properties = aegisub.project_properties()
	return properties.video_file
	end
	end

	function createfolderifnotexists()
	local file, output
	local path = c_temppath
	file       = io.popen("if exist "..path.." (echo 1) else (echo 0)")
	output     = file:read('*all')
	file:close()
	if mag.gsub(output, "\n", "") == "0" then
	file = io.popen("mkdir -m 755 "..path)
	file:close()
	end
	end

	function mangaocrline()
	local mocommand = ""
	--image path
	mocommand = mocommand.." "..mag.string.format("--read_from \"{%s}image.bmp\"", c_temppath)
	--save path
	mocommand = mocommand.." "..mag.string.format("--write-to \"{%s}\\kanjis.txt\"", c_temppath)
	return mag.string.format("conda activate && python \"{%s}newmangaocr.py\" {%s} 2>&1", c_temppath, mocommand)
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
	fcommand = fcommand.." "..mag.string.format("\"{%s}audio.wav\"", c_temppath)
	return mag.string.format("ffmpeg {%s} 2>&1", fcommand)
	end

	function whisperline()
	local wcommand = ""
	--input audio
	wcommand = wcommand..mag.string.format("\"{%s}audio.wav\"", c_temppath)
	--language
	wcommand = wcommand..mag.string.format(" --language {%s}", "Japanese")
	--model
	wcommand = wcommand..mag.string.format(" --model {%s}", "large")
	--format
	wcommand = wcommand..mag.string.format(" --output_format {%s}", "txt")
	--temp
	wcommand = wcommand..mag.string.format(" --output_dir \"{%s}\"", c_temppath)
	return mag.string.format("@chcp 65001 > nul && @set PYTHONIOENCODING=utf-8 && conda activate whisper && whisper {%s} 2>&1", wcommand)
	end

	ffi.cdef[[
		int OpenClipboard(void* hWndNewOwner);
		int CloseClipboard();
		void* GetClipboardData(unsigned int uFormat);
		void* GlobalLock(void* hMem);
		int GlobalUnlock(void* hMem);
		unsigned long GlobalSize(void* hMem);
	]]

	local function getclipboardimage()
	ffi.C.CloseClipboard()
	if ffi.C.OpenClipboard(nil) == 0 then return nil end
	local CF_DIB = 8
	local handle = ffi.C.GetClipboardData(CF_DIB)
	if handle == nil then ffi.C.CloseClipboard() mag.show.log(1, "This is not a image.") return nil end
	local data = ffi.C.GlobalLock(handle)
	if data == nil then ffi.C.CloseClipboard() return nil end
	local size = ffi.C.GlobalSize(handle)
	local image_data = ffi.string(data, size)
	ffi.C.GlobalUnlock(handle)
	ffi.C.CloseClipboard()
	local file = io.open(c_temppath.."image.bmp", "wb")
	file:write(image_data)
	file:close()
	return true
	end

	function add_macro1(subs, sel)
	createfolderifnotexists()
	local output, elapsed
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
	mag.show.log(c_lang.out4)
	output, elapsed = runcommand(ffmpegline(vstart,vend))
	mag.show.log(mag.string.format(c_lang.out6, elapsed))
	mag.show.log(c_lang.out5)
	output, elapsed = runcommand(whisperline())
	local kanjis = getfilecontent(c_temppath.."audio.txt")
	if not mag.is.empty(kanjis) then
	mag.show.log(mag.string.format(c_lang.key1, kanjis, elapsed))
	elseif not mag.is.empty(output) then
	mag.show.log(output)
	else
	mag.show.log(mag.string.format(c_lang.key1, "???"))
	end
	deletefile(c_temppath.."audio.txt")
	deletefile(c_temppath.."audio.wav")
	end

	function add_macro2(subs, sel)
	createfolderifnotexists()
	createmangaocrfile()
	mag.show.log(c_lang.out1)
	local is_image = getclipboardimage()
	if is_image then
	mag.show.log(c_lang.out3)
	local output, elapsed = runcommand(mangaocrline())
	local kanjis = mag.match(output, "Text recognized in [^%s]* s: (.*)")
	mag.show.log(mag.string.format(c_lang.key1, getfilecontent(c_temppath.."kanjis.txt"), elapsed))
	end
	deletefile(c_temppath.."kanjis.txt")
	deletefile(c_temppath.."image.bmp")
	end

	function check_macro1(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro1, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	end
	end

	function check_macro2(subs,sel,act)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro2, subs, sel)
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
		mag.window.register(script_name.."/"..c_lang.tabKey2, check_macro2)
		mag.window.lang.register()
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end