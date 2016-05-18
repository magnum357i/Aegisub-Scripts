	script_name="Fix Timing"
	script_description="Ön izlemede görünmeyen satırların zamanlamasını düzeltir."
	script_author="Magnum357"
	script_version="1.0"

	function line_breaker_chk(subs,sel,config)
	local style_name = config["u_style_name"]
	for i = 1, #subs do
	if subs[i].class == "dialogue" then
	if subs[i].style == style_name then
	line=subs[i]
	line.start_time = aegisub.ms_from_frame(aegisub.frame_from_ms(line.start_time))
	line.end_time = aegisub.ms_from_frame(aegisub.frame_from_ms(line.end_time))
	subs[i]=line
	end
	end
	end
	end

	function collect_styles(subs)
	local n, styles = 0, {}
	for i = 1, #subs do
	local sub = subs[i]
	if sub.class == "style" then
	n = n + 1
	styles[n] = sub.name
	end
	end
	return styles
	end

	function create_config(subs)
	local dialog_config=
	{
	{
    class="label",
    x=0,y=0,width=1,height=1,
    label="Stil seç:"
    },{
	class="dropdown",name="u_style_name",
	x=1,y=0,width=1,height=1,
	items={"Seç"},value="Seç"
	},
	}
	for _, style in ipairs(collect_styles(subs)) do
	table.insert(dialog_config[2].items,style)
	end
	return dialog_config
	end

	function add_macro(subs)
	local ok, config
	repeat
	ok, config = aegisub.dialog.display(create_config(subs),{"Uygula","Kapat"})
	until config.u_style_name ~= "Seç" or ok == "Kapat"
	if ok == "Uygula" then
	line_breaker_chk(subs,sel,config)
    aegisub.set_undo_point(script_name)
	end
	end

	aegisub.register_macro(script_name, script_description, add_macro)
