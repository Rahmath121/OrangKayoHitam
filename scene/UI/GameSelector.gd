extends Control

var selesai = false

func _ready():
	Change.play("home")
	
	appear($Panel)
	yield(get_tree().create_timer(0.6),"timeout")
	appear($Panel2)
	yield(get_tree().create_timer(0.6),"timeout")
	appear($Panel3)
	yield(get_tree().create_timer(0.6),"timeout")
	selesai = true
func _on_Button_pressed():
# warning-ignore:return_value_discarded
	if selesai == true:
		get_tree().change_scene("res://scene/HitungGambar/HitungGambar.tscn")

func _on_Button2_pressed():
	if selesai == true:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scene/Matching/MatchingGambar.tscn")

func _on_Button3_pressed():
# warning-ignore:return_value_discarded
	if selesai == true:
		get_tree().change_scene("res://scene/puzzlev2/PuzzleV2.tscn")

func appear(lokasi):
	
	$Tween.interpolate_property(lokasi, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween.start()


func _on_TextureButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")
