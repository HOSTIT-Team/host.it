const container = document.querySelector("#drawing-area")

const params = {
    width: 500,
    height: 500
}

const two = new Two(params)
two.appendTo(container)

// config for animation
const numberOfShapes = 25
const shapes = []
const loopDuration = 6 * 60
const aDelay = 0.0025

// make shapes
for (let i = 0; i < numberOfShapes; i++) {
    const size = 20
    const sx = size * i + 10
    const sy = 250
    const sr = 0
    const plotRadius = 200
    const angle = fullRotation * i / numberOfShapes

    const ex = 250 + plotRadius * Math.cos(angle)
    const ey = 250 + plotRadius * Math.sin(angle)
    const er = randomNumber(-2 * fullRotation, 2 * fullRotation)

    const shape = two.makeRectangle(sx, sy, size, size)
    shape.noStroke()
    shape.fill = "#AB99FB"
    shape.data = {
        sx: sx,
        sy: sy,
        sr: sr,
        ex: ex,
        ey: ey,
        er: er
    }

    shapes.push(shape)

}

two.bind("update", function (frameCount) {
    // draw
    const currentFrame = frameCount % loopDuration
    const t = currentFrame / loopDuration

    shapes.forEach((shape, i) => {
        const aStart = aDelay * (numberOfShapes - i)
        const aEnd = aDelay * i
        let u = 0

        if (t < 0.5) {
            u = mapAndClamp(t, aStart, 0.5 - aEnd, 0, 1)
        } else {
            u = mapAndClamp(t, 0.5 + aStart, 1 - aEnd, 1, 0)
        }

        const cu = easeInOutCubic(u)

        const x = mapAndClamp(cu, 0, 1, shape.data.sx, shape.data.ex)
        const y = mapAndClamp(cu, 0, 1, shape.data.sy, shape.data.ey)
        const r = mapAndClamp(cu, 0, 1, shape.data.sr, shape.data.er)
        shape.translation.x = x
        shape.translation.y = y
        shape.rotation = r
    })
})

two.play()