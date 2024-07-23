extends Node2D

@onready var teams = $Teams
@onready var ranks_as_text = $MarginContainer/RanksAsText
@onready var team_holders = $TeamHolders


func _ready():
	for team: Team in teams.get_children():
		team.team_grabbed.connect(_team_grabbed)
		team.team_released.connect(_team_released)
	
	for team_holder: TeamHolder in team_holders.get_children():
		team_holder.update_teams.connect(_update_text)


func _team_grabbed(grabbed_team: Team):
	for team: Team in teams.get_children():
		if team != grabbed_team:
			team.can_grab = false


func _team_released():
	for team: Team in teams.get_children():
		team.can_grab = true


func _on_show_text_button_toggled(toggled_on):
	if toggled_on:
		ranks_as_text.text = State.get_formatted_state()
	ranks_as_text.visible = toggled_on


func _update_text():
	ranks_as_text.text = State.get_formatted_state()
