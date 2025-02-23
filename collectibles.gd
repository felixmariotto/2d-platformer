extends Area2D

enum TypeEnum {apple, banana, cherry}
@export var fruitType: TypeEnum


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if fruitType == 0:
		$AnimatedSprite2D.play("apple")
	elif fruitType == 1:
		$AnimatedSprite2D.play("banana")
	elif fruitType == 2:
		$AnimatedSprite2D.play("cherries")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print( body )
