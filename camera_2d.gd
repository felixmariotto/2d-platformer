extends Camera2D

@export var target0: Node2D
@export var target1: Node2D

var lastPos = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	var playersAxis = get_players_axis()
	var targetPos;
	
	# if condition is met, then the screen must be split
	if get_players_max_dist_overflow() > 0 :
		targetPos = target0.position
		var shift = playersAxis * get_viewport_rect().size * 0.25
		targetPos -= shift
	else:
		targetPos = ( target0.position + target1.position ) * 0.5
	
	position = position.lerp( lastPos, 0.1 )
	lastPos = targetPos

func get_players_axis():
	return ( ( target0.position - target1.position ) / get_viewport_rect().size ).normalized()

func get_players_max_dist_overflow():
	return max( 0, target0.position.distance_to( target1.position ) - ( get_players_axis() * get_viewport_rect().size * 0.5 ).length() )
