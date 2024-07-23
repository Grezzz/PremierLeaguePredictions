extends TextureButton

@onready var copy_label = $CopyLabel
@onready var copied_label = $CopiedLabel
@onready var timer: Timer = $Timer

func _on_button_down():
	State.copy_to_clipboard()
	copy_label.hide()
	copied_label.show()
	timer.start()


func _on_timer_timeout():
	copy_label.hide()
	copied_label.show()
