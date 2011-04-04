// ooc implementation of ebeats
//
// rock -r ebeats.ooc

import os/Time

Ebeats: class {
    beats : Float

    now: func -> This {
        tt := (time(null)) as LLong
        day := 60 * 60 * 24
        this beats = (tt % day) * (1000.0 / day)
        return this
    }

    toString: func -> String {
        return "@%.2f" format(this beats)
    }
}

main: func {
    beat := Ebeats new()
    beat now() toString() println()
}

