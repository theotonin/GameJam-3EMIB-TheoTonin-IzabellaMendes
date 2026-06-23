extends Area2D
# Novo sinal criado (é possível criar um sinal caso os sinais padrões da Godot
# não tenham o que precisamos
signal collected
# Quando uma moeda for criada na tela, o sinal body_entered
# (sinal emitido automaticamente quando um corpo físico entra na área do nó Area2D)
# é conectado à função on_body_entered
func _ready():
	body_entered.connect(_on_body_entered)
# Toda vez que um corpo entra na Area2D, a função _on_body_entered recebe
# automaticamente como parâmetro o nó que entrou nessa área, representado
# pelo body
func _on_body_entered(body):
	if body.name == "player":
		body.direction = Input.get_axis("left", "right")
		print(body.direction)
		if body.direction:
			body.velocity.x = body.direction * body.SPEED
		else:
			body.velocity.x = move_toward(body.velocity.x, 0, body.SPEED)
		collected.emit()
		queue_free()
