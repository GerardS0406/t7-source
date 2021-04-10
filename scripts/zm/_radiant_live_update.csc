// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\codescripts\struct;
#using scripts\shared\system_shared;

#namespace radiant_live_udpate;

/*
	Name: __init__sytem__
	Namespace: radiant_live_udpate
	Checksum: 0x95B1FF47
	Offset: 0xB8
	Size: 0x34
	Parameters: 0
	Flags: AutoExec
*/
autoexec function __init__sytem__()
{
	/#
		system::register("", &__init__, undefined, undefined);
	#/
}

/*
	Name: __init__
	Namespace: radiant_live_udpate
	Checksum: 0x689E53D2
	Offset: 0xF8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	/#
		thread scriptstruct_debug_render();
	#/
}

/*
	Name: scriptstruct_debug_render
	Namespace: radiant_live_udpate
	Checksum: 0x536EA647
	Offset: 0x120
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function scriptstruct_debug_render()
{
	/#
		while(1)
		{
			level waittill(#"liveupdate", selected_struct);
			if(isdefined(selected_struct))
			{
				level thread render_struct(selected_struct);
			}
			else
			{
				level notify(#"stop_struct_render");
			}
		}
	#/
}

/*
	Name: render_struct
	Namespace: radiant_live_udpate
	Checksum: 0x595B7E89
	Offset: 0x190
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function render_struct(selected_struct)
{
	/#
		self endon(#"stop_struct_render");
		while(isdefined(selected_struct))
		{
			box(selected_struct.origin, vectorscale((-1, -1, -1), 16), vectorscale((1, 1, 1), 16), 0, (1, 0.4, 0.4));
			wait(0.01);
		}
	#/
}
