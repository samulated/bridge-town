class_name Quarters
extends Node
## Manager for quarter-day time blocks, also contains getters for current in-game date


enum TimeOfDay {
	MORNING,
	AFTERNOON,
	EVENING,
	NIGHT,
}

var _time : TimeOfDay
var _day : int

## Singleton reference
static var ref : Quarters

func _singleton_check() -> void:
	if ref:
		free()
	
	ref = self

## Enter Tree function - called when node is added to tree, prior to children being loaded
func _enter_tree() -> void:
	_singleton_check()

## Ready function - called once scene is created, after children load
func _ready() -> void:
	_time = TimeOfDay.MORNING
	_day = 1

func advance_quarter() -> void:
	if _time == TimeOfDay.NIGHT:
		_day += 1
		_time = TimeOfDay.MORNING
	else:
		@warning_ignore("int_as_enum_without_cast")
		_time += 1
