extends Control

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		# For Windows
		self.visible = true
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST: 
		# For android
		self.visible = true



func _on_Button_pressed():
	get_tree().quit()

func _on_Button2_pressed():
	visible = false
