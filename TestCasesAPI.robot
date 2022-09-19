*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/
Resource        ResourceAPI.robot
Suite Setup     conectar a minha API

*** Test Cases ***
Buscar listagem de todos os livros (Get em todos os livros)
   Requisitar todos os livros 
 #  Conferir status code  200
#    Conferir o reason   ok
#    Conferir se retorna uma lista com "200" livros



