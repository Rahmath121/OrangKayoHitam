extends Control

onready var gambar1 = $Panel2/TextureRect
onready var gambar2 = $Panel2/TextureRect2
onready var gambar3 = $Panel2/TextureRect3
onready var gambar4 = $Panel2/TextureRect4
onready var gambar5 = $Panel2/TextureRect5
onready var gambar6 = $Panel2/TextureRect6




var piece1 = false
var piece2 = false
var piece3 = false
var piece4 = false
var piece5 = false
var piece6 = false


var gameset = 2
var piece_correct = 0

var menit = 0
var detik = 0
func _ready():
	randomize()
	
	
func game1():
	$change.play()
	
	gameset = 2
	var gambargame1
	var gambargame2
	gambargame1 = randi() % 6 + 1
	gambargame2 = randi() % 6 + 1
	while gambargame2 == gambargame1:
		gambargame2 = randi() % 6 + 1
		
	if gambargame1 == 1 or gambargame2 == 1:
		$Panel2/TextureRect.visible = false
		$Pieces/piece1.value = 1
	if gambargame1 == 2 or gambargame2 == 2:
		$Panel2/TextureRect2.visible = false
		$Pieces/piece2.value = 2
	if gambargame1 == 3 or gambargame2 == 3:
		$Panel2/TextureRect3.visible = false
		$Pieces/piece3.value = 3
	if gambargame1 == 4 or gambargame2 == 4:
		$Panel2/TextureRect4.visible = false
		$Pieces/piece4.value = 4
	if gambargame1 == 5 or gambargame2 == 5:
		$Panel2/TextureRect5.visible = false
		$Pieces/piece5.value = 5
	if gambargame1 == 6 or gambargame2 == 6:
		$Panel2/TextureRect6.visible = false
		$Pieces/piece6.value = 6
	

func game2():
	$change.play()
	gameset = 4
	piece_correct = 0
	var kotak1		
	var kotak2	
	var kotak3
	var kotak4
	
	$Pieces/piece1.visible = true
	$Pieces/piece2.visible = true
	$Pieces/piece3.visible = true
	$Pieces/piece4.visible = true
	$Pieces/piece5.visible = true
	$Pieces/piece6.visible = true
	
	$Pieces/piece1.value = 0
	$Pieces/piece2.value = 0
	$Pieces/piece3.value = 0
	$Pieces/piece4.value = 0
	$Pieces/piece5.value = 0
	$Pieces/piece6.value = 0
	kotak1 = randi() % 6+1	
	kotak2 = randi() % 6+1	
	while kotak2 == kotak1:
		kotak2 = randi() % 6+1	
	kotak3 = randi() % 6+1	
	while kotak3 == kotak1 or kotak3 == kotak2:
		kotak3 = randi() % 6+1	
	kotak4 = randi() % 6+1
	while kotak4 == kotak1 or kotak4 == kotak2 or kotak4 == kotak3:
		kotak4 = randi() % 6+1	
	
	
	if kotak1 == 1 or kotak2 == 1 or kotak3 == 1 or kotak4 == 1:
		$Panel2/TextureRect.visible = false
		$Pieces/piece1.value = 1
	if kotak1 == 2 or kotak2 == 2 or kotak3 == 2 or kotak4 == 2:
		$Panel2/TextureRect2.visible = false
		$Pieces/piece2.value = 2
	if kotak1 == 3 or kotak2 == 3 or kotak3 == 3 or kotak4 == 3:
		$Panel2/TextureRect3.visible = false
		$Pieces/piece3.value = 3
	if kotak1 == 4 or kotak2 == 4 or kotak3 == 4 or kotak4 == 4:
		$Panel2/TextureRect4.visible = false
		$Pieces/piece4.value = 4
	if kotak1 == 5 or kotak2 == 5 or kotak3 == 5 or kotak4 == 5:
		$Panel2/TextureRect5.visible = false
		$Pieces/piece5.value = 5
	if kotak1 == 6 or kotak2 == 6 or kotak3 == 6 or kotak4 == 6:
		$Panel2/TextureRect6.visible = false
		$Pieces/piece6.value = 6
		
		
func game3():
	$change.play()
	gameset = 6
	piece_correct = 0
	$Pieces/piece1.visible = true
	$Pieces/piece2.visible = true
	$Pieces/piece3.visible = true
	$Pieces/piece4.visible = true
	$Pieces/piece5.visible = true
	$Pieces/piece6.visible = true
	
	$Panel2/TextureRect.visible = false
	$Panel2/TextureRect2.visible = false
	$Panel2/TextureRect3.visible = false
	$Panel2/TextureRect4.visible = false
	$Panel2/TextureRect5.visible = false
	$Panel2/TextureRect6.visible = false
	
	$Pieces/piece1.value = 1
	$Pieces/piece2.value = 2
	$Pieces/piece3.value = 3
	$Pieces/piece4.value = 4
	$Pieces/piece5.value = 5
	$Pieces/piece6.value = 6
func _on_area1_body_entered(body):
	if body.value == $area/area1.value:
		piece1 = true
func _on_area2_body_entered(body):
	if body.value == $area/area2.value:
		piece2 = true
func _on_area3_body_entered(body):
	if body.value == $area/area3.value:
		piece3 = true
func _on_area4_body_entered(body):
	if body.value == $area/area4.value:
		piece4 = true
func _on_area5_body_entered(body):
	if body.value == $area/area5.value:
		piece5 = true
func _on_area6_body_entered(body):
	if body.value == $area/area6.value:
		piece6 = true


# warning-ignore:unused_argument
func _on_area1_body_exited(body):
	piece1 = false
# warning-ignore:unused_argument
func _on_area2_body_exited(body):
	piece2 = false
# warning-ignore:unused_argument
func _on_area3_body_exited(body):
	piece3 = false
# warning-ignore:unused_argument
func _on_area5_body_exited(body):
	piece5 = false
# warning-ignore:unused_argument
func _on_area6_body_exited(body):
	piece6 = false
# warning-ignore:unused_argument
func _on_area4_body_exited(body):
	piece4 = false
	
	
func _on_piece1_lepas():
	if piece1 == true:
		$dop.play()
		$Panel2/TextureRect.visible = true
		piece_correct += 1
		$Pieces/piece1.visible = false
		if piece_correct == gameset:
			$benar.play()
			yield(get_tree().create_timer(1.3),"timeout")
			if gameset == 2:
				game2()
			elif gameset == 4:
				game3()
			elif gameset == 6:
				$sfx.play()
				$Selesai/Panel/VBoxContainer/Label2.text = str(menit) + " Menit " + str(detik) + " Detik"	
				$Tween.interpolate_property($Selesai, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
				$Tween.start()	
		$Tween.interpolate_property($Pieces/piece1, "position", $Pieces/piece1.position, $position/pos1.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	else:
		$salah.play()
		$Tween.interpolate_property($Pieces/piece1, "position", $Pieces/piece1.position, $position/pos1.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
func _on_piece2_lepas():
	if piece2 == true:
		$dop.play()
		$Panel2/TextureRect2.visible = true
		piece_correct += 1
		$Pieces/piece2.visible = false
		if piece_correct == gameset:
			$benar.play()
			yield(get_tree().create_timer(1.3),"timeout")
			if gameset == 2:
				game2()
			elif gameset == 4:
				game3()
			elif gameset == 6:
				$sfx.play()
				$Selesai/Panel/VBoxContainer/Label2.text = str(menit) + " Menit " + str(detik) + " Detik"	
				$Tween.interpolate_property($Selesai, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
				$Tween.start()	
		$Tween.interpolate_property($Pieces/piece2, "position", $Pieces/piece2.position, $position/pos2.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	else:
		$salah.play()
		$Tween.interpolate_property($Pieces/piece2, "position", $Pieces/piece2.position, $position/pos2.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
func _on_piece4_lepas():
	if piece4 == true:
		$dop.play()
		$Panel2/TextureRect4.visible = true
		piece_correct += 1
		$Pieces/piece4.visible = false
		if piece_correct == gameset:
			$benar.play()
			yield(get_tree().create_timer(1.3),"timeout")
			if gameset == 2:
				game2()
			elif gameset == 4:
				game3()
			elif gameset == 6:
				$sfx.play()
				$Selesai/Panel/VBoxContainer/Label2.text = str(menit) + " Menit " + str(detik) + " Detik"	
				$Tween.interpolate_property($Selesai, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
				$Tween.start()	
		$Tween.interpolate_property($Pieces/piece4, "position", $Pieces/piece4.position, $position/pos4.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
		
	else:
		$salah.play()
		$Tween.interpolate_property($Pieces/piece4, "position", $Pieces/piece4.position, $position/pos4.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
func _on_piece5_lepas():
	if piece5 == true:
		$dop.play()
		$Panel2/TextureRect5.visible = true
		piece_correct += 1
		$Pieces/piece5.visible = false
		if piece_correct == gameset:
			$benar.play()
			yield(get_tree().create_timer(1.3),"timeout")
			if gameset == 2:
				
				game2()
			elif gameset == 4:
				game3()
			elif gameset == 6:
				$sfx.play()
				$Selesai/Panel/VBoxContainer/Label2.text = str(menit) + " Menit " + str(detik) + " Detik"	
				$Tween.interpolate_property($Selesai, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
				$Tween.start()	
		$Tween.interpolate_property($Pieces/piece5, "position", $Pieces/piece5.position, $position/pos5.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	else:
		$salah.play()
		$Tween.interpolate_property($Pieces/piece5, "position", $Pieces/piece5.position, $position/pos5.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
func _on_piece6_lepas():
	if piece6 == true:
		$dop.play()
		$Panel2/TextureRect6.visible = true
		piece_correct += 1
		$Pieces/piece6.visible = false
		if piece_correct == gameset:
			$benar.play()
			yield(get_tree().create_timer(1.3),"timeout")
			if gameset == 2:
				game2()
			elif gameset == 4:
				game3()
			elif gameset == 6:
				$sfx.play()
				$Selesai/Panel/VBoxContainer/Label2.text = str(menit) + " Menit " + str(detik) + " Detik"	
				$Tween.interpolate_property($Selesai, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
				$Tween.start()	
		$Tween.interpolate_property($Pieces/piece6, "position", $Pieces/piece6.position, $position/pos6.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	else:
		$salah.play()
		$Tween.interpolate_property($Pieces/piece6, "position", $Pieces/piece6.position, $position/pos6.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
func _on_piece3_lepas():
	if piece3 == true:
		$dop.play()
		$Panel2/TextureRect3.visible = true
		piece_correct += 1
		$Pieces/piece3.visible = false
		if piece_correct == gameset:
			$benar.play()
			yield(get_tree().create_timer(1.3),"timeout")
			if gameset == 2:
				
				
				game2()
			elif gameset == 4:
			
				game3()
			elif gameset == 6:
				$sfx.play()
				$Selesai/Panel/VBoxContainer/Label2.text = str(menit) + " Menit " + str(detik) + " Detik"	
				$Tween.interpolate_property($Selesai, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
				$Tween.start()	
				
		$Tween.interpolate_property($Pieces/piece3, "position", $Pieces/piece3.position, $position/pos3.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
	else:
		$salah.play()
		$Tween.interpolate_property($Pieces/piece3, "position", $Pieces/piece3.position, $position/pos3.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()


func _on_start_finished():
	game1()
	$Timer.start()

func _on_Timer_timeout():
	detik += 1
	if detik > 59:
		menit += 1
		detik = 00
	$VBoxContainer/HBoxContainer/Panel/Label.text = str(menit) + " : " + str(detik)


func _on_TextureButton_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")


func _on_restart_pressed():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()


func _on_TextureButton2_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")



func _on_TextureButton3_pressed():
	if get_tree().paused == false:
		get_tree().paused = true
		$paused.visible = true
	else:
		get_tree().paused = false
		$paused.visible = false
