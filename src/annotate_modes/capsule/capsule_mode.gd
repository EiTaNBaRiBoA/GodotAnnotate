@tool
extends "res://addons/GodotAnnotate/src/annotate_modes/helpers/rectangle_like/rectangle_like_mode.gd"
###
### Abstract AnnotateMode implementation for the rectangle like mode.
### This mode implementation is for a capsule, which will be fitted inside a rectangle.
### 

const CapsuleStrokeScene := preload("res://addons/GodotAnnotate/src/annotate_modes/capsule/capsule_stroke.tscn")

func get_icon_path() -> String:
    return "res://addons/GodotAnnotate/src/annotate_modes/capsule/capsule_icon.svg"

func get_mode_name() -> String:
    return "Capsule"

func get_stroke_variables() -> Dictionary:
    return {
        "Fill": true
    }

func on_begin_stroke(pos: Vector2, size: float, color: Color, variables: Dictionary, canvas: AnnotateCanvas) -> GDA_Stroke:
    var stroke: RectangleLikeStroke = CapsuleStrokeScene.instantiate()
    stroke.stroke_init(size, color, pos)
    stroke.fill =  variables["Fill"]
    return stroke

func draw_cursor(pos: Vector2, size: float, brush_color: Color, canvas: CanvasItem) -> void:
    canvas.draw_circle(pos, size / 2, brush_color)
