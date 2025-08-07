extends Panel

@onready var textField: LineEdit = $LineEdit
@onready var end_message: Panel = $".."
@onready var http: HTTPRequest = $HTTPRequest

var usernameTextField
var finishingTime

func _ready() -> void:
	visible = false

func _on_button_4_pressed() -> void:
	usernameTextField = textField.text
	finishingTime = end_message.finishedTimeOutput
	send_score(usernameTextField, finishingTime)
	visible = false
	
func send_score(username: String, time: float) -> void:
	var url := "https://underwater-diving-leaderboard.vercel.app/api/leaderboard.js"
	var json := JSON.stringify({
		"username": username,
		"time": time
	})

	var headers := ["Content-Type: application/json"]

	if not $HTTPRequest.request_completed.is_connected(_on_request_completed):
		$HTTPRequest.request_completed.connect(_on_request_completed)

	var err: int = $HTTPRequest.request(
		url,
		headers,
		HTTPClient.METHOD_POST,
		json  # Das ist der JSON-Body
	)

	if err != OK:
		print("HTTP-Fehler:", err)

func _on_request_completed(result: int, response_code: int, headers: Array, body: PackedByteArray) -> void:
	print("HTTP abgeschlossen mit Code:", response_code)
	print("Antwort:", body.get_string_from_utf8())
