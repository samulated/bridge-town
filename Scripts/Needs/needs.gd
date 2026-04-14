class_name Needs
extends Node

@export
var hunger_decay : float = 20
@export
var hunger_decay_workload_modifier : float = 1.5
var _hunger : float = -1

@export
var energy_decay : float = 20
@export
var energy_decay_workload_modifier : float = 1.2
var _energy : float = -1

@export
var temperature_goal_median : float = 22
@export
var temperature_goal_range : float = 6
@export
var temperature_delta_modifier : float = 0.1
var _temperature_in_surrounds : float = 22
var _temperature

@export
var health_decay_modifier : float = 1
@export
var health_recovery_modifier : float = 1
var _health : float = -1

func on_tick(_workload : float):
	_hunger -= hunger_decay + (_workload * hunger_decay_workload_modifier)
	_energy -= energy_decay + (_workload * energy_decay_workload_modifier)
	_temperature += _temperature_in_surrounds * temperature_delta_modifier
	#TODO: add logic in regards to needs interacting with eachother (including health)

func add_to_hunger(_hunger_increase : float):
	_hunger += _hunger_increase

func add_to_energy(_energy_increase : float):
	_energy += _energy_increase

func change_temperature(_new_temperature : float):
	_temperature_in_surrounds = _new_temperature
