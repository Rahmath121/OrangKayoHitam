extends Node2D

func _ready():
	Musiccontroller.Scene12()


func _on_narasi_finished():
	yield(get_tree().create_timer(1),"timeout")
	Change.change_scene("res://cerita/SceneAkhir.tscn")
