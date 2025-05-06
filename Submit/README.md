# **PDMIU** submit

<details>
  <summary>

  ## 👉 In italian
    
  </summary>

  <details>
  <summary>

  ### _A._ Nome e numero di matricola
    
  </summary>

  - Francesco Rombaldoni
  - Matricola: 330130
  
</details>

<details>
  <summary>

  ### _B._ Titolo del progetto
    
  </summary>

  - Il titolo del progetto è: **PIVPN**
  
</details>

<details>
  <summary>

  ### _C._ Breve panoramica dell'idea di progetto e delle principali caratteristiche dell´applicazione
    
  </summary>

  - L'idea di progetto è quella di realizzare un'applicazione in [Flutter](https://flutter.dev/) che faciliti l'interazione con la "VPN" [PIVPN](https://www.pivpn.io/) siccome quest'ultima è interagibile solo tramite "riga di comando" e d'implementare
    delle funzionalità aggiuntive come la possibilità di disattivare un utente dopo una certa data.
  - L'applicazione sviluppata permette tramite interfaccia grafica d'interagire con [PIVPN](https://www.pivpn.io/)  creando, eliminando, abilitando e disabilitando gli utenti, permette di associare ad ogni utente una data d'inizio e di fine disattivando in automatico gli utenti che hanno superato la propria data di utilizzo.

    <br>
    
    L'applicazione possiede al centro una tabella dove vedere tutti gli utenti inseriti e il loro stato. 
  
</details>

<details>
  <summary>

  ### _D._ Panoramica della esperienza utente
    
  </summary>

#### Primo avvio
 Dopo aver impostato l'ambiente (seguendo la guida presente nella pagina principale) si può aprire l'applicazione, a questo punto l'operatore può solo aggiungere dei nuovi utenti, per fare questa operazione deve completare i tre campi di input che sono presenti nella parte alta dell'interfaccia.
  
  <details>
    <summary>

  _Guarda l'immagine_

  </summary>

  ![Fields](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Fields.png)

  </details><br>
  
  Dove il nome può essere una qualsiasi stringa, mentre le date devono essere necessarimente inserite in standard americano (anno-mese-giorno).<br>
  
  ##### ⚠️ Avvertenze

  - Per creare un utente sempre abilitato è sufficiente aggiungere un utente con il campo "End Date" molto remoto (Ex 2050-01-01)
  - La "data di fine" inserita deve essere sempre successiva alla data dell'inserimento dell'utente.
  - Non si possono aggiungere due utenti con lo stesso nome. 

  Una volta aver completato i campi, l'operatore deve premere sul pulsante "Add User" per aggiungere l'utente alla VPN.

  <details>
  <summary>

  _Guarda l'immagine_

  </summary>

  ![Add_User](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Add_user.png)

  </details>

  A questo punto in una finestra separata si aprirà un qr-code necessario per connettere la VPN, che l'operatore dovrà passare a chi è interessato a connettersi.

  <details>
  <summary>

  _Guarda l'immagine_

  </summary>

  ![qr-code](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/qr-code.png)

  </details>

  Ogni volta che l'operatore esegue una operazione, i cambiamenti dello stato della memoria vengono salvati in automatico, anche per fare in modo che vi sia consistenza tra le informazioni di "PIVPN" e dell'interfaccia grafica.
  <br>
  Come si sarà sicuramente notato la tebella al centro dell'applicazione avrà acquisito un valore.

  <details>
    <summary>

  _Guarda l'immagine_

  </summary>

  ![Table_with_record](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Table_with_record.png)

  </details>

  A questo punto, l'operatore può scegliere se aggiungere un nuovo utente (seguendo le istruzioni precedenti) oppure di eseguire le ultime tre operazionni riportate dall'interfaccia.

  <details>
    <summary>

  _Guarda l'immagine_

  </summary>

  ![Buttons](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Buttons.png)

  </details>

  In questo caso, per queste ultime operazioni è necessario inserire nel campo apposito il nome dell'utente bersaglio (reperibile dalla tabella al centro) <br>

  ##### ⚠️ Avvertenze
  
  - Non si può abilitare un utente che è stato disabilitato perché è stata superata la propria data di fine servizio
  - Un utente per essere rigenerato dev'essere eliminato e riaggiunto con le date aggiornate

  Una volta che l'operatore ha terminato le operazioni,l'applicazione non deve essere chiusa in modo che il secondo thread all'interno del programma possa controllare una volta al giorno lo stato degli utenti. Nel caso in cui l'applicazione venisse chiusa, il controllo automatico non potrà essere effetuato e finchè il computer rimane acceso la VPN continuerà a funzionare. 

</details>

<details>
  <summary>

  ### _E._ Discussione della tecnologia
    
  </summary>

  <details>
  <summary>

  #### Librerie utilizzate nel progetto
    
  </summary>

- `package:flutter/material.dart` -> Libreria di default
- `dart:async` -> Libreria per la gestione dei thread
- `dart:isolate` -> Libreria per la gestione dei thread
- `dart:io` -> Libreria per interagire con i file di sistema
- `package:process_run/shell.dart` -> Libreria per interagire con la shell
- `dart:ffi` -> Libreria per allocare la memoria, utilizzata per allocare il thread
  
</details>

<details>
  <summary>

  #### La costruzione del database 
    
  </summary>

  Per salvare le informazioni degli utenti l'applicazione possiede una classe chiamata "database" che salva le informazioni in un "dizionario" che viene serializzato o deserializzato per il salvataggio delle informazioni sul disco. 

  ##### Struttura logica del dizionario

  ``` mermaid
  ---
 title: Logic structure of dictionary
 ---
 classDiagram

Dictionary <|-- User

class Dictionary{
  key: Name
  Value: User
}

class User{
        String name
        Date startDate
        Date endDate
        Boolean isEnabled 
    }
  ```

Il parametro `name` si ripete in questa struttura siccome è una chiave ma allo stesso tempo viene tenuto in memoria dentro la classe user, il motivo di questa condizione è per facilitare la serializzazione che è stata scritta a mano.

##### Processo di serializzazione

La serializzaione viene fatta scrivendo su file una riga fatta in questo modo per ogni utente: 

```
_key_ _name_ _startDate_ _endDate_ _isEnabled_
```

Per distinguere i vari parametri al momento della lettura si trasforma la riga in una lista utilizzando lo spazio come carattere di divisione e a quel punto ad ogni posizione degli elementi nella lista corrisponde un valore utile. Siccome la tasformazione dei parametri `starDate` e `endDate` in stringa comporta anche la stampa dell'orario, la stringa risultante è di questo tipo: 

```
Rombo Rombo 2025-10-01 00:00:00 2025-10-21 00:00:00 true
```

I valori utili sono quindi: 

```
[0] [1] [2] [4] [6]
```
  
</details>

<details>
  <summary>

  #### Gestione della interazione con la shell
    
  </summary>

  
  
</details>

<details>
  <summary>

  #### La gestione del thread 
    
  </summary>

  
  
</details>
  
</details>
  
</details>



-----------------------------------------------------------------------------

<details>
  <summary>

  ## 👉 In english
    
  </summary>
</details>

-----------------------------------------------------------------------------


<details>
  <summary>

  ### 
    
  </summary>

  
  
</details>
