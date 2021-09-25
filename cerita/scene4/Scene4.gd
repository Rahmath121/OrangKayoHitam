extends Node2D


func _ready():
	Musiccontroller.Scene4()
	Mute()	

func _on_narasi_finished():
	yield(get_tree().create_timer(1),"timeout")
	



func _on_back_pressed():
	$click.play()
	get_tree().change_scene("res://MainMenu.tscn")


func _on_mute_pressed():
	$click.play()
	if Musiccontroller.mute == false:
		Musiccontroller.mute = true
		$narasi.stop()
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
	Change.change_scene("res://cerita/scene5/Scene5.tscn")
	$click.play()


func _on_prev_pressed():
	Change.change_scene("res://cerita/scene3/Scene3.tscn")
