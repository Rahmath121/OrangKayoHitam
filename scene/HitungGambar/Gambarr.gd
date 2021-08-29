extends TextureButton
class_name gambarr

var matching
var depan
var belakang

var suit
var value
var tween_in = Tween.new()
var tween_out = Tween.new()
var ukuran_x = rect_size.x
var ukuran_y
var gambar_belakang = preload("res://asset/matching_gambar/kartu_game_HITUNG.png")
func _ready():
	
	add_child(tween_in)
	add_child(tween_out)
	set_h_size_flags(3)
	set_v_size_flags(3)
	set_expand(true)
	set_stretch_mode(TextureButton.STRETCH_KEEP_ASPECT_CENTERED)
	set_anchors_preset(15, true)

	
	
	matching = get_tree().root.get_node("MatchingGambar")
	
func _init(var s, var v):
	suit = s
	value = v
	depan = load("res://asset/matching_gambar/kartu-" + str(suit) + "-" + str(value) + ".png")
	belakang = gambar_belakang
	texture_normal = belakang
	
func _pressed():
	matching.pilih_gambar(self)
	
	
func flip():
	if texture_normal == belakang:
		set_normal_texture(depan)	
	else:
		set_normal_texture(belakang)
		
func animation_out():	
	tween_out.interpolate_property(self, "rect_scale", Vector2(0,1), Vector2(1, 1), 0.2,Tween.TRANS_LINEAR , Tween.EASE_OUT)
	tween_out.start()

func animation_in():
	tween_in.interpolate_property(self, "rect_scale", Vector2(1,1), Vector2(0, 1), 0.2,Tween.TRANS_LINEAR , Tween.EASE_OUT)
	tween_in.start()
	yield(tween_in, "tween_completed")
	flip()
	animation_out()
