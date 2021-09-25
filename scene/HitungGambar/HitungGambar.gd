extends Control

var kapal = preload("res://asset/hitung_gambar/gambar-1-1.png")
var karung = preload("res://asset/hitung_gambar/gambar-1-2.png")
var padi = preload("res://asset/hitung_gambar/gambar-1-3.png")
var pedati = preload("res://asset/hitung_gambar/gambar-1-4.png")
var kelapa = preload("res://asset/hitung_gambar/gambar-1-5.png")
var keris = preload("res://asset/matching_gambar/keris.png")

var gambar = [kapal, karung, padi, pedati, kelapa]
var jawaban = []


var audio_karung = load("res://asset/audio/hitunggambar/drive-download-20210814T135005Z-001/Karung.wav")
var audio_padi = load("res://asset/audio/hitunggambar/drive-download-20210814T135005Z-001/Padi.wav")
var audio_pedati = load("res://asset/audio/hitunggambar/drive-download-20210814T135005Z-001/Pedati.wav")
var audio_perahu = load("res://asset/audio/hitunggambar/drive-download-20210814T135005Z-001/Perahu.wav")
var audio_kelapa = load("res://asset/audio/hitunggambar/drive-download-20210814T135005Z-001/Pohon Kelapa.wav")

onready var button1 = $GridContainer/Panel/TextureButton
onready var button2 = $GridContainer/Panel2/TextureButton
onready var button3 = $GridContainer/Panel3/TextureButton
onready var button4 = $GridContainer/Panel4/TextureButton
onready var button5 = $GridContainer/Panel5/TextureButton
onready var button6 = $GridContainer/Panel6/TextureButton
onready var button7 = $GridContainer/Panel7/TextureButton
onready var button8 = $GridContainer/Panel8/TextureButton
onready var button9 = $GridContainer/Panel9/TextureButton

var button = []
var button_text
var hitung_gambar 
var pilih_gambar
var isi_gambar
var pilih_angka
var button_jawaban
var isi_jawaban 
var menit = 0
var detik = 0


var jumlah_game = 0
var benar = 0
var salah = 0



func _ready():
	disabled()
	randomize()
	hitung_gambar = randi() % 8 + 1
	pilih_gambar = randi() % 5
	Button_jawaban()
	total_gambar()
	texture()
	jumlah_gambar()
	
	
	$chage/AnimationPlayer.play("open")
	yield($chage/AnimationPlayer,"animation_finished")
	
	appear($GridContainer)
	appear($GridContainer2)
	
func Pilih_gambar():
	var start = false
	if pilih_gambar == 0:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah Perahu?")
		$sfx.stream = audio_perahu
	if pilih_gambar == 1:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah Karung?")		
		$sfx.stream = audio_karung
	if pilih_gambar == 2:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah Padi?")		
		$sfx.stream = audio_padi
	if pilih_gambar == 3:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah Pedati?")
		$sfx.stream = audio_pedati
	if pilih_gambar == 4:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah Pohon Kelapa?")		
		$sfx.stream = audio_kelapa
	
	if jumlah_game<10:
		if start == false:
			yield(get_tree().create_timer(1),"timeout")
			$sfx.play()
			start = true
		else:
			$sfx.play()	
func Button_jawaban():
	jawaban.append($GridContainer2/Panel/Button)
	jawaban.append($GridContainer2/Panel2/Button)
	jawaban.append($GridContainer2/Panel3/Button)
	

func total_gambar():
	button.append(button1)
	button.append(button2)
	button.append(button3)
	button.append(button4)
	button.append(button5)
	button.append(button6)
	button.append(button7)
	button.append(button8)
	button.append(button9)
	
	
		
func texture():
	button.shuffle()
	var c = 0
	while c < hitung_gambar:
		button_text = button[c]
		c += 1
		button_text.texture_normal = gambar[pilih_gambar]
		
	while c < button.size():
		isi_gambar = randi() % 5
		button_text = button[c]
			
		if button_text.texture_normal == null and isi_gambar != pilih_gambar:
			button_text.texture_normal = gambar[isi_gambar]
			c += 1


func jumlah_gambar():
	
	jawaban.shuffle()
	
	var c = 0
	var v = 0
	while v < jawaban.size():
		isi_jawaban = randi() % 8 + 1
		button_jawaban = jawaban[v]
		
		if isi_jawaban != hitung_gambar:
			button_jawaban.text = str(isi_jawaban)
			button_jawaban.nilai = isi_jawaban
			v += 1
	while c < 1:
		button_jawaban = jawaban[c]
		c += 1
		button_jawaban.text = str(hitung_gambar)
		button_jawaban.nilai = hitung_gambar		
		


		
func hapus_gambar():
	hitung_gambar = randi() % 8 + 1
	pilih_gambar = randi() % 5
	var c = 0
	while c < button.size():
		button_text = button[c]
		c += 1
		button_text.texture_normal = null
	Pilih_gambar()
	texture()
	jumlah_gambar()
	
	












func _on_Button_pressed():
	if $GridContainer2/Panel/Button.nilai == hitung_gambar:
		
	
	
		if jumlah_game < 10:
			$benar.play()
			Benar()
			jumlah_game += 1
			disabled()
			hapus_gambar()
			benar += 1
			
			$AnimationPlayer.play("appear")
	else:
		
		
		if jumlah_game < 10:
			$salah.play()
			Salah()
			jumlah_game += 1
			
			disabled()
			hapus_gambar()
			$AnimationPlayer.play("appear")
			
			salah += 1
			
	
func _on_Button1_pressed():
	if $GridContainer2/Panel2/Button.nilai == hitung_gambar:

		
		
		if jumlah_game < 10:
			$benar.play()
			Benar()
			jumlah_game += 1
			
			disabled()
			hapus_gambar()
			benar += 1
			$AnimationPlayer.play("appear")
	else:
		
		
		if jumlah_game < 10:
			$salah.play()
			Salah()
			jumlah_game += 1
			disabled()
			hapus_gambar()
			$AnimationPlayer.play("appear")
			
			salah += 1
			
		

	
func _on_Button2_pressed():
	
	if $GridContainer2/Panel3/Button.nilai == hitung_gambar:
		
	
	
		if jumlah_game < 10:
			$benar.play()
			Benar()
			jumlah_game += 1
			disabled()
			hapus_gambar()
			
			benar += 1
			
			$AnimationPlayer.play("appear")
	else:
		
		
		if jumlah_game < 10:
			$salah.play()
			Salah()
			jumlah_game += 1
			
			disabled()
			hapus_gambar()
			$AnimationPlayer.play("appear")
			
			salah += 1
			
			
	
func _on_Timer_timeout():
	detik += 1
	if detik > 59:
		menit += 1
		detik = 00
	$VBoxContainer/HBoxContainer/Panel/Label.text = str(menit) + " : " + str(detik)
	

func enable():
	$GridContainer2/Panel/Button.disabled = false
	$GridContainer2/Panel2/Button.disabled = false
	$GridContainer2/Panel3/Button.disabled = false

func disabled():
	$GridContainer2/Panel/Button.disabled = true
	$GridContainer2/Panel2/Button.disabled = true
	$GridContainer2/Panel3/Button.disabled = true


func _on_TextureButton_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")

func appear(lokasi):
	
	$Tween.interpolate_property(lokasi, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween.start()




func _on_start_finished():
	enable()
	$Timer.start()
	Pilih_gambar()


func Benar():
	$Tween2.interpolate_property($benar2, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween2.start()
	yield($Tween2,"tween_completed")
	$benar2.rect_scale = Vector2(0,0)
	if jumlah_game == 10:
		complete()
func Salah():
	$Tween2.interpolate_property($benar3, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween2.start()
	yield($Tween2,"tween_completed")
	$benar3.rect_scale = Vector2(0,0)
	if jumlah_game == 10:
		complete()
func selesai():
	$Tween2.interpolate_property($Selesai, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween2.start()
	$Selesai/Panel/VBoxContainer/Label.text = "Benar : " + str(benar)
	$Selesai/Panel/VBoxContainer/Label2.text = "Salah : " + str(salah)
func complete():
	
		$AnimationPlayer.play("GameSelesai")
		disabled()
		$Timer.stop()
		$sfx.stream = load("res://asset/audio/UI/Tepuk tangan.wav")
		$sfx.play()




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
