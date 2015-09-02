package main

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
	"net/http"
)

var Routes *mux.Router

func Init() {
	Routes = mux.newRouter()
	Routes.HandleFunc("/api/users", UsersInfo).Methods("OPTIONS")
}

func UsersInfo(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Allow", "DELETE, GET HEAD, OPTIONS, POST, PUT")
}

func main() {
	fmt.Println("Iniciando o servidor")
	http.Handle("/", Routes)
	http.ListenAndServe(":8080", nil)
}
