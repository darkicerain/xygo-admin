// +----------------------------------------------------------------------
// | XYGo Admin 模板语法检查逻辑
// +----------------------------------------------------------------------
// | 用途：检查 resource/generate/default/ 下所有 .tpl 模板文件的语法是否正确
// +----------------------------------------------------------------------

package checktpl

import (
	"context"
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"text/template"
)

func Run(ctx context.Context) error {
	funcs := template.FuncMap{
		"lcFirst":      func(s string) string { return s },
		"snakeCase":    func(s string) string { return s },
		"kebabCase":    func(s string) string { return s },
		"pascalCase":   func(s string) string { return s },
		"trimIdSuffix": func(s string) string { return s },
		"contains":     strings.Contains,
		"jsValue":      func(s string) string { return s },
	}

	dir := "resource/generate/default"
	entries, err := os.ReadDir(dir)
	if err != nil {
		return err
	}

	hasErr := false
	for _, e := range entries {
		if !strings.HasSuffix(e.Name(), ".tpl") {
			continue
		}
		data, err := os.ReadFile(filepath.Join(dir, e.Name()))
		if err != nil {
			fmt.Printf("READ ERR  %s: %v\n", e.Name(), err)
			hasErr = true
			continue
		}
		_, err = template.New(e.Name()).Funcs(funcs).Parse(string(data))
		if err != nil {
			fmt.Printf("PARSE ERR %s: %v\n", e.Name(), err)
			hasErr = true
		} else {
			fmt.Printf("OK        %s\n", e.Name())
		}
	}
	if hasErr {
		return fmt.Errorf("template check failed")
	}
	return nil
}
