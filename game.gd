extends Node2D

@onready var players = [
	{
		viewport = $"HBoxContainer/SubViewportContainer/SubViewport",
		camera = $"HBoxContainer/SubViewportContainer/SubViewport/Camera2D",
		player = $"HBoxContainer/SubViewportContainer/SubViewport/Level/Player0"
	},
	{
		viewport = $"HBoxContainer/SubViewportContainer2/SubViewport",
		camera = $"HBoxContainer/SubViewportContainer2/SubViewport/Camera2D",
		player = $"HBoxContainer/SubViewportContainer/SubViewport/Level/Player1"
	}
]

func _ready() -> void:
	players[1].viewport.world_2d = players[0].viewport.world_2d
