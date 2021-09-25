extends Node2D


func _ready():
	Musiccontroller.Scene11()
	Mute()


func masuk(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func keluar(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()	


func _on_narasi_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		yield(get_tree().create_timer(1),"timeout")
		Change.change_scene("res://cerita/scene12/Scene12.tscn")



func _on_back_pressed():
	$click.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")

func _on_mute_pressed():
	$click.play()
	if  Musiccontroller.mute == false:
		Musiccontroller.mute = true
		$narasi.stop()
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mute.png")
	else:
		$narasi.play()
		Musiccontroller.mute = false
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mutenot.png")



func _on_next_pressed():
	$click.play()
	Change.change_scene("res://cerita/scene12/Scene12.tscn")

func Mute():
	
	if Musiccontroller.mute == false:
		$narasi.play()
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mutenot.png")
	else:
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mute.png")


func _on_prev_pressed():
	Change.change_scene("res://cerita/scene10/Scene10.tscn")
