extends Control

func _ready():
	Change.play("home")
	


func _on_Button_pressed():
	get_tree().change_scene("res://scene/HitungGambar/HitungGambar.tscn")

func _on_Button2_pressed():
	get_tree().change_scene("res://scene/Matching/MatchingGambar.tscn")

func _on_Button3_pressed():
	get_tree().change_scene("res://scene/puzzle/puzzel.tscn")
