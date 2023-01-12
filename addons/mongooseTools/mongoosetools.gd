tool
extends EditorPlugin

const MongooseLevel = preload("res://addons/mongooseTools/mongooseLevel.gd")
const level_icon = preload("res://addons/mongooseTools/level.png")

var ed_interface
var ed_inspector

func _enter_tree():
	add_custom_type("MongooseLevel", "Spatial", MongooseLevel, level_icon)
	ed_interface = get_editor_interface()
	ed_inspector = ed_interface.get_inspector()


func _exit_tree():
	ed_inspector = null
	ed_interface = null
	remove_custom_type("MongooseLevel")
