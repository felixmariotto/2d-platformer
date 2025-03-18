extends Camera2D

@export var target0: Node2D
@export var target1: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var viewportRect = get_viewport_rect()
	var maxDist = viewportRect.size[0]
	
	"""
	if target0.position.distance_to( target1.position ) > maxDist:
		print( "separate" )
	else:
		print( "merge" )
		"""
	
	var targetPos = ( target0.position + target1.position ) * 0.5
	position = position.lerp( target0.position, 0.1 )
	
