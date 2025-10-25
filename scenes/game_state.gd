extends Node

enum PowerType {
	DIVINE_SWORD,
	DEMONIC_SWORD
}

var current_storyline_instance: CanvasLayer = null
var PLAYER_POWER_TYPE = null

var EVENT_MESSAGES: Dictionary[String, Array] = {
	"SPAWN": [
		"Welcome to WEXAN! [img=64]res://logo.png[/img]",
		"You seem to be new here. Wexan has many opportunites.. of power, myths, dangers and to grow among them.",
		"Wexan is a green island with some peculiarities.",
		"Find an Altar in the patch of mud, go to it and you may find your first blessing."
	],
	"POWER_BLESSING": [
		"Oh! so you're the new Wanderer. Come to get the blessings, eh!",
		"Alright, it's been long since I sponsored a Wanderer. I'll be generous and let you choose...",
		"Divine Sword Or Demonic Sword; which path do you wish to take."
	],
	"DEMONIC_SWORD_HINT": [
		"It's not easy to give in to your true nature. Do you have what it takes to stand alone on top?",
		"Click on '+' to accept the Teachings of Demonic Sword Blessing."
	],
	"DIVINE_SWORD_HINT": [
		"The path of Divine Sword is slow yet satisfying. You can become the hope of humanity.",
		"Click on '+' to accept the Teachings of Divine Sword Blessing."		
	]
}


func get_event_messages(event: String) -> Array:
	return EVENT_MESSAGES[event]


func show_storyline(scene_name: String, msgs: Array) -> void:
	if current_storyline_instance:
		current_storyline_instance.queue_free()
		current_storyline_instance = null
	var storyline_scene = load("res://scenes/storyline.tscn")
	current_storyline_instance = storyline_scene.instantiate()
	current_storyline_instance.Messages = msgs
	var myscene = find_scene(scene_name)
	myscene.add_child(current_storyline_instance)


func find_scene(scene_name):
	var myroot = get_tree().get_root()
	for scene_node in myroot.get_children():
		if scene_node.name == scene_name:
			return scene_node
	return null


func find_node_in_scene(scene_name, node_name, node_type):
	var myscene = find_scene(scene_name)
	if myscene:
		return find_child_by_node_name_and_type(myscene, node_name, node_type)
	return null


func find_child_by_node_name_and_type(parent_node, node_name, node_type):
	for child_node in parent_node.get_children():
		if is_instance_of(child_node, node_type) and child_node.name == node_name:
			print(child_node.name)
			return child_node
	return null
