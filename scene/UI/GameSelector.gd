extends Control

func _ready():
	Change.play("home")
	
	appear($Panel)
	yield(get_tree().create_timer(0.6),"timeout")
	appear($Panel2)
	yield(get_tree().create_timer(0.6),"timeout")
	appear($Panel3)
	
func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scene/HitungGambar/HitungGambar.tscn")

func _on_Button2_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scene/Matching/MatchingGambar.tscn")

func _on_Button3_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scene/puzzle/puzzel.tscn")

func appear(lokasi):
	
	$Tween.interpolate_property(lokasi, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween.start()
