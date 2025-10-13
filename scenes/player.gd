extends Node2D


@export var speed = 100


func _process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#position += direction * speed * delta
	if direction.length() > 0:
		$CharacterBody2D.velocity = direction * speed
		$CharacterBody2D/AnimatedSprite2D.play("run")
	else:
		$CharacterBody2D.velocity = Vector2.ZERO
		$CharacterBody2D/AnimatedSprite2D.play("idle")
	$CharacterBody2D.move_and_slide()
