extends Node2D

onready var RoomScene = preload("res://RoomScene.tscn")
onready var DoorScene = preload("res://DoorScene.tscn")

var rooms = [[0, 0, 0, 0],
			[0, 0, 0, 0],
			[0, 0, 0, 0],
			[0, 0, 0, 0]]
			
var last_room_pos = Vector2(0, 0)
			
func _init():
	randomize()
	var x = 1
	var y = 1
	for _i in range(16):
		rooms[x][y] = 1 
		var dir = (randi() % 4) * 90 
		x += sin(deg2rad(dir)) 
		y += cos(deg2rad(dir)) 
		x = clamp(x, 0, 3) 
		y = clamp(y, 0, 3) 
	print(rooms)
		
func lengthdir_x(length, direction):
	return length*cos(direction)
func lengthdir_y(length, direction):
	return length*sin(direction)
	
func _ready():
	for y in range(4):
		var row = rooms[y]
		for x in range(4):
			if row[x]:
				var room = RoomScene.instance()
				var room_pos = Vector2(480*x, 270*y)+Vector2(-480,-270)
				room.set_pos(room_pos)
				self.add_child(room)
