extends AnimationPlayer

func _ready():
	pass

func mulai():
	Musiccontroller.play_in()

func keluar():
	Musiccontroller.play_end()
func Home():
	Musiccontroller.play_home()

func change_scene(path):
	self.play("change")
	yield(self, "animation_finished")
	get_tree().change_scene(path)
	Musiccontroller.play_end()
	self.play_backwards("change")
	Musiccontroller.play_in()
	
	
	
