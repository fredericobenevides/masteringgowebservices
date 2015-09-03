package main

import (
	"encoding/json"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
	"net/http"
)

type MethodPOST struct {
  POST EndPoint
}

type MethodGET struct {
  GET EndPoint
}

type MethodPUT struct {
  PUT EndPoint
}

type MethodOPTIONS struct {
  OPTIONSPoint
}

type EndPoint struct {

  Description string `json:"description"`
  Parameters []Parameter `json:"parameters"`
}

type Parameter struct {
  Name string "json:name"
  ParameterDetails Detail`json:"details"`
}

type Detail struct {
  Type string "json:type"
  Description string `json:"description"`
  Required bool "json:required"
}

var UserOPTIONS = MethodOPTIONS{ OPTIONS: EndPoint{ Descriiption: "This page" } }
var UserPostParameters = []Param{ {Name: "Email", ParameterDetails: Detail{Type:"string", Description: "A new user's email address", Required: false}} }

var UserPOST = MethodPOST{ POST: EndPoint{ Description: "Create a user", Parameters: UserPostParameters } }
var UserGET = MethodGET{ GET: EndPoint{ Description: "Access a user" } }

var Routes *mux.Router

func Init() {
	Routes = mux.NewRouter()
	# // Routes.HandleFunc("/api/users", UsersInfo).Methods("OPTIONS")
}

func UsersInfo(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Allow", "DELETE, GET HEAD, OPTIONS, POST, PUT")

  UserDocumentation := []DocMethod{}
  UserDocumentation = append(UserDocumentation, Documentation.UserPOST)
  UserDocumentation = append(UserDocumentation, Documentation.UserOPTIONS)
  output := SetFormat(UserDocumentation)
  fmt.FPrintln(w, string(output))
}


func main() {
	fmt.Println("Iniciando o servidor")
	http.Handle("/", Routes)
	http.ListenAndServe(":8080", nil)
}
