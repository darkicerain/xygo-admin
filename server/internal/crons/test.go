package crons

import (
	"context"
	"fmt"
	"strings"
	"time"

	cronlib "xygo/internal/library/cron"
)

func init() {
	cronlib.Register(&TestTask{})
}

// TestTask 测试任务：用于验证定时任务功能
type TestTask struct{}

func (t *TestTask) GetName() string { return "test" }

func (t *TestTask) Execute(ctx context.Context, params []string) (string, error) {
	msg := "hello from test task"
	if len(params) > 0 {
		msg = strings.Join(params, ", ")
	}
	output := fmt.Sprintf("[%s] %s", time.Now().Format("2006-01-02 15:04:05"), msg)
	return output, nil
}
