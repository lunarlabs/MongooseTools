tool
extends EditorPlugin

var level_info_dock

func _enter_tree():
	add_custom_type("MongooseLevel", "Spatial",\
	 preload("res://addons/mongooseTools/mongooseLevel.gd"),\
	 preload("res://addons/mongooseTools/level.png"))
	#level_info_dock = preload("res://addons/mongooseTools/LevelEditor.tscn").instance()
	#add_control_to_bottom_panel(level_info_dock, "Level Data")


func _exit_tree():
	#remove_control_from_bottom_panel(level_info_dock)
	#level_info_dock.free()
	remove_custom_type("MongooseLevel")
