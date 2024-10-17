--[[

INSTALLATION:

Warning: Use the latest version of the Aegisub program. (Recommend: https://github.com/arch1t3cht/Aegisub/releases)

(UTF-8 Support)
1. Run "intl.cpl" (from Windows + R)
2. Click the "Administrative" tab
3. Click the "Change system locale..." button
4. Check the "Beta: Use Unicode UTF-8 for worldwide language support" checkbox

(Whisper)
1. Install anaconda
2. Open the powershell and run the "iex (irm whisper.tc.ht)" command
3. Type "y" for the "Use conda" question
4. If you see the "Whisper is installed" text, it's succesful
	For help: https://youtu.be/R5pZPpIIUzA?t=146
5. Add the paths of the conda to PATHS while the Aegisub program is closed:
	- C:\Users\<username>\Anaconda3\
	- C:\Users\<username>\Anaconda3\Scripts
	- C:\Users\<username>\Anaconda3\Library\bin

(manga_ocr)
1. Open a new anaconda terminal
2. Run the "conda create --name manga_ocr python=3.10" command
3. Type "y" for the question
4. Run the "conda activate manga_ocr" command
5. Run the "pip install manga-ocr" command

(my plugin)
1. Move my plugin to automation/autoload

That's all.

FIRST USAGE:
1. Run the Scan.
2. Please run the large model in cmd first

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
	in_lang["s_desc"]              = "Sesten veya görüntüden kanji çıkarmanızı sağlar."
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
	in_lang["out8"]                = "Dosya açılamadı: {%s}"
	in_lang["out9"]                = "Geçici klasör oluşuturalamadı."
	in_lang["out10"]               = "Komut bulunamadı: {%s}"
	in_lang["out11"]               = "Geçici klasör yerinde."
	in_lang["out12"]               = "Komut aktif: {%s}"
	in_lang["out13"]               = "Seçili ses dili: \"{%s}\"\nBunu değiştirmek istiyorsanız programı tekrar açın."
	in_lang["guiLabel1"]           = "Ses listesi:"
	in_lang["buttonKey1"]          = "Tamam"
	in_lang["buttonKey2"]          = "Kapat"
	elseif lang == langs[2].lang_key then
	in_lang["module_incompatible"] = "The installed version of the Mag module is incompatible with this lua file!\n\nAt least \"%s\" version or higher of the module file is required.\n\n\nWould you like to go to the download page now?"
	in_lang["module_not_found"]    = "The module named Mag could not be found!\n\nTo use this file, you need to download the module named mag\nand move it to \"Aegisub/automation/include/\" directory when Aegisub is off.\n\n\nDo you want to go to download page now?"
	in_lang["module_yes"]          = "Go"
	in_lang["module_no"]           = "Later"
	in_lang["s_name"]              = langs[2].script_name
	in_lang["s_desc"]              = "Allows to take kanji from audio or image."
	in_lang["tabKey1"]             = "Audio"
	in_lang["tabKey2"]             = "Image"
	in_lang["tabKey3"]             = "Scan"
	in_lang["key1"]                = "RESULT:\n{%s}\n{%s} seconds"
	in_lang["out1"]                = "Getting image from clipboard..."
	in_lang["out2"]                = "This is not a image."
	in_lang["out3"]                = "Processing..."
	in_lang["out4"]                = "Extracting audio..."
	in_lang["out5"]                = "Creating kanjis..."
	in_lang["out6"]                = "Took {%s} seconds"
	in_lang["out8"]                = "File not opened: {%s}"
	in_lang["out9"]                = "Temp folder not created."
	in_lang["out10"]               = "Command not found: {%s}"
	in_lang["out11"]               = "Temp folder exists."
	in_lang["out12"]               = "Command is active: {%s}"
	in_lang["out13"]               = "Selected audio language: \"{%s}\"\nIf you want to change it, please reopen the Aegisub program."
	in_lang["guiLabel1"]           = "Audio list:"
	in_lang["buttonKey1"]          = "OK"
	in_lang["buttonKey2"]          = "Close"
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
	script_version       = "1.3.7"
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
	c_selectedaudio      = ""
	c_audiochecked       = false
	c_files              = {
		directory  = "kanjilator",
		audio      = "audio.wav",
		image      = "image.bmp",
		text       = "kanjis.txt",
		pythonfile = "newmangaocr.py"
	}
	c_buttons1         = {c_lang.buttonKey1, c_lang.buttonKey2}

	gui                = {
		main1 = {
		         {class = "label",                     x = 0, y = 0, width = 1, height = 1, label = c_lang.guiLabel1},
		audios = {class = "dropdown", name = "audios", x = 1, y = 0, width = 1, height = 1},
		}
	}
	end

	function getaudiolist()
    local file   = io.popen(mag.string.format("ffprobe -v error -select_streams a -show_entries stream=index,codec_type:stream_tags=language -of csv=p=0 \"{%s}\" 2>&1", getpath("uservideo")))
    local output = file:read("*all")
    file:close()
	if mag.match(output, "1,audio,") then
	local audiolist = mag.string.split(mag.gsub(output, ",audio,", ": "), "\n")
	mag.array.remove(audiolist, #audiolist)
	return audiolist
	else
	mag.show.log("DK3M1")
	end
    return nil
	end

	function commandcheck(command)
	local result
	if command == "whisper" or command == "manga_ocr" then
	result = os.execute("conda activate "..command.." && where "..command)
	else
	result = os.execute("where "..command)
	end
	if result == nil then
	mag.show.log("✘ "..mag.string.format(c_lang.out10, command))
	else
	mag.show.log("✔ "..mag.string.format(c_lang.out12, command))
	end
	end

	function getpath(type)
	if type == "usersubtitle" then
	return mag.string.format("{%s}{%s}",aegisub.decode_path("?script\\"), aegisub.file_name())
	elseif type == "uservideo" then
	local properties = aegisub.project_properties()
	return properties.video_file
	elseif type == "directory" then
	return mag.string.format("{%s}\\\\{%s}", mag.gsub(aegisub.decode_path("?temp"),"\\","\\\\"), c_files.directory)
	else
	return mag.string.format("{%s}\\\\{%s}\\\\{%s}", mag.gsub(aegisub.decode_path("?temp"),"\\","\\\\"), c_files.directory, c_files[type])
	end
	end

	function createmangaocrfile()
	if io.open(getpath("pythonfile"), "r") then return nil end
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

	local file = io.open(getpath("pythonfile"), "w")
	if file then
	file:write(content)
	file:close()
	else
	mag.show.log("ER5401")
	end
	end

	function filecheck(path)
	local file = io.open(path, "r")
	return file ~= nil
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

	function createfolderifnotexists()
	local file, output
	file   = io.popen("if exist "..getpath("directory").." (echo 1) else (echo 0)")
	output = file:read('*all')
	file:close()
	if mag.gsub(output, "\n", "") == "0" then
	os.execute("mkdir "..getpath("directory"))
	os.execute("chmod 755 "..getpath("directory"))
	end
	end

	function mangaocrline()
	local mocommand = ""
	--image path
	mocommand = mocommand.." "..mag.string.format("--read_from \"{%s}\"", getpath("image"))
	--save path
	mocommand = mocommand.." "..mag.string.format("--write-to \"{%s}\"", getpath("text"))
	return mag.string.format("conda activate manga_ocr && python \"{%s}\" {%s} 2>&1", getpath("pythonfile"), mocommand)
	end

	function ffmpegline(startt,endt)
	local fcommand = ""
	--input video
	fcommand = fcommand..mag.string.format("-i \"{%s}\"", getpath("uservideo"))
	--trim
	fcommand = fcommand.." "..mag.string.format("-ss {%s} -to {%s}", mag.convert.ms_to_time(startt), mag.convert.ms_to_time(endt))
	--audio select
	if c_selectedaudio ~= "" then
	local audioindex = mag.match(c_selectedaudio, "%d+")
	fcommand = fcommand.." "..mag.string.format("-map 0:{%s}", audioindex)
	end
	--overwrite
	fcommand = fcommand.." ".."-y"
	--output video
	fcommand = fcommand.." "..mag.string.format("\"{%s}\"", getpath("audio"))
	return mag.string.format("ffmpeg {%s} 2>&1", fcommand)
	end

	function whisperline()
	local wcommand = ""
	--input audio
	wcommand = wcommand..mag.string.format("\"{%s}\"", getpath("audio"))
	--language
	wcommand = wcommand..mag.string.format(" --language {%s}", "Japanese")
	--model
	wcommand = wcommand..mag.string.format(" --model {%s}", "large")
	--format
	wcommand = wcommand..mag.string.format(" --output_format {%s}", "txt")
	--temp
	wcommand = wcommand..mag.string.format(" --output_dir \"{%s}\"", getpath("directory"))
	return mag.string.format("conda activate whisper && whisper {%s} 2>&1", wcommand)
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
	local imagedata = ffi.string(data, size)
	ffi.C.GlobalUnlock(handle)
	ffi.C.CloseClipboard()
	local file = io.open(getpath("image"), "wb")
	file:write(imagedata)
	file:close()
	return true
	end

	function add_macro1(subs, sel)
	createfolderifnotexists()
	deletefile(getpath("whispertext"))
	deletefile(getpath("audio"))
	local audiocount = 0
	if c_selectedaudio == "" and c_audiochecked == false then
	local audiolist = getaudiolist()
		if audiolist ~= nil and #audiolist > 1 then
		audiocount = #audiolist
		gui.main1.audios.items = mag.array.merge({mag.window.lang.message("select")}, audiolist)
		gui.main1.audios.value = mag.window.lang.message("select")
		ok, config = mag.window.dialog(gui.main1, c_buttons1)
			if ok == mag.convert.ascii(c_buttons1[1]) and config["audios"] ~= mag.window.lang.message("select") then
			c_selectedaudio = config["audios"]
			end
		else
		c_audiochecked = true
		end
	end
	if audiocount > 0 and c_selectedaudio == "" then return nil end
	if c_selectedaudio ~= "" then
	mag.show.log(mag.string.format(c_lang.out13, c_selectedaudio))
	end
	if c_files["whispertext"] == nil then c_files["whispertext"] = mag.gsub(c_files.audio, "%..+", ".txt") end
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
	local audiofile = filecheck(getpath("audio"))
	if not audiofile then
	mag.show.log(mag.string.format(c_lang.out8, c_files["audio"]))
	mag.show.log(ffmpegline(vstart,vend))
	mag.show.log(output)
	return nil
	end
	mag.show.log(c_lang.out5)
	output, elapsed = runcommand(whisperline())
	local txtfile = filecheck(getpath("whispertext"))
	if not txtfile then
	mag.show.log(mag.string.format(c_lang.out8, mag.gsub(c_files["audio"], "%..+", "")))
	mag.show.log(whisperline())
	mag.show.log(output)
	return nil
	end
	local kanjis = getfilecontent(getpath("whispertext"))
	if not mag.is.empty(kanjis) then
	mag.show.log(mag.string.format(c_lang.key1, kanjis, elapsed))
	elseif not mag.is.empty(output) then
	mag.show.log(output)
	else
	mag.show.log(mag.string.format(c_lang.key1, "???"))
	end
	end

	function add_macro2(subs, sel)
	createfolderifnotexists()
	createmangaocrfile()
	deletefile(getpath("text"))
	deletefile(getpath("image"))
	mag.show.log(c_lang.out1)
	local is_image = getclipboardimage()
	if is_image then
	mag.show.log(c_lang.out3)
	local output, elapsed = runcommand(mangaocrline())
	local kanjis = getfilecontent(getpath("text"))
		if kanjis == nil then
		mag.show.log(output)
		else
		mag.show.log(mag.string.format(c_lang.key1, kanjis, elapsed))
		end
	end
	end

	function add_macro3(subs, sel)
	createfolderifnotexists()
	local file, output
	file   = io.popen("if exist "..getpath("directory").." (echo 1) else (echo 0)")
	output = file:read('*all')
	file:close()
	if mag.gsub(output, "\n", "") == "0" then
	mag.show.log("✘ "..c_lang.out9)
	else
	mag.show.log("✔ "..c_lang.out11)
	end
	for _, command in pairs({"ffmpeg", "conda", "whisper", "manga_ocr"}) do
	commandcheck(command)
	end
	end

	function check_macro1(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro1, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	end
	end

	function check_macro2(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro2, subs, sel)
	mag.window.funce(fe, fee)
	mag.window.undo_point()
	end
	end

	function check_macro3(subs,sel)
	if c_lock_gui then
	mag.show.log(1, mag.window.lang.message("restart_aegisub"))
	else
	local fe, fee = pcall(add_macro3, subs, sel)
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
		mag.window.register(script_name.."/"..c_lang.tabKey3, check_macro3)
		mag.window.lang.register()
		end
	else
	mag_gui_message = c_lang.module_not_found
	aegisub.register_macro(script_name, script_desription, mag_redirect_gui)
	end