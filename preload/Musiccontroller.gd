extends Node

var home = load("res://asset/audio/UI/theme.ogg")

var scene1 = load("res://asset/audio/scene1/Scene1.ogg")

var scene2 = load("res://asset/cerita/scene2/Scene2.ogg")

var scene3 = load("res://asset/cerita/scene3/Scene3.ogg")

var scene4 = load("res://asset/cerita/scene4/Scene4.ogg")

var scene5 = load("res://asset/cerita/scene5/Scene5.ogg")

var scene6 = load("res://asset/cerita/scene6/Scene6.ogg")

var mute = false

func ready():
	pass

func HomeBGM():
	$music.stream = home
	$music.play()
	
func Scene1():
	$music.stream = scene1
	$music.play()

func Scene2():
	$music.stream = scene2
	$music.play()

func Scene3():
	$music.stream = scene3
	$music.play()	

func Scene4():
	$music.stream = scene4
	$music.play()	
	
func Scene5():
	$music.stream = scene5
	$music.play()

func Scene6():
	$music.stream = scene6
	$music.play()				
func play_in():
	$AnimationPlayer.play("masuk")

func play_end():
	$AnimationPlayer.play("keluar")
func play_home():
	$AnimationPlayer.play("homebgm")
