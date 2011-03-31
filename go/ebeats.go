package main

// depending on your platform, compile and link this with
//   6g ebeats.go; 6l -o ebeats ebeats.6
// or
//   8g ebeats.go; 8l -o ebeats ebeats.8

import(
  "fmt"
  "time"
)

func main() {
  now := time.UTC()
  beats := (float64(now.Hour)   * (1000.0 / 24.0) +
            float64(now.Minute) * (1000.0 / (24.0 * 60.0)) +
            float64(now.Second) * (1000.0 / (24.0 * 60.0 * 60.0)))
  trunc := float32(int(beats * 10)) / 10.0
  fmt.Printf("@%g\n", trunc)
}
