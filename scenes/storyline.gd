extends CanvasLayer


var Messages: Array = []


func _ready() -> void:
	Messages = set_dialog_text(Messages)
	
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		print(Messages.size())
		Messages = set_dialog_text(Messages)


func _on_timer_timeout() -> void:
	Messages = set_dialog_text(Messages)


func _on_next_pressed() -> void:
	Messages = set_dialog_text(Messages)


func set_dialog_text(msgs: Array) -> Array:
	if msgs.is_empty():
		queue_free()
	$Timer.stop()
	$DialogControl/RichTextLabel.bbcode_text = msgs.pop_front()
	trigger_timer($DialogControl/RichTextLabel.text)
	return msgs


func trigger_timer(txt: String) -> void:
	$Timer.wait_time = 1.5 + (txt.length() / 25.0)
	$Timer.start()
