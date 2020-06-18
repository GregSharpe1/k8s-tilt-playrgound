package main

import (
	"fmt"
	"time"
)

func main() {
	go forever()
	select {} // block forever
}

func forever() {
	for {
		fmt.Printf("Hiya %v+\n", time.Now())
		time.Sleep(time.Second)
	}
}
