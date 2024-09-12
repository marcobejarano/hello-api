package main

import (
	"log"
	"net/http"

	"github.com/marcobejarano/hello-api/handlers/rest"
)

func main() {
	addr := ":8080"

	mux := http.NewServeMux()

	mux.HandleFunc("/hello", rest.TranslateHandler)

	log.Printf("Listening on %s\n", addr)

	log.Fatal(http.ListenAndServe(addr, mux))
}
