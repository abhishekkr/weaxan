extends Node2D


func _ready() -> void:
	if GameState.PLAYER_POWER_TYPE:
		remove_blessing_altar()
	disable_blessing_altar()


func disable_blessing_altar() -> void:
	$BlessingsTilemap.visible = false
	$BlessingsTilemap/DemonicSwordArea.monitoring = false
	$BlessingsTilemap/DivineSwordArea.monitoring = false


func remove_blessing_altar() -> void:
	remove_child($BlessingsAltarArea)
	remove_child($BlessingsTilemap)


func _on_add_demonic_power_pressed() -> void:
	GameState.PLAYER_POWER_TYPE = GameState.PowerType.DEMONIC_SWORD
	$BlessingsTilemap.visible = false
	remove_blessing_altar()
	GameState.show_storyline("GameWorld", ["You're a Demonic Swordsman now."])


func _on_add_divine_power_pressed() -> void:
	GameState.PLAYER_POWER_TYPE = GameState.PowerType.DIVINE_SWORD
	$BlessingsTilemap.visible = false
	remove_blessing_altar()
	GameState.show_storyline("GameWorld", ["You're a Divine Swordsman now."])
