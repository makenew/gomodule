package gomodule

import (
	"fmt"

	"github.com/makenew/gomodule/internal/todo"
)

func PrintMessage() {
	fmt.Println(todo.GetMessage())
}
