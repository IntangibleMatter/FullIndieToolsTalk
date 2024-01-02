extends AnimatableBody2D


func _ready() -> void:
	$Sprite2D.hide()

func _process(_delta: float) -> void:
	queue_redraw()


func _draw() -> void:
	draw_circle(Vector2(0, 32 + (sin(Time.get_ticks_msec() / 500.0 + 1.9) * 4)), 40 + (sin(Time.get_ticks_msec() / 500.0) * 4), Color.DARK_BLUE)
	draw_circle(Vector2(0, 96 + (sin(Time.get_ticks_msec() / 500.0 + 0.1) * 8)), 40 + (sin(Time.get_ticks_msec() / 500.0 + 0.7) * 8), Color.DARK_ORCHID)
	draw_circle(Vector2(0, 144 + (sin(Time.get_ticks_msec() / 500.0 + 0.6) * 6)), 32 + (sin(Time.get_ticks_msec() / 500.0 + 1.4) * 6), Color.REBECCA_PURPLE)
