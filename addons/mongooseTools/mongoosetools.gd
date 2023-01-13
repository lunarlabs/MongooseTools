tool
extends EditorPlugin

const MongooseLevel = preload("res://addons/mongooseTools/mongooseLevel.gd")
const level_icon = preload("res://addons/mongooseTools/level.png")

var ed_interface: EditorInterface

func _enter_tree():
	add_custom_type("MongooseLevel", "Spatial", MongooseLevel, level_icon)
	ed_interface = get_editor_interface()
	add_tool_menu_item("Make Level Manifest", self, "make_manifest")

func _exit_tree():
	remove_tool_menu_item("Make Level Manifest")
	ed_interface = null
	remove_custom_type("MongooseLevel")

func make_manifest(_dummy):
	var from: Node = ed_interface.get_edited_scene_root()
	var metadata_location
	if from is MongooseLevel:
		var manifest: ConfigFile = ConfigFile.new()
		if not from.level_metadata.empty():
			metadata_location = from.level_metadata
			manifest.set_value("MongooseLevel", "pathToLevelScene", from.filename)
		elif not from.filename.empty():
			metadata_location = from.filename.get_basename() + ".mmlvl"
			from.level_metadata = metadata_location
		else:
			print("Scene not in filesystem. Aborting.")
			return
		#fi
		print("Writing to ", metadata_location)
		if not from.level_name.empty():
			manifest.set_value("MongooseLevel", "levelName", from.level_name)
		if not from.level_subtitle.empty():
			manifest.set_value("MongooseLevel", "levelSubtitle", from.level_subtitle)
		if not from.level_author.empty():
			manifest.set_value("MongooseLevel", "levelAuthor", from.level_author)
		if not from.level_music.empty():
			manifest.set_value("MongooseLevel", "levelMusic", from.level_music)
		manifest.save(metadata_location)
	else:
		print("Scene not a MongooseLevel. Aborting.")
		return
