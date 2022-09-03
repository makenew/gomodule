package gomodule

import (
	"testing"
)

func TestGetMessage(t *testing.T) {
	got := GetMessage()
	if got != "TODO" {
		t.Errorf("GetMessage() = %v; want TODO", got)
	}
}
