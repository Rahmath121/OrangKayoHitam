extends Node2D

func _ready():
	Mute()
	
		
func _on_TextureButton_pressed():
	get_tree().change_scene("res://MainMenu.tscn")

	
func _on_back_pressed():
	$click.play()
	get_tree().change_scene("res://MainMenu.tscn")

func Mute():
	if Musiccontroller.mute == false:
		$narasi.play()
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mutenot.png")
	else:
		$Control/Panel2/mute.texture_normal = load("res://asset/button/mute.png")


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

	


func _on_narasi_finished():
	if Musiccontroller.mute == true:
		pass
	else:
		yield(get_tree().create_timer(2),"timeout")
		get_tree().change_scene("res://MainMenu.tscn")

