extends EditorInspectorPlugin

var MongooseLevel := preload("res://addons/mongooseTools/mongooseLevel.gd")

func can_handle(object):
	if object is MongooseLevel:
		print ("OK!")
		return true
	else:
		print (object)
		return false

func parse_property(object, type, path, hint, hint_text, usage) -> bool:
	if type == TYPE_STRING:
		prints(object, type, path, hint, hint_text, usage)
	return false
