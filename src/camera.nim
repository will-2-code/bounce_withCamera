import raylib as ray
import raymath as mat

type 
    Camera* = object
        pos*: ray.Vector2
        speed*: float32
        locked*: bool


proc init*(position: Vector2 = Vector2(x: 0, y: 0), speed: float32 = 10, locked: bool = false): Camera =
    return Camera(pos: position, speed: speed, locked: locked)


proc take_input*(camera: var Camera, delta: float32, world_size: ray.Vector2): void =
    if not (camera.pos.x < -100 and camera.pos.x > world_size.x + 100) and not (camera.pos.y < -100 and camera.pos.y > world_size.y + 100):
        var direction: ray.Vector2 = ray.Vector2(x: 0, y: 0)

        if ray.isKeyDown(A):
            direction.x -= 1
        if ray.isKeyDown(D):
            direction.x += 1
        if ray.isKeyDown(W):
            direction.y -= 1
        if ray.isKeyDown(S):
            direction.y += 1
        
        camera.pos.x += camera.speed * direction.x
        camera.pos.y += camera.speed * direction.y