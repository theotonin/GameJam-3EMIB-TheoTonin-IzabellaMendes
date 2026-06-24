extends Control
# função que altera a cena para a cena do jogo quando o botão é pressionado

func _on_jogar_novamente_pressed() -> void:
	GameManager.tentativas = 0
	GameManager.moedas = 0
	GameManager.pulos = 0
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
