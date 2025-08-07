extends Panel

@onready var textField: LineEdit = $LineEdit
@onready var end_message: Panel = $".."

var usernameTextField 
var finishingTime

func _ready() -> void:
	visible = false

func _on_button_4_pressed() -> void:
	usernameTextField = textField.text
	finishingTime = end_message.finishedTime
	send_score(usernameTextField, finishingTime)

func send_score(username: String, time: float) -> void:
	var url = "https://underwater-diving-leaderboard.vercel.app/api/leaderboard.js"
	var json_data = {
		"username": username,
		"time": time
	}
	var json_string = JSON.stringify(json_data)

	$HTTPRequest.request_completed.connect(_on_request_completed)

	var headers = ["Content-Type: application/json"]
	$HTTPRequest.set_request_body(json_string)

	var err = $HTTPRequest.request(
		url,
		headers,
		true,
		HTTPClient.METHOD_POST
	)
	if err != OK:
		print("Fehler beim HTTP-Request:", err)

func _on_request_completed(result: int, response_code: int, headers: Array, body: PackedByteArray) -> void:
	if response_code == 201:
		print("Score erfolgreich gesendet!")
	else:
		print("Fehler beim Senden:", response_code, body.get_string_from_utf8())
