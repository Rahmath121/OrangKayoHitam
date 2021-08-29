extends Node2D



var narasi2 = load("res://asset/cerita/scene5/Narasi_Scene5_2.wav")

func _ready():
	Musiccontroller.Scene5()
	


func _on_narasi_finished():
	yield(get_tree().create_timer(1),"timeout")
	$Tween.interpolate_property($Control/dialog1, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$dialog.play()
	

func _on_dialog_finished():
	$Tween.interpolate_property($Control/dialog1, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	yield(get_tree().create_timer(1),"timeout")
	$Control/Panel/narasi.visible = false
	$narasi2.play()
	$Tween.interpolate_property($Control/Panel/narasi2, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func _on_narasi2_finished():
	yield(get_tree().create_timer(1),"timeout")
	$Tween.interpolate_property($Control/dialog2, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$dialog2.play()


func _on_dialog2_finished():
	$Tween.interpolate_property($Control/dialog2, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	yield(get_tree().create_timer(1),"timeout")
	$Tween.interpolate_property($Control/dialog3, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$dialog3.play()


func _on_dialog3_finished():
	$Tween.interpolate_property($Control/dialog3, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	yield(get_tree().create_timer(1),"timeout")
	$dialog4.play()
	$Tween.interpolate_property($Control/dialog4, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()


func _on_dialog4_finished():
	$Tween.interpolate_property($Control/dialog4, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	yield(get_tree().create_timer(1),"timeout")
	$Control/Panel/narasi2.visible = false
	$Tween.interpolate_property($Control/Panel/narasi3, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	$narasi3.play()
func _on_narasi3_finished():
	yield(get_tree().create_timer(1),"timeout")
	Change.change_scene("res://cerita/scene6/Scene6.tscn")
