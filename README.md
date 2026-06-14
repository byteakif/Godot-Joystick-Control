
# Godot Joystick Control

GDScript içi yapılmış joystick ile karakter kontrol sistemi.

Godot 4.x için geliştirilmiştir.

---

## Kurulum

1. Dosyaları projeye ekle
2. 'joystick.tscn' Sahnesini karakterin olduğu sahneye ekle.
3. Joystick'i karakter kodunda çağır ve haraket ettire bilir yap.

---

## Sistem Yapısı

```
Control
 └── TextureRect
 └── TextureRect
```

---
## Örnek

```gdscript
var speed = 300
@onready var joystick = get_tree().get_first_node_in_group("joystick")


func _physics_process(_delta):
	var dir = joystick.output
	velocity = dir * speed
	move_and_slide()
	
```
---
Developer: [@byteakif](https://github.com/byteakif)

## Lisans

MIT License - Ticari projelerde özgürce kullanıla bilir.
