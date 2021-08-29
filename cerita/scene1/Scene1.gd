extends Node2D

var dialog = 0
func _ready():
	Musiccontroller.Scene1()
	
	$AnimationPlayer.play("dialog")
	dialog1()
func dialog1():
	dialog += 1
	if dialog == 1:
		$Control/Label.text = "Kisah Orang Kayo Hitam,\nPada Abad ke-14,\nada sebuah Kerajaan yang Benama\nKerajaan Melayu Jambi."
	if dialog == 2:
		$Control/Label.text = "Kerajaan ini dipimpin oleh \nputri keturunan dari pagaruyung \nyang benama Putri Selaras Pinang Masak,"
	if dialog == 3:
		$Control/Label.text = "Putri Selaras Pinang Masak \nMenikah dengan Saudagar Dari Turki\nyang bergelar Datuk Paduko Berhalo"

func next():
	Change.change_scene("res://cerita/scene2/Scene2.tscn")

func animation():
	$Tween.interpolate_property($Control/Label, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
	yield($Tween,"tween_completed")
	
	$Tween.interpolate_property($Control/Label, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
	
	
