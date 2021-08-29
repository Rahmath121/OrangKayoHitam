extends Control

var deck = []
var gambar1
var pilih1
var pilih2
var panel_sekarang = null

var ukuran_panel = 2
var ukuran_gambar = 3
var reset_game = 0

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
		
		
		if reset_game == deck.size()/2:
			yield(get_tree().create_timer(0.5), "timeout")
			ukuran_gambar += 1
			$Panel/GridContainer.columns += 1
			grid_size()
			
			hapus()
		
		print(deck.size())
	else:
		yield(get_tree().create_timer(1.2), "timeout")
		pilih1.animation_in()
		pilih2.animation_in()
		pilih1.set_disabled(false)
		pilih2.set_disabled(false)
		pilih1 = null
		pilih2 = null
		
func hapus():
	reset_game = 0
	for c in range(deck.size()):
		deck[c].queue_free()
	deck.clear()
	isi_deck()
	masukkan_gambar()



func _on_Button_pressed():
	hapus()

func grid_size():
	if ukuran_gambar == 3:
		$Panel/GridContainer.rect_size = Vector2(550, 550)
		$Panel/GridContainer.rect_position = Vector2(275,0)
	if ukuran_gambar == 4:
		$Panel/GridContainer.rect_size = Vector2(750, 550)
		$Panel/GridContainer.rect_position = Vector2(175,0)
	if ukuran_gambar == 5:
		$Panel/GridContainer.rect_size = Vector2(900, 550)
		$Panel/GridContainer.rect_position = Vector2(100,0)
	if ukuran_gambar == 6:
		$Panel/GridContainer.rect_size = Vector2(1100, 550)
		$Panel/GridContainer.rect_position = Vector2(0,0)

