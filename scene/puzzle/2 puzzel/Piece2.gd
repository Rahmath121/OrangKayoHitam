extends KinematicBody2D
var value = 2
var can_grab = false
var grabbed_offset = Vector2()
onready var sprte = $Sprite


signal lepas
func _ready():
	fase1()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Piece_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()
		if can_grab == false:	
			emit_signal("lepas")
# warning-ignore:unused_argument
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset
	
func fase1():
	sprte.texture = load("res://asset/puzzle/puzzle_game_1_fix.png")
	$CollisionShape2D.shape.extents = Vector2(60, 118)
	$CollisionShape2D.position = Vector2(48, 0)
func fase2():
	sprte.texture = load("res://asset/puzzle/puzzle 4/puzzle_game 2.png")
	$CollisionShape2D.shape.extents = Vector2(61, 64)
	$CollisionShape2D.position = Vector2(47, -53)

func fase3():
	sprte.texture = load("res://asset/puzzle/puzzle6/2.png")
	$CollisionShape2D.shape.extents = Vector2(50, 50)
	$CollisionShape2D.position = Vector2(-16, -72)
