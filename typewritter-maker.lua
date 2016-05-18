--[[

AÇIKLAMA!

Girilen değere göre karakter geçişi yapar. Başlangıç ve bitiş zamanları milisaniye cinsindedir.

"Başlangıç(ms):" -> Satır süresinin başlangıcından Başlangıç(ms) kutucuğuna girilen süre arasında
 karakter geçişi yapar.

"Bitiş(ms)" -> Satır süresinin sonundan Bitiş(ms) kutucuğuna girilen değer arasında geriye doğru
karakter geçişi yapar.

"Geçişi kaldır." -> Bir önceki karakterin süresiyle o anki karakterin süresi arasında alpha etiketiyle
oluşturulmuş geçişi kaldırır.

"Diğer yönden başlat." -> Başlangıçta sağdan sola yerine soldan sağa karakter geçişi yapar.

"Diğer yönden bitir." -> Bitişte sağdan sola yerine soldan sağa karakter geçişi yapar.

]]

script_name="Typewritter Maker"
script_description="Daktilo tarzı ekran yazılarına yardım eder"
script_author="Magnum357"
script_version="1.3"

		--Global değişkenler
		tr_chars 				= {"ş","Ş","ç","Ç","İ","ı","ğ","Ğ","ü","Ü","ö","Ö","â","Â"}
		eng_chars				= {"s","S","c","C","I","i","g","G","u","U","o","O","a","A"}
		tr_sign 				= "t4r"

		--Seçili satırlara işlem yapmak için sel(selected_lines) parametresi dahil edildi
function typewritter_maker(sub, sel)

		--Birden fazla seçili satıra işlem yapmak için döngü açıldı
	for si,li in ipairs(sel) do
		
		local line 				= sub[li]
		local l_stripped		= sub[li]
		local tags = ""
		if line.text:find("{") then
		tags 					= line.text:sub(line.text:find("{"),line.text:find("}"))
		end
		--Alpha etiketleri bulundu
		local alpha_tag 		= line.text:match("\\alpha&?H?%x+&?")

		local one_a_tag 		= line.text:match("\\1a&?.?%x+&?")
		local two_a_tag 		= line.text:match("\\2a&?.?%x+&?")
		local three_a_tag 		= line.text:match("\\3a&?.?%x+&?")
		local four_a_tag 		= line.text:match("\\4a&?.?%x+&?")
		--Satır, etiketlerden temizlendi
		l_stripped.text 		= l_stripped.text:gsub("{[^}]+}", "")
		--Satırdaki Türkçe karakterler İngilizceye çevrildi
		local tr_to_eng		 	= convert_to_eng(l_stripped.text)
		--Satırdaki Türkçe karakterler İngilizce çevrilip 
		--hangi karakterlerin çevrildiğini anlamak için işaret konuldu
		local tr_to_eng_sign	= put_eng_sign(l_stripped.text)
		--Satırın karakter sayısı bulundu
		local l_count 			= string.len(tr_to_eng)
		local l_chars 			= {}
		local l_end 			= line.end_time

		--Kullanıcıdan alınan bilgiler
		local s_time 			= results["tw_start"]
		local e_time 			= results["tw_end"]

		local fad_mode 			= results["fade_mode"]
		local s_reverse		 	= results["s_reverse"]
		local e_reverse		 	= results["e_reverse"]

		--Hata kontrolleri
		if s_time == 0 and e_time == 0 then
			aegisub.log("Başlangıç ve bitiş süreleri girilmedi.")
		end

		if s_time == -2147483648 or e_time == -2147483648 then
			aegisub.log("İşleme alınamayacak değerler girildi.")
		end

		if s_time < 1 and s_reverse then
			aegisub.log("Bu işlemin bir anlamı yok! Başlangıç zamanı girilmeden 'Diğer yönden başlat.' seçeneği seçildi.")
		end

		if e_time < 1 and e_reverse then
			aegisub.log("Bu işlemin bir anlamı yok! Bitiş zamanı girilmeden 'Diğer yönden bitir.' seçeneği seçildi.")
		end

		local start_t_interval 	= math.floor(s_time / l_count)
		local end_t_interval 	= math.floor(e_time / l_count)
		local tr_char_count 	= 0

		if not one_a_tag then one_a_tag = "" end
		if not two_a_tag then two_a_tag = "" end
		if not three_a_tag then three_a_tag = "" end
		if not four_a_tag then four_a_tag = "" end

		if not alpha_tag then alpha_tag = "\\alpha&H00&" end

		if one_a_tag or two_a_tag or three_a_tag or four_a_tag then 
		alpha_tag = alpha_tag .. one_a_tag .. two_a_tag .. three_a_tag .. four_a_tag
		end

		for i=1, l_count, 1 do

		if fad_mode then
		s_start_time 			= start_t_interval * (i-1)
		s_end_time 			  	= s_start_time
		e_start_time			= l_end - end_t_interval * (i-1)
		e_end_time				= e_start_time
		else
		s_start_time 			= start_t_interval * (i-1)
		s_end_time   			= start_t_interval * i
		e_start_time			= l_end - end_t_interval * (i-1)
		e_end_time				= l_end - end_t_interval * i
		end

		if s_reverse then
			s_start_time 		= s_time - s_start_time
			s_end_time 			= s_time - s_end_time
		end

		if e_reverse then
			e_start_time 		= (l_end - e_time) + end_t_interval * (i-1)
			e_end_time 			= (l_end - e_time) + end_t_interval * i

		if fad_mode then
			e_start_time 		= (l_end - e_time) + end_t_interval * (i-1)
			e_end_time 			= e_start_time
		end		
		end		

		if tr_to_eng_sign:sub(i+1+(tr_char_count*3),i+3+(tr_char_count*3)) == "t4r" then 
		tr_char_count			= tr_char_count+1
		sign 					= tr_sign
		else
		sign 					= ""
		end

		if s_time > 0 then
		if s_end_time == 0 then s_end_time = 1 end
		start_transform 		= string.format("{\\alpha&HFF&\\t(%d,%d,%s)}",s_start_time,s_end_time,alpha_tag)
		else
		start_transform 		= ""
		end

		if e_time > 0 then

		if s_time > 0 then alpha_var = "" else alpha_var = alpha_tag end

		end_transform 			= string.format("{%s\\t(%d,%d,\\alpha&HFF&)}",alpha_var,e_start_time,e_end_time)
		else
		end_transform 			= ""
		end

		l_chars[i]				= start_transform .. end_transform .. string.format("%s",tr_to_eng:sub(i,i)..sign)

		end

		l_all_chars 			= table.concat(l_chars)
		l_all_chars				= convert_to_tr(l_all_chars)
		line.text 				= tags .. l_all_chars
		sub[li]					= line

	end
end

function convert_to_eng(line)

	for i=1, table.getn(tr_chars) do
	line = line:gsub(tr_chars[i],eng_chars[i])
	end

	return line
end

function convert_to_tr(line)

	for i=1, table.getn(tr_chars) do
	line = line:gsub(eng_chars[i]..tr_sign,tr_chars[i])
	end

	return line
end

function put_eng_sign(line)

	for i=1, table.getn(tr_chars) do
	line = line:gsub(tr_chars[i],eng_chars[i]..tr_sign)
	end

	return line
end

function config(sub, sel)

buttons = {"Uygula","Kapat"}

dialog_config=
{
    {
        class="label",
        x=0,y=0,width=1,height=1,
        label="Başlangıç(ms):"
    },{
        class="intedit",name="tw_start",
        x=1,y=0,width=1,height=1,
        value=0
    },{
        class="label",
        x=0,y=1,width=1,height=1,
        label="Bitiş(ms):"
    },{
        class="intedit",name="tw_end",
        x=1,y=1,width=1,height=1,
        value=0
    },{
        class="checkbox",name="fade_mode",
        x=0,y=2,width=2,height=1,
        label="Geçişi kaldır.",
        value=true
    },
	{
        class="checkbox",name="s_reverse",
        x=0,y=3,width=2,height=1,
        label="Diğer yönden başlat.",
        value=false
    },
	{
        class="checkbox",name="e_reverse",
        x=0,y=4,width=2,height=1,
        label="Diğer yönden bitir.",
        value=false
    },    
}
	pressed, results = aegisub.dialog.display(dialog_config,buttons)
	if pressed	==	buttons[1]	then typewritter_maker(sub, sel) 	end
	if pressed	==	buttons[2]	then aegisub.cancel() 				end
end

-- Arayüz

function add_macro(sub, sel)
    config(sub, sel)
    aegisub.set_undo_point(script_name)
    return sel
end

-- Fonksiyon Kaydı

aegisub.register_macro(script_name, script_description, add_macro)
