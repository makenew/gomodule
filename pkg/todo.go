package pkg

import (
	"fmt"
	"github.com/makenew/gomodule/v1/internal"
)

func PrintMessage() {
	fmt.Println(internal.Message)
}

func GetMessage() string {
	return internal.Message
}
