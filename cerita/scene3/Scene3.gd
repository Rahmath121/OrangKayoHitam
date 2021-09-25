extends Node2D

var dialog1 = load("res://asset/cerita/scene3/01Berhalo_Scene3.wav")
var dialog2 = load("res://asset/cerita/scene3/02Pingai_Scene3.wav")

var dialog_selesai = false
var total_dialog = 2
var Dialog = 1
var mute = false
func _ready():
	Musiccontroller.Scene3()
	Mute()

func animation():
	$Control/Label2.visible = true
	$Tween.interpolate_property($Control/Label2, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func next():
		Change.change_scene("res://cerita/scene4/Scene4.tscn")



func _on_back_pressed():
	$click.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")



func _on_narasi_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		$dialog.play()
		animation()


func _on_next_pressed():
	$click.play()
	if  Musiccontroller.mute == true:
		if dialog_selesai == false:
			if Dialog == 1:
				Dialog += 1
				masuk($Control/Label2)
			elif Dialog == 2:
				masuk($Control/Label3)
				dialog_selesai = true
		else:
			next()
	else:
		next()	
func _on_mute_pressed():
	$click.play()
	Dialog = 1
	dialog_selesai = false
	keluar($Control/Label3)
	keluar($Control/Label2)
	if  Musiccontroller.mute == false:
		Musiccontroller.mute = true
		$narasi.stop()
		$dialog.stop()
		$dialog2.stop()
		
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


func _on_prev_pressed():
	Change.change_scene("res://cerita/scene2/Scene2.tscn")

func masuk(lokasi):
	lokasi.visible = true
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func keluar(lokasi):
	$Tween.interpolate_property(lokasi, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	lokasi.visible = false

func _on_dialog_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		keluar($Control/Label2)
		yield(get_tree().create_timer(1),"timeout")
		masuk($Control/Label3)
		$dialog2.play()

func _on_dialog2_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		keluar($Control/Label3)
		yield(get_tree().create_timer(1),"timeout")
		next()
	
