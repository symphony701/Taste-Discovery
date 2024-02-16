extends Control

signal selected()

@export var skinIndice: int

func _ready():
	$Skin.texture = load(GlobalPlayer.skins[skinIndice]["sprite"])
	update_locked()

func update_locked():
	var islocked = GlobalPlayer.skins[skinIndice]["locked"]
	$LokedControl.visible = islocked
	$Button.disabled = islocked

func _on_button_pressed():
	selected.emit()

func _on_button_2_pressed():
	if GlobalPlayer.moneys >= 100:
		GlobalPlayer.skins[skinIndice]["locked"] = false
		update_locked()
