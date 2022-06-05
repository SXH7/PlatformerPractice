extends KinematicBody2D
class_name Actor

export var speed: = Vector2(500, 1000)
export var gravity: = 1000.0

var velocity: = Vector2.ZERO

func _physics_process(delta):
	velocity.y += gravity*delta
	move_and_slide(velocity)
