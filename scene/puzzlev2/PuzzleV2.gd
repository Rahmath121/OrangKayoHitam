extends Control

onready var gambar1 = $Panel2/TextureRect
onready var gambar2 = $Panel2/TextureRect2
onready var gambar3 = $Panel2/TextureRect3
onready var gambar4 = $Panel2/TextureRect4
onready var gambar5 = $Panel2/TextureRect5
onready var gambar6 = $Panel2/TextureRect6


var gambargame1
var gambargame2

var piece1 = false
var piece2 = false
var piece3 = false
var piece4 = false
var piece5 = false
var piece6 = false


var gameset = 0 
var game_complete = 0
func _ready():
	randomize()
	game1()
	print(gambargame1, gambargame2)
func game1():
	gambargame1 = randi() % 6 + 1
	gambargame2 = randi() % 6 + 1
	if gambargame2 == gambargame1:
		gambargame2 = randi() % 6 + 1
		
	if gambargame1 == 1 or gambargame2 == 1:
		$Panel2/TextureRect.visible = false
	if gambargame1 == 2 or gambargame2 == 2:
		$Panel2/TextureRect2.visible = false
	if gambargame1 == 3 or gambargame2 == 3:
		$Panel2/TextureRect3.visible = false
	if gambargame1 == 4 or gambargame2 == 4:
		$Panel2/TextureRect4.visible = false
	if gambargame1 == 5 or gambargame2 == 5:
		$Panel2/TextureRect5.visible = false
	if gambargame1 == 6 or gambargame2 == 6:
		$Panel2/TextureRect6.visible = false
		
		
		
		
		
		


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


func _on_area1_body_exited(body):
	piece1 = false
func _on_area2_body_exited(body):
	piece2 = false
func _on_area3_body_exited(body):
	piece3 = false
func _on_area5_body_exited(body):
	piece5 = false
func _on_area6_body_exited(body):
	piece6 = false
func _on_area4_body_exited(body):
	piece4 = false
	
	
func _on_piece1_lepas():
	if piece1 == true:
		$Panel2/TextureRect.visible = true
	else:
		$Tween.interpolate_property($Pieces/piece1, "position", $Pieces/piece1.position, $position/pos1.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
func _on_piece2_lepas():
	if piece2 == true:
		$Panel2/TextureRect2.visible = true
	else:
		$Tween.interpolate_property($Pieces/piece2, "position", $Pieces/piece2.position, $position/pos2.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
func _on_piece4_lepas():
	if piece4 == true:
		$Panel2/TextureRect4.visible = true
	else:
		$Tween.interpolate_property($Pieces/piece4, "position", $Pieces/piece4.position, $position/pos4.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
func _on_piece5_lepas():
	if piece5 == true:
		$Panel2/TextureRect5.visible = true
	else:
		$Tween.interpolate_property($Pieces/piece5, "position", $Pieces/piece5.position, $position/pos5.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
func _on_piece6_lepas():
	if piece6 == true:
		$Panel2/TextureRect6.visible = true
	else:
		$Tween.interpolate_property($Pieces/piece6, "position", $Pieces/piece6.position, $position/pos6.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
func _on_piece3_lepas():
	if piece3 == true:
		$Panel2/TextureRect3.visible = true
	else:
		$Tween.interpolate_property($Pieces/piece3, "position", $Pieces/piece3.position, $position/pos3.position, 0.2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		$Tween.start()
