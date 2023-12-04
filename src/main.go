package main

import (
	"fmt"
	"html/template"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	fmt.Println("Program started.")
	router := mux.NewRouter()

	router.HandleFunc("/", RouteHome)
	http.ListenAndServe(":8080", router)
}

func RouteHome(res http.ResponseWriter, req *http.Request) {
	tmpl, err := template.ParseFiles("templates/home.html")
	if err != nil {
		http.Error(res, err.Error(), http.StatusInternalServerError)
		return
	}
	err = tmpl.Execute(res, "World!")
	if err != nil {
		http.Error(res, err.Error(), http.StatusInternalServerError)
		return
	}
}
