extends Control


# warning-ignore:unused_argument
func _process(delta):
	$TextureProgress.value += 1
	if $TextureProgress.value == 100:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://MainMenu.tscn")
