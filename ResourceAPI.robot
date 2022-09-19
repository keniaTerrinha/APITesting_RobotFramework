*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/
Library         RequestsLibrary
Library         Collections

*** Variables ***
${URL_API}     https://fakerestapi.azurewebsites.net/api



*** Keywords ***
####SETUP E TEAERDOWNS
conectar a minha API
  Create Session    fakeAPI    ${URL_API}

#### Ações
Requisitar todos os livros
  ${RESPOSTA}  Get Request    fakeAPI     Books
  Log         ${RESPOSTA.text}
  Set Test Variable    ${RESPOSTA} 

Conferir status code
  [Arguments]     ${STATUSCODE_DESEJADO}
  Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}
  
Conferir o reason
  [Arguments]    ${REASON_DESEJADO}
  Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_lIVROS}" livros
  Length Should Be    ${RESPOSTA.json()}    ${QTDE_LIVROS}