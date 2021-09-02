extends Node2D


func _ready():
	Musiccontroller.Scene11()
	yield(get_tree().create_timer(13.5),"timeout")
	$Control/Panel/Label.visible = false
	masuk($Control/Panel/Label2)

func masuk(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func keluar(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()	


func _on_narasi_finished():
	yield(get_tree().create_timer(1),"timeout")
	Change.change_scene("res://cerita/scene12/Scene12.tscn")
