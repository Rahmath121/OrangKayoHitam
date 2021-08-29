extends Control

var kapal = preload("res://asset/hitung_gambar/gambar-1-1.png")
var karung = preload("res://asset/hitung_gambar/gambar-1-2.png")
var padi = preload("res://asset/hitung_gambar/gambar-1-3.png")
var pedati = preload("res://asset/hitung_gambar/gambar-1-4.png")
var kelapa = preload("res://asset/hitung_gambar/gambar-1-5.png")
var keris = preload("res://asset/matching_gambar/keris.png")

var gambar = [kapal, karung, padi, pedati, kelapa, keris]
var jawaban = []
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
	randomize()
	hitung_gambar = randi() % 8 + 1
	pilih_gambar = randi() % 6
	Button_jawaban()
	total_gambar()
	texture()
	jumlah_gambar()
	Pilih_gambar()
	$chage/AnimationPlayer.play("open")
	yield($chage/AnimationPlayer,"animation_finished")
	$Timer.start()
	appear()
	
	
func Pilih_gambar():
	if pilih_gambar == 0:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah Kapal?")	
	if pilih_gambar == 1:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah Karung?")		
	if pilih_gambar == 2:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah Padi?")		
	if pilih_gambar == 3:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah Pedati?")
	if pilih_gambar == 4:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah Pohon Kelapa?")		
	if pilih_gambar == 5:	
		$VBoxContainer/HBoxContainer2/Panel/Label.text = str("Berapakah Jumlah keris?")	
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
	pilih_gambar = randi() % 6
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
		disabled()
		hapus_gambar()
		jumlah_game += 1
		benar += 1
		$AnimationPlayer.play("appear")
	else:
		$AnimationPlayer.play("appear")
		disabled()
		hapus_gambar()
		jumlah_game += 1
		salah += 1
	
	if jumlah_game == 10:
		$AnimationPlayer.play("GameSelesai")
		disabled()
		$Timer.stop()
func _on_Button1_pressed():
	if $GridContainer2/Panel2/Button.nilai == hitung_gambar:
		disabled()
		hapus_gambar()
		jumlah_game += 1
		benar += 1
		$AnimationPlayer.play("appear")
	else:
		disabled()
		hapus_gambar()
		$AnimationPlayer.play("appear")
		salah += 1
		jumlah_game += 1
	
	if jumlah_game == 10:
		$AnimationPlayer.play("GameSelesai")
		disabled()
		$Timer.stop()
	
func _on_Button2_pressed():
	
	if $GridContainer2/Panel3/Button.nilai == hitung_gambar:
		disabled()
		hapus_gambar()
		jumlah_game += 1
		benar += 1
		$AnimationPlayer.play("appear")
	else:
		disabled()
		hapus_gambar()
		$AnimationPlayer.play("appear")
		salah += 1
		jumlah_game += 1
		
	if jumlah_game == 10:
		$AnimationPlayer.play("GameSelesai")
		disabled()
		$Timer.stop()
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
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")

func appear():
	$Tween.interpolate_property($GridContainer, "rect_scale", Vector2(0,0), Vector2(1, 1), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)  
	$Tween.start()

