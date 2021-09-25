extends Node2D

var dialog_selesai = false
var Dialog = 1
func _ready():
	Musiccontroller.Scene6()
	yield(get_tree().create_timer(1),"timeout")
	Mute()
func masuk(lokasi):
	lokasi.visible = true
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func keluar(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	lokasi.visible = false

func _on_narasi1_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		masuk($Control/dialog1)
		yield(get_tree().create_timer(0.7),"timeout")
		$dialog1.play()
	

func _on_dialog1_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		keluar($Control/dialog1)
		yield(get_tree().create_timer(0.7),"timeout")
		$Control/Panel/narasi.visible = false
		masuk($Control/Panel/narasi2)
		$narasi2.play()


func _on_narasi2_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		masuk($Control/dialog2)
		yield(get_tree().create_timer(0.7),"timeout")
		$dialog2.play()


func _on_dialog2_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		keluar($Control/dialog2)
		yield(get_tree().create_timer(0.7),"timeout")
		masuk($Control/dialog3)
		$dialog3.play()


func _on_dialog3_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		Change.change_scene("res://cerita/scene7/Scene7.tscn")




func Mute():
	if Musiccontroller.mute == false:
		$narasi1.play()
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mutenot.png")
	else:
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mute.png")


func _on_back_pressed():
	$click.play()
	get_tree().change_scene("res://MainMenu.tscn")


func _on_mute_pressed():
	$click.play()
	Dialog = 1
	dialog_selesai = false
	keluar($Control/dialog1)
	keluar($Control/dialog2)
	keluar($Control/dialog3)
	$Control/Panel/narasi.visible = true
	$Control/Panel/narasi2.visible = false
	if Musiccontroller.mute == false:
		Musiccontroller.mute = true
		$narasi1.stop()
		$narasi2.stop()
		$dialog1.stop()
		$dialog2.stop()
		$dialog3.stop()
		keluar($Control/dialog1)
		keluar($Control/dialog2)
		keluar($Control/dialog3)
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mute.png")
	else:
		$narasi1.play()
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
				$Control/Panel/narasi.visible = false
				masuk($Control/Panel/narasi2)
			elif Dialog == 3:
				Dialog += 1
				masuk($Control/dialog2)
			elif Dialog == 4:
				Dialog += 1
				keluar($Control/dialog2)
				masuk($Control/dialog3)
				dialog_selesai = true
		else:
			Change.change_scene("res://cerita/scene7/Scene7.tscn")
	else:	
		Change.change_scene("res://cerita/scene7/Scene7.tscn")


func _on_prev_pressed():
	Change.change_scene("res://cerita/scene5/Scene5.tscn")
