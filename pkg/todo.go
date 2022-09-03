package pkg

import (
	"fmt"
	"github.com/makenew/gomodule/internal"
)

func PrintMessage() {
	fmt.Println(internal.Message)
}

func GetMessage() string {
	return internal.Message
}
