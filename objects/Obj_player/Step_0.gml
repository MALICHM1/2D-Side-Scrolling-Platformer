/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 4AF7CF76
/// @DnDComment : I would be pressing right$(13_10)-1 would be pressing left$(13_10)0 would be no input.
/// @DnDArgument : "expr" "keyboard_check(vk_right) - keyboard_check(vk_left)"
/// @DnDArgument : "var" "move_x"
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);

/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
/// @DnDVersion : 1
/// @DnDHash : 2F94C024
/// @DnDArgument : "msg" "move_x"
show_debug_message(string(move_x));

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 532290C1
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "Obj_ground"
/// @DnDSaveInfo : "object" "Obj_ground"
var l532290C1_0 = instance_place(x + 0, y + 2, [Obj_ground]);
if ((l532290C1_0 > 0))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 14B597E2
	/// @DnDComment : reset the falling speed on$(13_10)movement y when landed$(13_10)on ground
	/// @DnDParent : 532290C1
	/// @DnDArgument : "var" "move_y"
	move_y = 0;

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
	/// @DnDVersion : 1
	/// @DnDHash : 0A0274B7
	/// @DnDParent : 532290C1
	var l0A0274B7_0;
	l0A0274B7_0 = keyboard_check_pressed(vk_space);
	if (l0A0274B7_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 0B3AE78B
		/// @DnDComment : Jump
		/// @DnDParent : 0A0274B7
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 646E81AE
/// @DnDComment : If not on the floor.
else
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7185AEE5
	/// @DnDComment : If we are falling after a jump
	/// @DnDParent : 646E81AE
	/// @DnDArgument : "var" "move_y"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "10"
	if(move_y < 10)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6E473792
		/// @DnDComment : Adds gravity
		/// @DnDParent : 7185AEE5
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "move_y"
		move_y += 1;
	}
}

/// @DnDAction : YoYo Games.Movement.move_and_collide
/// @DnDVersion : 1
/// @DnDHash : 1C478BEC
/// @DnDArgument : "xvel" "move_x"
/// @DnDArgument : "yvel" "move_y"
/// @DnDArgument : "maxxmove" "walk_speed"
/// @DnDArgument : "maxymove" "jump_speed"
/// @DnDArgument : "object" "Obj_ground"
/// @DnDSaveInfo : "object" "Obj_ground"
move_and_collide(move_x, move_y, Obj_ground,4,0,0,walk_speed,jump_speed);