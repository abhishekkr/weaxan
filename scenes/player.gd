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


func _on_spawn_area_area_exited(area: Area2D) -> void:
	if GameState.PLAYER_POWER_TYPE:
		return
	print("Should trigger Spawn Messages")
	var messages = GameState.get_event_messages("SPAWN")
	GameState.show_storyline("GameWorld", messages)


func _on_blessings_altar_area_area_entered(area: Area2D) -> void:
	if GameState.PLAYER_POWER_TYPE:
		return
	print("Should show two sowrds to select from")
	var messages = GameState.get_event_messages("POWER_BLESSING")
	GameState.show_storyline("GameWorld", messages)
	var blessing_tilemap = GameState.find_node_in_scene("GameWorld", "BlessingsTilemap", TileMapLayer)
	if blessing_tilemap:
		blessing_tilemap.visible = true
		var demonic_sword_area = GameState.find_child_by_node_name_and_type(blessing_tilemap, "DemonicSwordArea", Area2D)
		var divine_sword_area = GameState.find_child_by_node_name_and_type(blessing_tilemap, "DivineSwordArea", Area2D)
		if demonic_sword_area:
			demonic_sword_area.monitoring = true
		if divine_sword_area:
			divine_sword_area.monitoring = true
	


func _on_demonic_sword_area_area_entered(area: Area2D) -> void:
	var messages = GameState.get_event_messages("DEMONIC_SWORD_HINT")
	GameState.show_storyline("GameWorld", messages)


func _on_divine_sword_area_area_entered(area: Area2D) -> void:
	var messages = GameState.get_event_messages("DIVINE_SWORD_HINT")
	GameState.show_storyline("GameWorld", messages)
