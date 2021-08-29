extends Panel

var kapal = preload("res://asset/hitung_gambar/gambar-1-1.png")
var karung = preload("res://asset/hitung_gambar/gambar-1-2.png")
var padi = preload("res://asset/hitung_gambar/gambar-1-3.png")
var gerobak = preload("res://asset/hitung_gambar/gambar-1-4.png")
var kelapa = preload("res://asset/hitung_gambar/gambar-1-5.png")


var gambar  = [kapal, karung, padi, gerobak, kelapa]
var pilih_gambar
onready var texture = $TextureButton

func _ready():
	texture.texture_normal = gambar[pilih_gambar]
