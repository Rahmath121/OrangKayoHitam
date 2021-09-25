extends KinematicBody2D

var can_grab = false
var grabbed_offset = Vector2()
onready var sprte = $Sprite
var value = 0

signal lepas
func _ready():
	pass # Replace with function body.



# warning-ignore:unused_argument
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_piece5_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()
		if can_grab == false:	
			emit_signal("lepas")
			$Sprite.scale = Vector2(0.3, 0.3)
		else:
			$Sprite.scale = Vector2(0.5, 0.5)
