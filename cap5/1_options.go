package main

import (
	"encoding/json"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
	"net/http"
)

var Routes *mux.Router

type User struct {
	name string "json:name"
}

func Init() {
	Routes = mux.NewRouter()
	// Routes.HandleFunc("/api/users", UsersInfo).Methods("OPTIONS")
	Routes.HandleFunc("/api/test", Teste).Methods("GET")
}

func UsersInfo(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Allow", "DELETE, GET HEAD, OPTIONS, POST, PUT")
}

func Teste(w http.ResponseWriter, r *http.Request) {
	u := User{}
	u.name = "Frederico"
	output, err := json.Marshal(u)
	if err != nil {
		fmt.Println("Something went wrong!")
	}
	fmt.Fprintln(w, output)
}

func main() {
	fmt.Println("Iniciando o servidor")
	http.Handle("/", Routes)
	http.ListenAndServe(":8080", nil)
}
