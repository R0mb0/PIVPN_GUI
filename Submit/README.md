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

  L'ultimo aggiornamento all'applicazione prevede che ad ogni operazione dell'utente, lo stato del database viene scritto sul disco 
  
</details>

<details>
  <summary>

  #### Gestione della interazione con la shell
    
  </summary>

Siccome "PIVPN" necessita delle riga di comando per essere amministrata, la sfida è stata quella di far in modo che l'applicazione potesse lanciare dei comandi da terminale, con il problema aggiuntivo che i comandi devono avere privilegi "sudo".
La procedura generale (secondo la documentazione di "Dart") per ottenere questo risultato è sufficiente usare la sintassi per lanciare i comandi da terminale senza particolare privilegi, disabilitando a livello di sistema la necessità di quei comandi di eseguire come "sudo".  
Pensando alla diffusione del software, non si è voluto intraprendere questa strada per la risoluzione del problema, ma si è preferito sviluppare la propria soluzione.  
Il paradigma pervede che l'applicazione richiami degli script (impostati precedentemente come eseguibili) in formato ".sh" e che quest'ultimi richiamino i privilegi "sudo". 

##### Sviluppo degli script 

Tutto gli script per funzionare necessitano di un file `password.sh` che al momento dell'installazione dell'applicazione deve essere creato dall'utente.   
Esempio del file: 

```shell
#!/bin/bash
PASSWORD = "your_sudo_password"
```

A questo punto la guida d'installazione dell'applicazione menziona l'esecuzione di uno script che rende eseguibili tutti gli script necessari per il corretto funzionamento dell'applicazione, qui di seguito riportato per la spiegazione. 

```shell
#!/bin/bash

# List of scripts to make executable
scripts=(
  "addUser.sh"
  "disableUser.sh"
  "enableUser.sh"
  "listUsers.sh"
  "removeUser.sh"
  "update.sh"
)

# Loop through each script and make it executable
for script in "${scripts[@]}"; do
  if [ -f "$script" ]; then
    chmod +x "$script"
    echo "Made $script executable."
  else
    echo "File $script does not exist."
  fi
done
```
Il funzionamento dello script è che data una lista con tutti i file da rendere eseguibili (nella stessa cartella dello script), si cicla la lista verificando l'esistenza dei file inseriti e solo dopo vengono modificate le proprietà di esecuzione 

Esempio di uno script eseguito dall'applicazione: 

```shell
#!/bin/bash

source ./password.sh

# Check if a parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <parameter>"
  exit 1
fi

# Use the parameter
param=$1
echo ${PASSWORD} | sudo -S pivpn -a -n $param

gnome-terminal -- bash -c "echo $param | sudo -S pivpn -qr; exec bash"

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Command executed successfully."
else
  echo "Command failed."
  exit 1
fi
```

Questo script ha la funzione di aggiungere un utente alla VPN, il suo funzionamento può essere spiegato facilmente dividendolo in tre parti, dove nella prima parte viene controllato se l'applicazione ha passato un argomento, se si, viene lanciato il comando per aggiungere l'utente alla VPN e viene aperto il pannello con il qr-code di collegamento con il comando immediatamente successivo. L'ultima parte controlla se ci sono stati errori e riporta il risultato lanciando un "echo" che poi verrà raccolto proprio dalla funzione di "Dart" utilizzata per lanciare i comandi del terminale.
  
</details>

<details>
  <summary>

  #### La gestione del thread 
    
  </summary>

  Nell'applicazione viene lanciato un thred separato rispetto al thread principale, in modo che possa esistere una parte di codice che finché rimane aperta l'applicazione esegue un ciclo "While true" con una pasua di circa 24 ore, per controllare di gionro in gionro lo stato di tutti gli utenti registrati dall'operatore e nel caso in cui per qualcuno è stata superata la data di fine servizio, ques'ultimo verrà disabilitato in automatico. 

  ##### La classe del thread

```dart
class ThreadManager {
  bool _isRunning = false;
  Isolate? _isolate;
  ReceivePort? _receivePort;
  late StreamSubscription _subscription;

  void startThread(Function updateTable) {
    if (_isRunning) return;
    _isRunning = true;
    _receivePort = ReceivePort();
    _subscription = _receivePort!.listen((message) {
      if (message == 'update') {
        updateTable();
      }
    });
    Isolate.spawn(_threadEntry, _receivePort!.sendPort);
  }

  void stopThread() {
    if (!_isRunning) return;
    _isRunning = false;
    _isolate?.kill(priority: Isolate.immediate);
    _subscription.cancel();
    _receivePort?.close();
  }

  static void _threadEntry(SendPort sendPort) async {
    // My field to work 
    Mediator mediator = Mediator();

    bool isRunning = true;
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    bool isSomethingChanged = false;

    receivePort.listen((message) {
      if (message == 'stop') {
        isRunning = false;
        receivePort.close();
      }
    });

    while (isRunning) {
      mediator.GetAllUsers().forEach((value){
        if(value.isEnabled && DateTime.now().isAfter(value.endDate))
        {
          value.isEnabled = false; 
          isSomethingChanged = true;
        }
      });
      // write database only if necessary
      if(isSomethingChanged){
        mediator.SaveDatabase();
      }
      sendPort.send('update'); // Send update message to main isolate
      isSomethingChanged = false;
      await Future.delayed(Duration(seconds: 86400)); // delay for operations
    }
    print('Thread stopped.');
  }
}
```

Per il controllo del thread oltre ad usare una varaibile di stato, si usa un sistema di messaggi che in questo caso vengono inviati alla "porta del thread".   
Se il thread è stato invocato viene fatta una chiamata di sistema per metterlo in esecuzione (a questo punto il thread è già stato allocato a livello logico ma non è attivo) aggiornando successivamente lo stato dei messaggi. La medesima cosa viene fatta anche nel momento dell'interruzione del thread (che a livello logico rimarrà comunque allocato in memoria in attesa di ripartire).  
Al momento dell'esecuzione si eseguono i comando che sono dentro la funzione `_threadEntry()`, dove una volta aver ricontrollato lo stato del thread si procede ad avviare il ciclo "While true" che controlla lo stato degli utenti e se necessario li disabilita


  ##### Variabili del Thread

  ```dart
  // Fields to Manage Thread
  final ThreadManager _threadManager = ThreadManager();
  bool _isThreadRunning = false;
  ```

  ##### Funzioni per la gestione del thread

  ```dart
  void _startThread() {
    _threadManager.startThread(update_table);
    setState(() {
      _isThreadRunning = true;
    });
  }

  void _stopThread() {
    _threadManager.stopThread();
    setState(() {
      _isThreadRunning = false;
    });
  }
  ```

Queste funzioni vengoni usate dalla classe principale "main" per controllare il thread durante il flusso dell'applicazione, dove in questo caso specifico l'applicazione esegue il trhead dopo che ha ripristinato lo stato della memoria e chiude l'esecuzione del trhed poco prima di chiudersi dopo aver ricevuto il corrispettivo comando dall'operatore.

##### Dove il thread viene lanciato

```dart
void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startThread(); //<------------------------------- Start thread to manage users
    load_database();
  }
```

##### Dove il thread viene terminato

```dart
void _onWindowClose() {
    _stopThread();
    //mediator.SaveDatabase(); //<--------------------------------------------------------------------------------------------------------------------------------
  }
```
  
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
