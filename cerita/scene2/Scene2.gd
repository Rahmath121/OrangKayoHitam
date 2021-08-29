extends Node2D

func _ready():
	Musiccontroller.Scene2()

func next():
	Change.change_scene("res://cerita/scene3/Scene3.tscn")
