extends Area2D
# Novo sinal criado (é possível criar um sinal caso os sinais padrões da Godot
# não tenham o que precisamos
signal collected

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var particulas: GPUParticles2D = $Particulas

@onready var hud: CanvasLayer = $"../Hud"

func _ready():
	body_entered.connect(_on_body_entered)
# Toda vez que um corpo entra na Area2D, a função _on_body_entered recebe
# automaticamente como parâmetro o nó que entrou nessa área, representado
# pelo body
func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		GameManager.moedas += 1
		#hud.atualizar_moedas()
	collected.emit()
	sprite_2d.visible = false
	collision_shape_2d.set_deferred("disabled", true)
	particulas.emitting = true
	await particulas.finished
	queue_free()
