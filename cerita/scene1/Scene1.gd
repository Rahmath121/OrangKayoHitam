extends Node2D

var dialog = 0

func _ready():
	Musiccontroller.Scene1()
	Mute()
		
func next():
	Change.change_scene("res://cerita/scene2/Scene2.tscn")
	

	


func _on_TextureButton_pressed():
	$click.play()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")


func _on_TextureButton4_pressed():
	$click.play()
	if Musiccontroller.mute == false:
		Musiccontroller.mute = true
		$Narasi.stop()
		$Control/VBoxContainer/HBoxContainer/TextureButton4.texture_normal = load("res://asset/button/mute.png")
	else:
		$Narasi.play()
		Musiccontroller.mute = false
		$Control/VBoxContainer/HBoxContainer/TextureButton4.texture_normal = load("res://asset/button/mutenot.png")
	


func _on_Narasi_finished():
	if Musiccontroller.mute == false:
		next()


func _on_TextureRect3_pressed():
	next()
	$click.play()

func Mute():
	
	if Musiccontroller.mute == false:
		$Narasi.play()
		$Control/VBoxContainer/HBoxContainer/TextureButton4.texture_normal = load("res://asset/button/mutenot.png")
	else:
		$Control/VBoxContainer/HBoxContainer/TextureButton4.texture_normal = load("res://asset/button/mute.png")
