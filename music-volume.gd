extends HSlider

@export var bus_name: String
var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	connect("value_changed", Callable(self, "_on_value_changed"))
	value = AudioServer.get_bus_volume_db(bus_index)

func _on_value_changed(value: float) -> void:
	print("Setze dB direkt:", value)
	AudioServer.set_bus_volume_db(bus_index, value)
