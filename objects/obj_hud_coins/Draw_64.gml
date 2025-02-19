/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 2A198ACB
/// @DnDArgument : "obj" "Obj_player"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "obj" "Obj_player"
var l2A198ACB_0 = false;
l2A198ACB_0 = instance_exists(Obj_player);
if(!l2A198ACB_0)
{
	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 0EE62A5F
	/// @DnDParent : 2A198ACB
	exit;
}

/// @DnDAction : YoYo Games.Drawing.Draw_Self
/// @DnDVersion : 1
/// @DnDHash : 10E1AD29
draw_self();

/// @DnDAction : YoYo Games.Drawing.Set_Font
/// @DnDVersion : 1
/// @DnDHash : 07929B0B
/// @DnDArgument : "font" "font_opensans"
draw_set_font(font_opensans);

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 52BC27B2
/// @DnDArgument : "x" "30"
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "-15"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "caption" ""Coins:""
/// @DnDArgument : "var" "obj_player, coins"
draw_text(x + 30, y + -15, string("Coins:") + string(obj_player, coins));