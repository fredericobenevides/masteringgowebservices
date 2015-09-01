package main

import (
	"encoding/csv"
	"fmt"
	"launchpad.net/goyaml"
	"net/http"
)

type User struct {
	Name  string `json:"name"`
	Email string `json:"email"`
	ID    int    `json:"int"`
}

func userRouter(w http.ResponseWriter, r *http.Request) {
	ourUser := User{}
	ourUser.Name = "Bill Smith"
	ourUser.Email = "bill.smith@example.com"
	ourUser.ID = 100

	output, _ := csv.Marshal(&ourUser)
	fmt.Fprintln(w, string(output))
}

func main() {
	fmt.Println("Starting CSV server")
	http.HandleFunc("/user", userRouter)
	http.ListenAndServe(":8080", nil)
}
