extends Panel

const METHOD_POST := 1  # POST = 1 in Godot 4 HTTPClient

@onready var textField: LineEdit = $LineEdit
@onready var end_message: Panel = get_parent()  # ggf. anpassen
@onready var http: HTTPRequest = $HTTPRequest

var usernameTextField: String = ""
var finishingTime: String = ""

func _ready() -> void:
	visible = false

func _on_button_4_pressed() -> void:
	usernameTextField = textField.text
	if "finishedTimeOutput" in end_message:
		finishingTime = end_message.finishedTimeOutput
	else:
		finishingTime = ""
	send_score(usernameTextField, finishingTime)
	visible = false
	print("finished")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://main_menu.tscn")

func send_score(username: String, time: String) -> void:
	print("sendscore-abgerufen")
	var url := "https://underwater-diving-leaderboard.vercel.app/api/leaderboard"
	var json := JSON.stringify({
		"username": username,
		"time": time
	})

	var headers := [
		"Content-Type: application/json",
		"User-Agent: GodotClient/1.0"
	]

	if not http.is_connected("request_completed", self._on_request_completed):
		http.connect("request_completed", self._on_request_completed)

	http.set_use_threads(true)  # Threads besser bei Requests mit Body

	var method = HTTPClient.METHOD_POST

	var err: int = http.request(
		url,
		headers,
		method,
		json
	)

	print("Gesendete HTTP-Methode:", method)

	if err != OK:
		print("HTTP-Fehler:", err)

func _on_request_completed(result: int, response_code: int, headers: Array, body: PackedByteArray) -> void:
	print("HTTP abgeschlossen mit Code:", response_code)
	var response_text := ""
	if body.size() > 0:
		response_text = body.get_string_from_utf8()
	print("Antwort:", response_text)
