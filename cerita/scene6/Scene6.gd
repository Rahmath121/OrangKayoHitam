extends Node2D


func _ready():
	Musiccontroller.Scene6()
	yield(get_tree().create_timer(1),"timeout")
	$narasi1.play()
func masuk(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func keluar(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func _on_narasi1_finished():
	masuk($Control/dialog1)
	yield(get_tree().create_timer(0.7),"timeout")
	$dialog1.play()
	

func _on_dialog1_finished():
	keluar($Control/dialog1)
	yield(get_tree().create_timer(0.7),"timeout")
	$Control/Panel/narasi.visible = false
	masuk($Control/Panel/narasi2)
	$narasi2.play()


func _on_narasi2_finished():
	masuk($Control/dialog2)
	yield(get_tree().create_timer(0.7),"timeout")
	$dialog2.play()


func _on_dialog2_finished():
	keluar($Control/dialog2)
	yield(get_tree().create_timer(0.7),"timeout")
	masuk($Control/dialog3)
	$dialog3.play()


func _on_dialog3_finished():
	Change.change_scene("res://MainMenu.tscn")
