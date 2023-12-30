class_name SlideResource
extends Resource

## This is the tab that should be used on this slide.
@export var tab : String
## This is to make it easier to know how the file should be used.
@export_enum("scene", "script", "addon", "slide") var slide_type : String:
	set(val):
		slide_type = val
## Whatever file should be loaded into the tab on this slide.
@export_file() var file : String
## Next slide to display
@export var next_slide : SlideResource
## The Plugins that should be enabled/disabled on the next slide.
@export var plugins : Array[PluginChange]
## Features that should be disabled on this slide, to reference, view EditorFeatureProfile.Feature.
## By default 3D and AssetLib are disabled.
@export var disabled_features : PackedInt32Array = [0, 2]
