extends Node

var _server: TCPServer 

@export var _port : int = 13000;
@export var _kiloBytesAmount: int = 100; # The higher this value is the more the image data can be processed at once
@export  var _liveFeed : TextureRect;    # The image sent by the Camera 4 Godot application will be outputted here.

func _ready() -> void:
	setup_server()

func setup_server():
	_server = TCPServer.new()
	_server.listen(_port)
	print("Server started on port %s" % _port)
	start_listening()

func start_listening():
	while true:
		var peer: StreamPeerTCP = _server.take_connection()
		if peer && peer.get_status() == StreamPeerTCP.STATUS_CONNECTED:
			await process_request(peer)
		await get_tree().create_timer(0.01).timeout

func process_request(peer: StreamPeerTCP):
	peer.poll()
	if peer.get_available_bytes() < 5: return
	
	var buffer_size: int = 1024 * _kiloBytesAmount 
	var arr: Array = peer.get_data(buffer_size)
	#if arr[0] != OK: 
		#print(error_string(arr[0]), ", ", int(arr[0]))
	
	var data: PackedByteArray = arr[1]
	if data.size() > 0:
		var img = Image.new()
		img.load_jpg_from_buffer(data)
		var img_tex = ImageTexture.new()
		img_tex.set_image(img)
		_liveFeed.texture = img_tex
