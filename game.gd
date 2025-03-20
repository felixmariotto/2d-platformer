extends Node2D

@onready var players = [
	{
		viewport = $"SubViewport",
		camera = $"SubViewport/Camera2D",
		player = $"SubViewport/Level/Player0"
	},
	{
		viewport = $"SubViewport2",
		camera = $"SubViewport2/Camera2D",
		player = $"SubViewport/Level/Player1"
	}
]

var playersAxis = Vector2( 1.0, 1.0 )

func _ready() -> void:
	players[1].viewport.world_2d = players[0].viewport.world_2d
	$ColorRect.material.set_shader_parameter( "player0tex", players[0].viewport.get_texture() )
	$ColorRect.material.set_shader_parameter( "player1tex", players[1].viewport.get_texture() )

func _process(float) -> void:
	
	var windowSize = get_window().size;
	
	# stretch each viewport to the window size
	for player in players:
		player.viewport.size = windowSize
		
	# stretch the view rectangle to the window size
	$ColorRect.size = windowSize
	
	# update players axis value so that shader can know how to split the screen
	playersAxis = players[0].player.position - players[1].player.position
	playersAxis = playersAxis.normalized()

	$ColorRect.material.set_shader_parameter( "playersAxis", playersAxis )
	
	# update the rectangle line to the appropriate size and angle over the split between viewports.
	
	$ColorRectLine.size.x = 50;
	$ColorRectLine.size.y = get_window().size.x + get_window().size.y
	
	var newPos = windowSize * 0.5
	newPos.x -= $ColorRectLine.size.x / 2.0
	newPos.y -= $ColorRectLine.size.y / 2.0
	$ColorRectLine.position = newPos;
	
	$ColorRectLine.pivot_offset = $ColorRectLine.size / 2.0
	$ColorRectLine.rotation = playersAxis.angle()
	
	print( players[0].camera.get_players_max_dist_overflow() )
