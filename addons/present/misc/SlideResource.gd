class_name SlideResource
extends Resource

## This is the tab that should be used on this slide.
@export var tab : String
## This is to make it easier to know how the file should be used.
@export_enum("none", "scene", "script", "addon", "slide") var slide_type : String = "none"
## Whatever file should be loaded into the tab on this slide.
@export_file() var file : String
## Miscellaneous other data.
@export var misc_data : Dictionary
## Next slide to display
@export var next_slide : SlideResource
## The Plugins that should be enabled/disabled on the next slide.
@export var plugins : Array[PluginChange]
