@tool
extends "res://addons/dialogue_editor/model/DialogueDialog.gd"

@onready var _timer = $Timer
var _sentence_text: = ""

func _ready() -> void:
	super._ready()
	_timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout() -> void:
	if _sentence and _sentence_text.length() != _sentence.texte_events[0].text.length():
		_sentence_text = _sentence.texte_events[0].text.substr (0, _sentence_text.length() + 1)
		_text_update()

func _text_update() -> void:
	if _sentence.text_exists():
		_text_ui.visible = true
		_text_ui.text = _sentence_text
	else:
		_text_ui.visible = false
