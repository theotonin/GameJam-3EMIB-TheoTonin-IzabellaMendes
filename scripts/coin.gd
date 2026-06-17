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
# Se o nome do nó que entrou na área for Player, execute as ações
	if body.name == "player":
 	# printe no console "+1"
		print("+1")
 # Emita o sinal collected (criado no início do código)
	collected.emit()
 # Remova a moeda da cena
	queue_free()
