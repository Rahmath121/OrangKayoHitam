extends Node2D

func _ready():
	Musiccontroller.Scene8()
	yield(get_tree().create_timer(9.7),"timeout")
	$Control/Panel/narasi1.visible  = false
	masuk($Control/Panel/narasi2)
	yield(get_tree().create_timer(11.5),"timeout")
	$Control/Panel/narasi2.visible = false
	masuk($Control/Panel/narasi3)
func masuk(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func keluar(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()	


func _on_narasi_finished():
	masuk($Control/dialog)
	yield(get_tree().create_timer(1),"timeout")
	$dialog.play()


func _on_dialog_finished():
	keluar($Control/dialog)
	yield(get_tree().create_timer(1),"timeout")
	masuk($Control/dialog2)
	$dialog2.play()


func _on_dialog2_finished():
	keluar($Control/dialog2)
	Musiccontroller.Scene6()
	yield(get_tree().create_timer(1),"timeout")
	masuk($Control/dialog3)
	$dialog3.play()


func _on_dialog3_finished():
	yield(get_tree().create_timer(1),"timeout")
	Change.change_scene("res://cerita/scene9/Scene9.tscn")
