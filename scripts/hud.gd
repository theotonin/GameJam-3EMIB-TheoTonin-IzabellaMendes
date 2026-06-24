extends CanvasLayer
# variável referenciando a label de vidas
@onready var tentativas: Label = $Control/Tentativas
@onready var pulos: Label = $Control/Pulos
@onready var moedas: Label = $Control/Moedas

# Quando carregar na cena, chamar a função atualizar_vidas()
func _ready() -> void:
	atualizar_tentativas()
	atualizar_moedas()
	atualizar_pulos()
# função que atualiza a label para o valor da variável vidas no GameManager
func atualizar_tentativas() -> void:
	tentativas.text = "Tentativas " + str(GameManager.tentativas)

func atualizar_moedas() -> void:
	moedas.text = "Moedas: " + str(GameManager.moedas)
	
func atualizar_pulos() ->void :
	pulos.text = "Pulos: " + str(GameManager.pulos)
