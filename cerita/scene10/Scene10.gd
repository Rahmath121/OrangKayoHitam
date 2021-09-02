extends Node2D

func _ready():
	Musiccontroller.Scene10()

func masuk(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func keluar(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func _on_narasi_finished():
	masuk($Control/dialog1)
	yield(get_tree().create_timer(0.7),"timeout")
	$dialog.play()



func _on_dialog_finished():
	keluar($Control/dialog1)
	yield(get_tree().create_timer(0.7),"timeout")
	$dialog2.play()
	masuk($Control/dialog2)
	yield(get_tree().create_timer(7.9),"timeout")
	$Control/dialog2.visible = false
	masuk($Control/dialog3)
	yield(get_tree().create_timer(9.7),"timeout")
	$Control/dialog3.visible = false
	masuk($Control/dialog4)


func _on_dialog2_finished():
	keluar($Control/dialog4)
	yield(get_tree().create_timer(1.5),"timeout")
	masuk($Control/dialog5)
	$dialog3.play()
	yield(get_tree().create_timer(10.5),"timeout")
	$Control/dialog5.visible = false
	masuk($Control/dialog6)


func _on_dialog3_finished():
	yield(get_tree().create_timer(1),"timeout")
	Change.change_scene("res://cerita/scene11/Scene11.tscn")
