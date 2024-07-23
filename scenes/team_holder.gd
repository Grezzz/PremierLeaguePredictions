@tool
class_name TeamHolder extends StaticBody2D

@onready var label = $Label

@export var label_text: String
@export var modulate_color: Color
@export var rank: int

var teams: Array = []

signal update_teams

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = label_text
	modulate = modulate_color


func _on_team_detector_body_entered(body):
	teams.push_back(body)
	
	if teams.size() == 1:
		State.add_team(rank, body.team_name)
	else:
		State.remove_team(rank)
	
	update_teams.emit()


func _on_team_detector_body_exited(body):
	teams.erase(body)
	
	if teams.size() == 1:
		State.add_team(rank, teams[0].team_name)
	else:
		State.remove_team(rank)
		
	update_teams.emit()
