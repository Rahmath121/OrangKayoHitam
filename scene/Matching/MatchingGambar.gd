extends Control

var deck = []
var gambar1
var pilih1
var pilih2
var panel_sekarang = null

var ukuran_panel = 2
var ukuran_gambar = 3
var reset_game = 0
var total_game = 3
var detik = 0
var menit = 0
var anim = 0
func _ready():
	randomize()
	$Panel/GridContainer.columns = ukuran_panel
	isi_deck()
	masukkan_gambar()
	grid_size()
	
	
func isi_deck():
	var s = 1
	var v = 1
	while s < 3:
		v = 1
		while v < ukuran_gambar:
			deck.append(gambarr.new(s, v))
			v += 1
		s += 1
		
		
func masukkan_gambar():
	deck.shuffle()
	var c = 0
	while c < deck.size():
		$Panel/GridContainer.add_child(deck[c])
		c += 1
	
func pilih_gambar(var c):
	if pilih1 == null:
		pilih1 = c
		pilih1.rect_pivot_offset = pilih1.rect_size/2
		pilih1.set_disabled(true)
		pilih1.animation_in()
	elif pilih2 == null:
		pilih2 = c
		pilih2.rect_pivot_offset = pilih2.rect_size/2
		pilih2.set_disabled(true)
		pilih2.animation_in()
		checkgambar()

func checkgambar():
	if pilih1.value == pilih2.value:
		
		yield(get_tree().create_timer(1), "timeout")
		pilih1.set_modulate(Color(0.6, 0.6, 0.6, 0.5))
		pilih2.set_modulate(Color(0.6, 0.6, 0.6, 0.5))
		pilih1 = null
		pilih2 = null
		reset_game += 1
		$benar.play()
		
		if reset_game == deck.size()/2:
			
			if ukuran_gambar != 7:
				
				yield(get_tree().create_timer(0.5), "timeout")
				ukuran_gambar += 1
				total_game += 1
				if ukuran_gambar > 6:
					ukuran_gambar = 6
				$Panel/GridContainer.columns += 1
				if $Panel/GridContainer.columns > 5 :
					$Panel/GridContainer.columns = 5
				grid_size()
				hapus()
				
			if total_game == 7:
				$Tween.interpolate_property($Label, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
				$Tween.start()
				$sfx.play()
				$Timer.stop()
				yield(get_tree().create_timer(0.5),"timeout")
				$Label.visible = false
				$Selesai/Panel/VBoxContainer/Label2.text = str(menit) + " Menit " + str(detik) + " Detik"
				$Tween.interpolate_property($Selesai, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	else:
		
		yield(get_tree().create_timer(1.2), "timeout")
		pilih1.animation_in()
		pilih2.animation_in()
		pilih1.set_disabled(false)
		pilih2.set_disabled(false)
		pilih1 = null
		pilih2 = null
		$salah.play()
func hapus():
	reset_game = 0
	for c in range(deck.size()):
		deck[c].queue_free()
	deck.clear()
	isi_deck()
	masukkan_gambar()
	$kartumuncul.play()




func grid_size():
	if total_game != 7:
		if ukuran_gambar == 3:
			$Panel/GridContainer.rect_size = Vector2(550, 550)
			$Panel/GridContainer.rect_position = Vector2(275,0)
		if ukuran_gambar == 4:
			anim = 0
			$Timer2.start()
			$Panel/GridContainer.rect_size = Vector2(750, 550)
			$Panel/GridContainer.rect_position = Vector2(175,0)
		if ukuran_gambar == 5:
			anim = 0
			$Timer2.start()
			$Panel/GridContainer.rect_size = Vector2(900, 550)
			$Panel/GridContainer.rect_position = Vector2(100,0)
		if ukuran_gambar == 6:
			anim = 0
			$Timer2.start()
			$Panel/GridContainer.rect_size = Vector2(1100, 550)
			$Panel/GridContainer.rect_position = Vector2(0,0)



func _on_Timer_timeout():
	detik += 1
	if detik > 59:
		menit += 1
		detik = 00
	$VBoxContainer/HBoxContainer/Panel/Label.text = str(menit) + " : " + str(detik)


func _on_start_finished():
	$Timer.start()
	$ColorRect.visible = false
	$Label2.text = "Mulai"
	
	yield(get_tree().create_timer(0.5),"timeout")
	$Timer2.start()
	$Label2.visible = false
	$Panel/GridContainer.visible = true
	$kartumuncul.play()


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
	

func _on_Timer2_timeout():
	var s
	var v
	if anim < deck.size():
		deck[anim].rect_pivot_offset = deck[anim].rect_size/2
		deck[anim].animation_in() 
		anim += 1	
		
	if anim == deck.size():
		$Timer2.stop()
		yield(get_tree().create_timer(1.5),"timeout")
		for i in deck.size():
			deck[i].disabled = false
			deck[i].animation_in()
			


func _on_TextureButton3_pressed():
	if get_tree().paused == false:
		get_tree().paused = true
		$paused.visible = true
	else:
		get_tree().paused = false
		$paused.visible = false
