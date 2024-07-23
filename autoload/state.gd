extends Node

const DEFAULT: String = "-"

var state: Dictionary = {}

func _ready():
	for rank in range(1,21):
		state[rank] = "-"


func add_team(rank: int, team_name: String):
	state[rank] = team_name


func remove_team(rank: int):
	state[rank] = DEFAULT


func get_formatted_state() -> String:
	return _format_output()


func copy_to_clipboard() -> void:
	DisplayServer.clipboard_set(_format_output())


func _format_output() -> String:
	var output = ""
	
	for rank in state.keys():
		output += str(rank)
		output += ".	"
		output += state[rank]
		if rank < state.keys().size():
			output += "\n"
		
	return output
