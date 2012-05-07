// time in ebeats
package main

import (
	"fmt"
	"time"
)

func main() {
	h, m, s := time.Now().UTC().Clock()
	fmt.Printf("@%.2f\n", 5*(60*(60*float64(h)+float64(m))+float64(s))/432)
}
