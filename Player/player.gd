extends CharacterBody2D

var speed := 120
var direccion := 0.0
var jump := 250
const gravity := 9

@onready var animation := $AnimationPlayer
@onready var sprite := $Sprite2D

func _physics_process(delta):
	direccion = Input.get_axis("ui_left","ui_right")
	velocity.x = direccion * speed
	
	if direccion != 0:
		animation.play("Walk")
	else:
		animation.play("Idle")
	
	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y -= jump
		
	
	if !is_on_floor():
		velocity.y += gravity
	
	move_and_slide()
	
