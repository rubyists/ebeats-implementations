local time = os.date("!%H:%M:%S")
local beats = string.sub(time, 0, 2) * (1000.0 / 24) +
              string.sub(time, 4, 5) * (1000.0 / (24 * 60)) +
              string.sub(time, 7, 8) * (1000.0 / (24 * 60 * 60))
print(string.format("@%.2f", beats))
