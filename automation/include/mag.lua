	module_name = "Mag"
	module_desription = "Birden fazla kullandığım foksiyonlar için fonksiyon deposu."
	module_version = "1.1.1.3"
	module_author = "Magnum357"

	unicode = require 'aegisub.unicode'
	include("karaskel.lua")

	local mag = {}

	--mag.progress("İşleminiz yapılıyor",i,7,true)
	function mag.progress(str,i,max,delay,delay_value)
	aegisub.progress.title(mag.format("%s %s%%",script_name,mag.percent(max,i,true)))
	aegisub.progress.task(mag.format("(%s/%s) %s",max,i,str))
	aegisub.progress.set(mag.percent(max,i,true))
	if delay == true then mag.delay(delay_value) end
	end

	--mag.delay(5000)
	function mag.delay(t)
	local st = ""
	for i = 0, t do
	st = st .. i
	end
	return st
	end	

	--mag.prog("İşleminiz yapılıyor...")
	function mag.prog(str)
	aegisub.progress.task(mag.format("%s",str))
	aegisub.progress.set(100)
	mag.delay(50000)
	end

	--ascii_text = mag.ascii("Şekil Çıta")
	-->>Şekil Çıta
	function mag.ascii(str)
	str = mag.gsub(str,"ç",mag.char(231))
	str = mag.gsub(str,"Ç",mag.char(199))
	str = mag.gsub(str,"ü",mag.char(252))
	str = mag.gsub(str,"Ü",mag.char(220))
	str = mag.gsub(str,"ö",mag.char(246))
	str = mag.gsub(str,"Ö",mag.char(214))
	str = mag.gsub(str,"ğ",mag.char(240))
	str = mag.gsub(str,"Ğ",mag.char(208))
	str = mag.gsub(str,"ş",mag.char(254))
	str = mag.gsub(str,"Ş",mag.char(222))
	str = mag.gsub(str,"ı",mag.char(253))
	str = mag.gsub(str,"İ",mag.char(221))
	return str
	end

	--strip_text = mag.strip("{\bord2}Bu bir deneme.")
	-->>Bu bir deneme.
	function mag.strip(str) return mag.gsub(str,"{[^}]+}", "") end

	--full_strip_text = mag.full_strip("{\bord2}Bu\hbir\hdeneme.")
	-->>Bu bir deneme.
	function mag.full_strip(str)
	str = mag.gsub(str,"{[^}]+}", "")
	str = mag.gsub(str,"\\N", " ")
	str = mag.gsub(str,"\\n", " ")
	str = mag.gsub(str,"\\h", " ")
	str = mag.gsub(str,"%s+", " ")
	return str
	end

	--remove_dot_text = mag.removedot("Bu bir deneme.")
	-->>Bu bir deneme
	function mag.removedot(str) return mag.gsub(str,"['., -/*:;+!)?\"=(]+", "") end

	--mag.wall(" ",5)
	-->>5x" "
	function mag.wall(char,loop) return mag.rep(char,loop) end

	--stil = mag.unstyles("(5) Default")
	-->>Default
	--stil = mag.unstyles("(5+0) Default")
	-->>Default
	function mag.unstyles(style) return mag.gsub(style,"%(%d+%+?%d-%)%s","") end

	--total_line = mag.total_full(subs)
	function mag.total_full(subs)
	local n = 0
	for i = 1, #subs do if subs[i].class == "dialogue" then n = n + 1 end end
	return n
	end

	function mag.total_comment_full(subs)
	local n = 0
	for i = 1, #subs do if subs[i].class == "dialogue" and subs[i].comment == false then n = n + 1 end end
	return n
	end	

	--mag.total(subs,stil,[default,comment,effect],[effect -> Mac])
	function mag.total(subs,style_name,mode,value)
	local n, m = 0, 0
	for i = 1, #subs do
		if subs[i].class == "dialogue" then
			if mode == "default" then
			if subs[i].style == style_name then n = n + 1 end
			end
			if mode == "comment" then
			if subs[i].style == style_name and subs[i].comment == false then n = n + 1 end
			if subs[i].style == style_name and subs[i].comment == true then m = m + 1 end
			end
			if mode == "effect" then
			if subs[i].style == style_name and subs[i].effect ~= value then n = n + 1 end
			if subs[i].style == style_name and subs[i].effect == value then m = m + 1 end
			end
		end
	end
	return n, m
	end

	--mag.styles(subs,[default,comment,effect],[effect -> Mac])
	function mag.styles(subs,mode,value)
	local n, styles = 0, {}
	for i = 1, #subs do
		if subs[i].class == "style" then
		local total, total2 = mag.total(subs,subs[i].name,mode,value)
			if total > 0 or total2 > 0 then
			if mode == "default" then n = n + 1 styles[n] = mag.format("(%d) %s",total,subs[i].name) end
			if mode == "comment" or mode == "effect" then n = n + 1 styles[n] = mag.format("(%d+%d) %s",total,total2,subs[i].name) end
			end
		end
	end
	return styles
	end

	--mag.styles_insert(subs,dlg_array,3,[default,comment,effect],[effect -> Mac])
	function mag.styles_insert(subs,var,id,mode,value) for _, style in ipairs(mag.styles(subs,mode,value)) do table.insert(var[id].items,style) end end

	--mag.dlg(gui_array,{"Tamam","Kapat"})
	function mag.dlg(var,buttons)
	local ok, config
	for i = 1, table.getn(buttons) do buttons[i] = mag.ascii(buttons[i]) end
	ok, config = aegisub.dialog.display(var,buttons)
	return ok, config
	end

	--mag.register(false,macro_function)
	--mag.register("My_Script_Name",macro_function)
	function mag.register(name,macro)
	if name == false then name = script_name end
	mag.rmacro(name,script_desription,macro)
	end

	--mag.log("Deneme.")
	-->>Deneme.
	--mag.log([0-4],"Deneme.")
	-->> 1 == [ HATA ]\nDeneme.
	-->> 2 == [ UYARI ]\nDeneme.
	-->> 3 == [ NOT ]\nDeneme.
	-->> 0 == Deneme.
	--mag.log("Deneme. %s",{"Deneme."})
	-->> Deneme. Deneme.
	--mag.log([0-4],"Deneme. %s",{"Deneme."})
	-->> 1 == [ HATA ]\nDeneme. Deneme.
	-->> 2 == [ UYARI ]\nDeneme. Deneme.
	-->> 3 == [ NOT ]\nDeneme. Deneme.
	-->> 0 == Deneme. Deneme.
	function mag.log(mode,str,vars)
	local divide = ""
	if str == nil and vars == nil then str = mag.s(mode) mode = 0 end
	if mag.n(mode) == nil then
	vars = str
	str  = mode
	mode = 0
	else
	mode = mag.n(mode)
	end
	if mode == nil or mode < 1 or mode > 3 then mode = 0 end
	local alert_message = ""
	if vars ~= nil then for i = 1, #vars do str = mag.gsub(str,"%%s",mag.s(vars[i]),1) end end
		if mode == 1 then alert_message = "[ HATA ]\n"     end
		if mode == 2 then alert_message = "[ UYARI ]\n"    end
		if mode == 3 then alert_message = "[ NOT ]\n"      end
		if mode ~= 0 then divide = "\n"..mag.wall("-",114) end
		if mode == 0 then aegisub.log(alert_message..str.."\n") else aegisub.log(mode,alert_message..str..divide.."\n") end
	end

	--esc_text = mag.esc("Nasılsın?")
	-->>Nasılsın%?
	function mag.esc(str)
	str = mag.gsub(str,"(%()","%%%1")
	str = mag.gsub(str,"(%))","%%%1")
	str = mag.gsub(str,"(%.)","%%%1")
	str = mag.gsub(str,"(%%)","%%%1")
	str = mag.gsub(str,"(%+)","%%%1")
	str = mag.gsub(str,"(%-)","%%%1")
	str = mag.gsub(str,"(%*)","%%%1")
	str = mag.gsub(str,"(%?)","%%%1")
	str = mag.gsub(str,"(%[)","%%%1")
	str = mag.gsub(str,"(%])","%%%1")
	str = mag.gsub(str,"(%^)","%%%1")
	str = mag.gsub(str,"(%$)","%%%1")
	str = mag.gsub(str,"(%\\)","\\\\%1")
	return str
	end

	--zero_text = mag.zero(300,30)
	-->>030
	function mag.zero(total_number,number)
	local zero_count = mag.len(mag.s(total_number)) - mag.len(mag.s(number))
	if zero_count > 0 then number = mag.format("%s%s",mag.rep("0",zero_count),number) end
	return number
	end

	--mag.percent("200",100,true)
	-->>50
	--mag.percent("200",100,false)
	-->>50.00	
	function mag.percent(total_number,number,digit_mode)
	local calc
	if number <= total_number then
	calc = 100 - ((total_number - number) / total_number * 100)
	calc = mag.gsub(mag.s(calc),"(%.5[^%d]-)","%10")
	if mag.match(calc,"%.%d+") then calc = mag.gsub(mag.s(calc),"(%.%d%d)%d+","%1")
	else if mag.match(calc,"100") then calc = calc..".0" else calc = calc..".00" end end
	else calc = 0 end
	if digit_mode == true then calc = mag.gsub(calc,"%.%d+","") end
	return mag.s(calc)
	end

	--first_text_index = mag.first_index(subs)
	-->>13
	function mag.first_index(subs)
	local first_index
	for i = 1, #subs do if subs[i].class == "dialogue" then if first_index == nil then first_index = i end end end
	return first_index
	end

	--last_text_index = mag.last_index(subs)
	-->>287
	function mag.last_index(subs) return #subs end

	--nil_value == mag.unnil(nil_value)
	-->>empty string
	function mag.unnil(var)
	if not var then var = "" end
	return var
	end

	--split_count, split_text = mag.splitter(true,"Bu bir deneme. \\NBu da bir deneme. \\NBu hala deneme.","\\N")
	-->>3
	-->>Bu bir deneme. \\N
	-->>Bu da bir deneme. \\N
	-->>Bu hala bir deneme.
	--split_count, split_text = mag.splitter(false,"Bu bir deneme. \\NBu da bir deneme. \\NBu hala deneme.","\\N")
	-->>2
	-->>Bu bir deneme. \\N
	-->>Bu da bir deneme. \\N
	--split_count, split_text = mag.splitter([true,false],"Bu bir deneme. \\NBu da bir deneme. \\NBu hala deneme.","\\h")
	-->>1
	-->>Bu bir deneme. \\NBu da bir deneme. \\NBu hala deneme.
	function mag.splitter(last,str,split)
	local n = 0
	local parts = {}
	if mag.match(str,split) then if last == true then str = str..mag.match(str,split) end
	for part in str:gmatch(".-"..split) do
	n = n + 1
	parts[n] = part
	end
	if last == true then
	parts[n] = mag.gsub(parts[n],split,"")
	if parts[n] == "" then parts[n] = nil n = n - 1 end
	end
	else
	parts[1] = str
	n = 1
	end
	return n, parts
	end

	--text = mag.tag_replacer("Bu bir deneme. \\nBu da bir deneme. \\nBu hala deneme.","\\n","\\N")
	-->>Bu bir deneme. \\NBu da bir deneme. \\NBu hala deneme.
	--text = mag.tag_replacer("Bu bir deneme. \\hBu da bir deneme. \\hBu hala deneme.","\\n","\\N")
	-->>Bu bir deneme. \\nBu da bir deneme. \\nBu hala deneme.
	function mag.tag_replacer(str,sign,tag)
	local split_text
	local split_count
	local result = ""
	if mag.match(str,sign) then
	split_count, split_text = mag.splitter(true,str,sign)
	for i = 1, split_count do result = result..mag.tag_changer(split_text[i],sign,tag) end
	return result else return str
	end
	end

	--text = mag.tag_changer("Bu bir deneme. *1Bu da bir deneme. {\b*1}Bu hala deneme.","*1","{\i1}")
	-->>Bu bir deneme. {\i1}Bu da bir deneme. {\b\1}Bu hala deneme.
	--text = mag.tag_changer("Bu bir deneme. *1Bu da bir deneme. {\b*1}Bu hala deneme.","*0","{\i0}")
	-->>Bu bir deneme. *1Bu da bir deneme. {\b*1}Bu hala deneme.
	function mag.tag_changer(str,sign,tag)
	local function no_bra(tag) tag = mag.gsub(tag,"{","") tag = tag.gsub(tag,"}","") return tag end
	local sp1, sp2
	local result = ""
	local t
	t = tag
	rev = mag.reverse(str)
	s1 = mag.find(rev,"{")
	s2 = mag.find(rev,"}")
	if s1 == nil then s1 = -2 end
	if s2 == nil then s2 = s1 + 1 end
	if s1 < s2 and s1 > -1 then t = no_bra(t) end
	if t ~= nil then result = mag.gsub(str,sign,t) else result = str end
	return result
	end

	--mag.last_find("Deneme.","e")
	-->>6
	--mag.last_find("Deneme","a")
	-->>false
	function mag.last_find(str,find)
	local find_idx = {}
	local n = 0
	local _, find_count = mag.gsub(str,find,"")
	for i = 1, find_count do
	n = n + 1
		if i == 1 then
		find_idx[i] = mag.find(str,find)
		else
		find_idx[i] = mag.find(str,find,find_idx[i - 1] + 1)
		end
	end
	if find_count == 0 then return false else return find_idx[n] end
	end

	--current_act = mag.current_act(subs,sel,act)
	-->>85
	function mag.current_act(subs,sel,act) return act - mag.first_index(subs) + 1 end

	--style_first_index = mag.style_first_index(subs,"Default")
	-->>11
	function mag.style_first_index(subs,style_name)
	local index
	for i = 1, #subs do if subs[i].style == style_name then index =  i break end end
	return index
	end

	--style_last_index = mag.style_last_index(subs,"Default")
	-->>320
	function mag.style_last_index(subs,style_name)
	local index
	for i = #subs, 1, -1 do if subs[i].style == style_name then index =  i break end end
	return index
	end

	--vars = {10,50,70,80,50}
	--mag.double_value(vars)
	-->>10,70,80,50
	function mag.double_value(array)
	local index = {}
	local n = 0
	local double
	local max_n = table.getn(array)
	if max_n > 1 then
		for i = 1, max_n do
		double = 0
			for k = i, max_n do
				if array[i] == array[k] then
				double = double + 1
				end
			end
		if double > 1 then table.insert(index,i) end
		end
	end
	for d = 1, table.getn(index) do table.remove(array,index[d]) end
	end

	--pos = mag.get_pos("{\\pos(848,204)}Deneme.")
	-->>\\pos(848,204)
	--pos = mag.get_pos("Deneme.")
	-->>false
	--pos_x, pos_y = mag.get_pos("{\\pos(848,204)}Deneme.",true)
	-->>848
	-->>204
	--pos_x, pos_y = mag.get_pos("Deneme.",true)
	-->>false
	-->>false
	function mag.get_pos(str,xy_mode)
	local ptn1 = "\\pos%(%d+%.-%d-,%d+%.-%d-%)"
	local ptn2 = "\\pos%((%d+%.-%d-),(%d+%.-%d-)%)"
	if xy_mode == false or xy_mode == nil then
	if mag.match(str,ptn1) then return mag.match(str,ptn1) else return false end
	else
	if mag.match(str,ptn2) then return mag.match(str,ptn2) else return false,false end
	end
	end

	function mag.get_move(str,xy_mode)
	local ptn1 = "\\move%(%d+%.-%d-,%d+%.-%d-%,%d+%.-%d-,%d+%.-%d-%)"
	local ptn2 = "\\move%((%d+%.-%d-),(%d+%.-%d-),(%d+%.-%d-),(%d+%.-%d-)%)"
	if xy_mode == false or xy_mode == nil then
	if mag.match(str,ptn1) then return mag.match(str,ptn1) else return false end
	else
	if mag.match(str,ptn2) then return mag.match(str,ptn2) else return false,false,false,false end
	end
	end	

	--rfind_text = mag.rfind("Bu bir deneme.","e")
	-->>13
	--rfind_text = mag.rfind("Bu bir deneme.","a")
	-->>false
	function mag.rfind(str,pattern)
	local result
	local len = mag.len(str)
	for i = len, 1, -1 do result = mag.find(str,pattern,i) if result ~= nil then break end end
	return result
	end

	--ccount = mag.ccount("Deneme.","e")
	-->>3
	--ccount = mag.ccount("Deneme.","t")
	-->>0
	function mag.ccount(str,char) local _, count = mag.gsub(str,char,"") return count end

	--values = {5,8,1,2,4,7}
	--values = mag.revert_short_array(values)
	-->>7,4,2,1,8,5
	function mag.reverse_short_array(array)
	local array_temp = {}
	local array_length = table.getn(array)
	for i = 1, array_length do array_temp[i] = array[(array_length + 1) - i] end
	return array_temp
	end

	--values = {5,8,1,2,4,7}
	--mag.array_log(values)
	-->>5
	-->>8
	-->>1
	-->>2
	-->>4
	-->>7
	function mag.array_log(array) for i = 1, table.getn(array) do mag.log(array[i]) end end

	--sc, st = mag.vars("Bu, bir, deneme.")
	-->>3
	-->>Bu
	-->> bir
	-->> deneme.
	function mag.vars(str)
	local var = {}
	if mag.find(mag.reverse(str),",") ~= 1 then str = str.."," end
	for s in mag.gmatch(str,"(.-),%s*") do table.insert(var,s) end
	return table.getn(var), var
	end

	--numbers = {10,20,10,80,90,20,10,20,10,80,90,20,10,20,10,80,90,20}
	--mag.full_double(numbers)
	-->>10,80,90,20
	function mag.full_double(array)
	local c, index = 0, {}
	for i = 1, table.getn(array) do
	c = 0
	for j = i, table.getn(array) do if array[i] == array[j] then c = c + 1 end end
	if c > 1 then table.insert(index,i) end
	end
	c = 0
	for k = 1, table.getn(index) do table.remove(array,index[k] - c) c = c + 1 end
	end

	--mag.words("Lorem ipsum {\\bord2}dolor sit amet, {\\shad3}consectetur {lorem} adipiscing elit.")
	-->>Lorem 
	-->>ipsum 
	-->>{\bord2}dolor 
	-->>sit 
	-->>amet, 
	-->>{\shad3}consectetur 
	-->>{lorem} 
	-->>adipiscing 
	-->>elit.
	function mag.words(str)
	str = str.." "
	local word, w, in_tags = {}, "", false
	for c in unicode.chars(str) do
	if c == "{" then in_tags = true end
	w = w..c
	if not in_tags and c == " " then table.insert(word,w) w = "" end
	if c == "}" then in_tags = false end
	end
	word[table.getn(word)] = mag.sub(word[table.getn(word)],1,-2)
	return table.getn(word), word
	end

	--txt_lmt = mag.text_limit("Bu bir deneme.",5)
	-->>Bu bi
	function mag.text_limit(text,limit,dot)
	local dots = ""
	if dot == true and limit < mag.len(text) then dots = "..." end
	local s, n = "", 0
	for c in unicode.chars(text) do
	n = n + 1
	s = s..c
	if n == limit then break end
	end
	if dot == true then s = mag.right_space_trim(s) end
	return s..dots
	end

	--mag.usub("Bu bır deneme. Bu da bir deneme. Bu hala bir deneme.",1,10)
	-->>Bu bır den
	function mag.usub(text,trim1,trim2)
	local s, n = "", 0
	for c in unicode.chars(text) do n = n + 1 if n >= trim1 and n <= trim2 then s = s..c end end
	return s
	end

	--finds = mag.finds("Bu bir deneme. Bu da bir deneme. Bu hala bir deneme.","deneme",0,false)
	-->>9
	-->>27
	-->>47
	--finds = mag.finds("Bu bir de.neme. Bu da bir deneme. Bu hala bir deneme.","de.neme",-3,true)
	-->>6
	-->>24
	-->>44
	function mag.finds(text,pattern,int,regex)
	if not int then int = 0 end
	if not regex then regex = false end
	local f, next_find = {}, 0
	if mag.match(text,pattern) then
		while true do
		next_find = mag.find(text,pattern,next_find + 1,regex)
		if not next_find then break end
		table.insert(f,next_find + int)
		end
	end
	if f[1] then return f else return false end	
	end

	--text = mag.space_trim("   bu       bir deneme.    {deneme}     ")
	-->>bu       bir deneme.{deneme}
	--text = mag.space_trim(" {deneme deneme}  bu bir     deneme.    {deneme}     ")
	-->>{deneme deneme}bu bir     deneme.{deneme}
	function mag.space_trim(text)
	local txt = text
	txt = mag.left_space_trim(txt)
	txt = mag.right_space_trim(txt)
	return txt
	end

	--text = mag.left_space_trim("   bu       bir deneme.    {deneme}     ")
	-->>bu       bir deneme.    {deneme}     
	--text = mag.left_space_trim(" {deneme deneme}  bu bir     deneme.    {deneme}     ")
	-->>{deneme deneme}bu bir     deneme.    {deneme}     
	function mag.left_space_trim(text)
	local s, in_tags, first, w = "", false, false, false
	for c in unicode.chars(text) do
	if c == "{" then in_tags = true end
	if mag.match(c,"[^%s]") and not in_tags then first = true end
	if mag.match(c,"%s") and not in_tags and not first then w = true else w = false end
	if w == false then s = s..c end
	if c == "}" then in_tags = false end
	end
	return s
	end

	--text = mag.right_space_trim("   bu       bir deneme.    {deneme}     ")
	-->>   bu       bir deneme.{deneme}
	--text = mag.right_space_trim(" {deneme deneme}  bu bir     deneme.    {deneme}     ")
	-->> {deneme deneme}  bu bir     deneme.{deneme}
	function mag.right_space_trim(text)
	text = mag.reverse(text)
	local s, in_tags, last, w = "", false, false, false
	for c in unicode.chars(text) do
	if c == "}" then in_tags = true end
	if mag.match(c,"[^%s]") and not in_tags then last = true end
	if mag.match(c,"%s") and not in_tags and not last then w = true else w = false end
	if w == false then s = s..c end
	if c == "{" then in_tags = false end
	end
	return mag.reverse(s)
	end

	--mag.time_strip("0:01:30.30")
	--90300
	function mag.time_strip(time)
	if mag.match(time,"(%d+):(%d+):(%d+)%.(%d+)") then
	local hour, min, sec, ms = mag.match(time,"(%d+):(%d+):(%d+)%.(%d+)")
	local result
	result = mag.format("%s%s%s",hour * 36,mag.n(min) * 60 + sec,ms)
	result = mag.n(result)
	result = result * 10
	return result
	else
	return 0
	end
	end

	mag.s       = tostring
	mag.n       = tonumber
	mag.floor   = math.floor
	mag.ceil    = math.ceil
	mag.rand    = math.random
	mag.char    = string.char
	mag.find    = string.find
	mag.format  = string.format
	mag.gmatch  = string.gmatch
	mag.gsub    = string.gsub
	mag.length  = string.len
	mag.match   = string.match
	mag.rep     = string.rep
	mag.reverse = string.reverse
	mag.sub     = string.sub
	mag.upper   = string.upper
	mag.lower   = string.lower
	mag.up      = unicode.to_upper_case
	mag.low     = unicode.to_lower_case
	mag.len     = unicode.len
	mag.rmacro  = aegisub.register_macro

	return mag