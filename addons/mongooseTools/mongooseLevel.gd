tool
extends Spatial

export(String, FILE, "*.mmlvl") var level_metadata
export(String) var level_name
export(String) var level_subtitle
export(String) var level_author
export(String, FILE, "*.ogg") var level_music
export(String, FILE, "*.mmlvl") var next_level
export(String, FILE, "*.mmlvl") var secret_level
export(String, FILE, "*.tscn") var bonus_stage

func _enter_tree():
	if not Engine.editor_hint:
		pause_mode = Node.PAUSE_MODE_STOP

func _get_configuration_warning() -> String:
	var result: = PoolStringArray()
	var has_start = false;
	var has_exit = false;
	for i in get_children():
		if i.filename == "res://entities/MakinaStart.tscn":
			has_start = true;
		if i.has_signal("finish_level"):
			has_exit = true;
	if not has_start:
		result.append("There is no MakinaStart placed in the level.")
	if not has_exit:
		result.append("There is no object that emits the finish_level signal, " +
		"so the level can't be completed.")
	return result.join("\n")
