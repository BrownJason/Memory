extends Node

var _item_images: Array = []

func _ready():
	load_item_images()
	
func add_image_to_dictionary(fn: String, path: String) -> void:
	var full_path = path + "/" + fn
	
	var ii_dict = {
		"item_name": fn.rstrip(".png"),
		"item_texture": load(full_path)
	}
	
	_item_images.append(ii_dict)
	
func load_item_images() -> void:
	var path = "res://assets/glitch"
	var dir = DirAccess.open(path)
	
	if not dir:
		print("Error")
		return
	
	var file_names = dir.get_files()
	
	for fn in file_names:
		if ".import" not in fn:
			add_image_to_dictionary(fn, path)
			
	print("loaded:", _item_images.size())

func get_random_item_image() -> Dictionary:
	return _item_images.pick_random()
