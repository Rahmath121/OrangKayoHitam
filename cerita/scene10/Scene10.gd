extends Node2D

var dialog_selesai = false
var Dialog = 1
func _ready():
	Musiccontroller.Scene10()
	Mute()
func masuk(lokasi):
	lokasi.visible = true
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func keluar(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	lokasi.visible = false

func _on_narasi_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		masuk($Control/dialog1)
		yield(get_tree().create_timer(0.7),"timeout")
		$dialog.play()



func _on_dialog_finished():
	if Musiccontroller.mute == false:
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
	if Musiccontroller.mute == false:
		keluar($Control/dialog4)
		yield(get_tree().create_timer(1.5),"timeout")
		masuk($Control/dialog5)
		$dialog3.play()
		yield(get_tree().create_timer(10.5),"timeout")
		$Control/dialog5.visible = false
		masuk($Control/dialog6)


func _on_dialog3_finished():
	if Musiccontroller.mute == false:
		yield(get_tree().create_timer(1),"timeout")
		Change.change_scene("res://cerita/scene11/Scene11.tscn")




func _on_back_pressed():
	$click.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")
func _on_mute_pressed():
	$click.play()
	Dialog = 1
	dialog_selesai = false
	keluar($Control/dialog1)
	keluar($Control/dialog2)
	keluar($Control/dialog3)
	keluar($Control/dialog4)
	keluar($Control/dialog5)
	keluar($Control/dialog6)
	if  Musiccontroller.mute == false:
		Musiccontroller.mute = true
		$narasi.stop()
		$dialog.stop()
		$dialog2.stop()
		$dialog3.stop()
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mute.png")
	else:
		$narasi.play()
		Musiccontroller.mute = false
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mutenot.png")



func _on_next_pressed():
	$click.play()
	if  Musiccontroller.mute == true:
		if dialog_selesai == false:
			if Dialog == 1:
				Dialog += 1
				masuk($Control/dialog1)
			elif Dialog == 2:
				Dialog += 1
				keluar($Control/dialog1)
				masuk($Control/dialog2)
			elif Dialog == 3:
				Dialog += 1
				$Control/dialog2.visible = false
				masuk($Control/dialog3)
			elif Dialog == 4:
				Dialog += 1
				$Control/dialog3.visible = false
				masuk($Control/dialog4)
			elif Dialog == 5:
				Dialog += 1
				keluar($Control/dialog4)
				masuk($Control/dialog5)
			elif Dialog == 6:
				Dialog += 1
				$Control/dialog5.visible = false
				masuk($Control/dialog6)
				dialog_selesai = true
		else:
			Change.change_scene("res://cerita/scene11/Scene11.tscn")
	else:
		Change.change_scene("res://cerita/scene11/Scene11.tscn")

func Mute():
	if Musiccontroller.mute == false:
		$narasi.play()
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mutenot.png")
	else:
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mute.png")


func _on_prev_pressed():
	Change.change_scene("res://cerita/scene9/Scene9.tscn")
