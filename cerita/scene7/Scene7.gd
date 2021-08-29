extends Node2D



func masuk(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func keluar(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
func _on_narasi_finished():
	masuk($Control/dialog)
	yield(get_tree().create_timer(0.7),"timeout")
	$dialog.play()

func _on_dialog_finished():
	keluar($Control/dialog)
	yield(get_tree().create_timer(1),"timeout")
	masuk($Control/dialog2)
	$dialog2.play()
	yield(get_tree().create_timer(4.5),"timeout")
	$Control/dialog2.visible = false
	masuk($Control/dialog3)
	


func _on_dialog2_finished():
	yield(get_tree().create_timer(1),"timeout")
	Change.change_scene("res://cerita/scene8/Scene8.tscn")
