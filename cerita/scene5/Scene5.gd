extends Node2D



var narasi2 = load("res://asset/cerita/scene5/Narasi_Scene5_2.wav")
var Dialog = 1
var dialog_complete = false
func _ready():
	Musiccontroller.Scene5()
	Mute()


func _on_narasi_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		yield(get_tree().create_timer(1),"timeout")
		masuk($Control/dialog1)
		$dialog.play()
	

func _on_dialog_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		keluar($Control/dialog1)
		yield(get_tree().create_timer(1),"timeout")
		$Control/Panel/narasi.visible = false
		$narasi2.play()
		masuk($Control/Panel/narasi2)

func _on_narasi2_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		yield(get_tree().create_timer(1),"timeout")
		masuk($Control/dialog2)
		$dialog2.play()


func _on_dialog2_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		keluar($Control/dialog2)
		yield(get_tree().create_timer(1),"timeout")
		masuk($Control/dialog3)
		$dialog3.play()


func _on_dialog3_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		keluar($Control/dialog3)
		yield(get_tree().create_timer(1),"timeout")
		$dialog4.play()
		masuk($Control/dialog4)


func _on_dialog4_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		keluar($Control/dialog4)
		yield(get_tree().create_timer(1),"timeout")
		$Control/Panel/narasi2.visible = false
		masuk($Control/Panel/narasi3)
		$narasi3.play()
func _on_narasi3_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		yield(get_tree().create_timer(1),"timeout")
		Change.change_scene("res://cerita/scene6/Scene6.tscn")


func _on_mute_pressed():
	$click.play()
	Dialog = 1
	dialog_complete = false
	keluar($Control/dialog4)
	keluar($Control/dialog3)
	keluar($Control/dialog2)
	keluar($Control/dialog1)
	$Control/Panel/narasi.visible = true
	$Control/Panel/narasi2.visible = false
	$Control/Panel/narasi3.visible = false
	if Musiccontroller.mute == false:
		Musiccontroller.mute = true
		$narasi.stop()
		$narasi2.stop()
		$narasi3.stop()
		$dialog.stop()
		$dialog2.stop()
		$dialog3.stop()
		$dialog4.stop()
		
		
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mute.png")
		

	else:
		$narasi.play()
		Musiccontroller.mute = false
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mutenot.png")


func Mute():
	if Musiccontroller.mute == false:
		$narasi.play()
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mutenot.png")
		
	else:
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mute.png")
func _on_next_pressed():
	$click.play()
	if Musiccontroller.mute == true:
		if dialog_complete == false:
			if Dialog == 1:
				Dialog += 1
				masuk($Control/dialog1)
			elif Dialog == 2:
				Dialog += 1
				keluar($Control/dialog1)
				$Control/Panel/narasi.visible = false
				masuk($Control/Panel/narasi2)
			elif Dialog == 3:
				Dialog += 1
				masuk($Control/dialog2)
			elif Dialog == 4:
				Dialog += 1
				keluar($Control/dialog2)
				masuk($Control/dialog3)
			elif Dialog == 5:
				Dialog += 1
				keluar($Control/dialog3)
				masuk($Control/dialog4)
			elif Dialog == 6:
				Dialog += 1
				$Control/Panel/narasi2.visible = false
				keluar($Control/dialog4)
				masuk($Control/Panel/narasi3)
				dialog_complete = true
		else:
			Change.change_scene("res://cerita/scene6/Scene6.tscn")	
	else:	
		Change.change_scene("res://cerita/scene6/Scene6.tscn")	
func _on_back_pressed():
	$click.play()
	get_tree().change_scene("res://MainMenu.tscn")


func _on_prev_pressed():
	Change.change_scene("res://cerita/scene4/Scene4.tscn")	

func masuk(lokasi):
	lokasi.visible = true
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func keluar(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	lokasi.visible = false
