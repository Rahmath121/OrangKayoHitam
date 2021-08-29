extends Control
var judul = true

func _ready():
	Change.play("home")
	Musiccontroller.HomeBGM()
	

func _on_TextureButton_pressed():

	get_tree().change_scene("res://scene/UI/GameSelector.tscn")


	


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if judul == false:
			$judul.play()
			judul = true

func _on_judul_finished():
	judul = false


func _on_Timer_timeout():
	$judul.play()


func _on_Button_pressed():
	Change.change_scene("res://cerita/scene1/Scene1.tscn")
