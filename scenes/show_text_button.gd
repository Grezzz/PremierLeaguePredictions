extends TextureButton

@onready var show_label = $ShowLabel
@onready var hide_label = $HideLabel

func _on_toggled(toggled_on):
	show_label.visible = not toggled_on
	hide_label.visible = toggled_on
