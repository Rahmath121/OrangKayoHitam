extends Node2D

var dialog1 = load("res://asset/cerita/scene3/01Berhalo_Scene3.wav")
var dialog2 = load("res://asset/cerita/scene3/02Pingai_Scene3.wav")

func _ready():
	Musiccontroller.Scene3()

func dialog():
	$narasi.stream = dialog1
	$narasi.play()
	
	yield($narasi,"finished")
	$Tween.interpolate_property($Control/Label2, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	yield(get_tree().create_timer(1),"timeout")
	
	$Tween.interpolate_property($Control/Label3, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
	$narasi.stream = dialog2
	$narasi.play()
	
	yield($narasi,"finished")
	$Tween.interpolate_property($Control/Label3, "modulate", Color(1, 1, 1, 1), Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	yield(get_tree().create_timer(1),"timeout")
	next()
func animation():

	$Tween.interpolate_property($Control/Label2, "modulate", Color(1, 1, 1, 0), Color(1,1,1,1), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()
	
func next():
		Change.change_scene("res://cerita/scene4/Scene4.tscn")
