extends Node2D

var hours = 0;
var minutes = 0;
var seconds = 0;
var lastseconds = 0;

var blink = false;

var alarm1hours = 0;
var alarm1mins = 0;
var alarm2hours = 0;
var alarm2mins = 0;
var snoozemins = 5;

onready var setHoursText = get_node("CanvasLayer/Panel/HoursBox").text;
onready var setMinsText = get_node("CanvasLayer/Panel/MinsBox").text
onready var time = get_node("CanvasLayer/Panel/TimeCenter/Time");
onready var alarm1 = get_node("CanvasLayer/Panel/Panel/Alarm1Text");
onready var alarm2 = get_node("CanvasLayer/Panel/Panel/Alarm2Text");
onready var snoozetext = get_node("CanvasLayer/Panel/Panel/SnoozeText");

func _ready():
	pass



func _process(delta):
	
	seconds = seconds + delta;
	
	if (lastseconds != int(seconds)):
		lastseconds = int(seconds);
		blink = !blink;
	
	if (int(seconds) >= 60):
		seconds = 0;
		minutes += 1
		if (minutes > 59):
			minutes = 0;
			hours += 1;
			if(hours > 23):
				hours = 0;
		
	var temph = String(hours)
	var tempm = String(minutes);
	
	if (hours < 10):
		temph = "0" + String(hours);
	if (minutes < 10):
		tempm = "0" + String(minutes);
	
	if (blink):
		time.text = temph + "   " + tempm;
	elif (!blink):
		time.text = temph + " : " + tempm;
	
	temph = String(alarm1hours)
	tempm = String(alarm1mins);
	
	if (alarm1hours < 10):
		temph = "0" + String(alarm1hours);
	if (alarm1mins < 10):
		tempm = "0" + String(alarm1mins);
	
	alarm1.text = "Alarm 1:  " + temph + " : " + tempm;
	
	temph = String(alarm2hours)
	tempm = String(alarm2mins);
	
	if (alarm2hours < 10):
		temph = "0" + String(alarm2hours);
	if (alarm2mins < 10):
		tempm = "0" + String(alarm2mins);
	
	alarm2.text = "Alarm 2:  " + temph + " : " + tempm;
	
	tempm = String(snoozemins);
	
	snoozetext.text = "Snooze Time: " + tempm + " minutes";
	
	pass


func _on_SetHour_pressed():
	setHoursText = get_node("CanvasLayer/Panel/HoursBox").text;
	if (int(setHoursText) < 25 && int(setHoursText) >= 0):
		hours = int(setHoursText);
	pass # Replace with function body.


func _on_SetMinute_pressed():
	setMinsText= get_node("CanvasLayer/Panel/MinsBox").text;
	if (int(setMinsText) < 60 && int(setMinsText) >= 0):
		minutes = int(setMinsText);
	pass # Replace with function body.


func _on_SetAlarm1_pressed():
	setMinsText= get_node("CanvasLayer/Panel/MinsBox").text;
	if (int(setMinsText) < 60 && int(setMinsText) >= 0):
		alarm1mins = int(setMinsText);
	setHoursText = get_node("CanvasLayer/Panel/HoursBox").text;
	if (int(setHoursText) < 25 && int(setHoursText) >= 0):
		alarm1hours = int(setHoursText);
	pass # Replace with function body.

func _on_SetAlarm2_pressed():
	setMinsText= get_node("CanvasLayer/Panel/MinsBox").text;
	if (int(setMinsText) < 60 && int(setMinsText) >= 0):
		alarm2mins = int(setMinsText);
	setHoursText = get_node("CanvasLayer/Panel/HoursBox").text;
	if (int(setHoursText) < 25 && int(setHoursText) >= 0):
		alarm2hours = int(setHoursText);
	pass # Replace with function body.


func _on_SetSnooze_pressed():
	setMinsText= get_node("CanvasLayer/Panel/MinsBox").text;
	if (int(setMinsText) < 60 && int(setMinsText) >= 0):
		snoozemins = int(setMinsText);
	pass # Replace with function body.
