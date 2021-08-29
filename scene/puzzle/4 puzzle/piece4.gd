extends KinematicBody2D
var value = 4
var can_grab = false
var grabbed_offset = Vector2()
onready var sprte = $Sprite


signal lepas
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_piece4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()
		if can_grab == false:	
			emit_signal("lepas")

# warning-ignore:unused_argument
# warning-ignore:unused_argument

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset
	

func fase1():
	sprte.texture = load("res://asset/puzzle/puzzle 4/puzzle_game4.png")
	$CollisionShape2D.shape.extents = Vector2(62, 65)
	$CollisionShape2D.position = Vector2(58, 61)


func fase2():
	sprte.texture = load("res://asset/puzzle/puzzle6/4.png")
	$CollisionShape2D.shape.extents = Vector2(50, 54)
	$CollisionShape2D.position = Vector2(-78, 38)
