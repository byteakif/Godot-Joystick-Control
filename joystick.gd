extends Control

@onready var knob = $knob

var max_distance := 80.0
var output := Vector2.ZERO
var dragging := false

var center := Vector2.ZERO

func _ready():
	center = size / 3.5
	knob.position = center
	add_to_group("joystick")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragging = event.pressed

			if !dragging:
				reset_joystick()

	elif event is InputEventMouseMotion and dragging:
		update_joystick(get_local_mouse_position())

	elif event is InputEventScreenTouch:
		dragging = event.pressed
		if !dragging:
			reset_joystick()

	elif event is InputEventScreenDrag:
		update_joystick(event.position - global_position)


func update_joystick(pos: Vector2):

	var offset = pos - center

	if offset.length() > max_distance:
		offset = offset.normalized() * max_distance

	knob.position = center + offset
	output = offset / max_distance


func reset_joystick():
	knob.position = center
	output = Vector2.ZERO
