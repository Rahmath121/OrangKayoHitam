extends Node2D

func _ready():
	Musiccontroller.Scene9()
	


func _on_narasi_finished():
	yield(get_tree().create_timer(1),"timeout")
	Change.change_scene("res://cerita/scene10/Scene10.tscn")
