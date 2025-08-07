extends Panel


func send_score(username: String, time: float) -> void:
	var url = "https://underwater-diving-leaderboard-4727xw63s.vercel.app/api/leaderboard"  # API-Endpunkt
	var json_data = {
		"username": username,
		"time": time
	}
	var json_string = to_json(json_data)

	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

	var err = $HTTPRequest.request(
		url,
		[],                    # keine zusätzlichen Header nötig, außer Content-Type
		true,                  # POST-Methode
		HTTPClient.METHOD_POST,
		json_string
	)
	if err != OK:
		print("Fehler beim HTTP-Request:", err)

func _on_request_completed(result, response_code, headers, body):
	if response_code == 201:
		print("Score erfolgreich gesendet!")
	else:
		print("Fehler beim Senden:", response_code, body.get_string_from_utf8())
