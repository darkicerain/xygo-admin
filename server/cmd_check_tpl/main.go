package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"text/template"
)

func main() {
	funcs := template.FuncMap{
		"lcFirst": func(s string) string { return s },
		"snakeCase": func(s string) string { return s },
		"kebabCase": func(s string) string { return s },
		"pascalCase": func(s string) string { return s },
		"trimIdSuffix": func(s string) string { return s },
		"contains": strings.Contains,
		"jsValue": func(s string) string { return s },
	}
	dir := "resource/generate/default"
	entries, _ := os.ReadDir(dir)
	hasErr := false
	for _, e := range entries {
		if !strings.HasSuffix(e.Name(), ".tpl") { continue }
		data, err := os.ReadFile(filepath.Join(dir, e.Name()))
		if err != nil { fmt.Printf("READ ERR  %s: %v\n", e.Name(), err); hasErr = true; continue }
		_, err = template.New(e.Name()).Funcs(funcs).Parse(string(data))
		if err != nil { fmt.Printf("PARSE ERR %s: %v\n", e.Name(), err); hasErr = true } else { fmt.Printf("OK        %s\n", e.Name()) }
	}
	if hasErr { os.Exit(1) }
}
