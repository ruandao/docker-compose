package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"time"
)

func main() {
	t := time.Now()
	http.HandleFunc("/hello", func(writer http.ResponseWriter, request *http.Request) {
		io.WriteString(writer, "write 30s\n")
		time.Sleep(30 * time.Second)
		io.WriteString(writer, fmt.Sprintf("start time: %s", t.Format("2006-01-02 15:04:05")))
		io.WriteString(writer, "\nhello world")
	})
	log.Println("hello world")
	log.Println(http.ListenAndServe(":80", nil))
}
