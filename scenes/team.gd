@tool
class_name Team extends RigidBody2D

@export var team_name: String
@export var badge_texture: Texture

@onready var badge = $Badge

var can_grab: bool = true
var mouse_inside: bool = false
var mouse_was_pressed: bool = false
var signal_fired: bool = false

signal team_grabbed(team: Team)
signal team_released

func _ready():
	badge.texture = badge_texture


func _integrate_forces(_state):
	if can_grab and mouse_inside and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if not signal_fired:
			team_grabbed.emit(self)
			signal_fired = true
		mouse_was_pressed = true
		global_position = get_global_mouse_position()
		linear_velocity = Vector2.ZERO
	elif mouse_inside and mouse_was_pressed and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		linear_velocity = Input.get_last_mouse_velocity()
		team_released.emit()
		mouse_was_pressed = false
		signal_fired = false
	else:
		mouse_was_pressed = false


func _on_area_2d_mouse_entered():
	mouse_inside = true


func _on_area_2d_mouse_exited():
	mouse_inside = false
