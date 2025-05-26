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

  - L'idea del progetto è quella di realizzare un'applicazione in [Flutter](https://flutter.dev/) che faciliti l'interazione con la "VPN" [PIVPN](https://www.pivpn.io/), poiché quest'ultima è attualmente utilizzabile solo tramite "riga di comando". Inoltre, si intende implementare funzionalità aggiuntive, come la possibilità di disattivare un utente dopo una determinata data.
  
- L'applicazione sviluppata permette, tramite un'interfaccia grafica, di interagire con [PIVPN](https://www.pivpn.io/) per creare, eliminare, abilitare e disabilitare utenti. Consente, inoltre, di associare a ogni utente una data di inizio e una data di fine, disattivando automaticamente gli utenti che hanno superato il periodo di utilizzo consentito.

<br>

L'applicazione presenta al centro una tabella che consente di visualizzare tutti gli utenti registrati e il loro stato.
  
</details>

<details>
  <summary>

  ### _D._ Panoramica della esperienza utente
    
  </summary>

#### Primo avvio

Dopo aver configurato l'ambiente (seguendo la guida presente nella pagina principale), si può aprire l'applicazione. A questo punto, l'operatore può solo aggiungere nuovi utenti. Per fare questa operazione, deve completare i tre campi di input presenti nella parte superiore dell'interfaccia.

<details>
<summary>

_Guarda l'immagine_

</summary>

![Fields](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Fields.png)

</details><br>

Il nome può essere una qualsiasi stringa senza spazi, mentre le date devono essere necessariamente inserite nel formato standard ISO (anno-mese-giorno).<br>

##### ⚠️ Avvertenze

- Per creare un utente sempre abilitato, è sufficiente aggiungere un utente con il campo "End Date" impostato su una data molto remota (es. 2050-01-01).
- La "data di fine" inserita deve essere sempre successiva alla data di inserimento dell'utente.
- Non si possono aggiungere due utenti con lo stesso nome.

Una volta completati i campi, l'operatore deve premere sul pulsante "Add User" per aggiungere l'utente alla VPN.

<details>
<summary>

_Guarda l'immagine_

</summary>

![Add_User](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Add_user.png)

</details>

A questo punto, si aprirà una finestra separata contenente un QR code necessario per connettere la VPN, che l'operatore dovrà condividere con chi desidera connettersi.

<details>
<summary>

_Guarda l'immagine_

</summary>

![qr-code](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/qr-code.png)

</details>

Ogni volta che l'operatore esegue un'operazione, i cambiamenti dello stato della memoria vengono salvati automaticamente, garantendo la consistenza tra le informazioni di "PIVPN" e dell'interfaccia grafica.<br>
Come si sarà sicuramente notato, la tabella al centro dell'applicazione avrà acquisito un nuovo valore.

<details>
<summary>

_Guarda l'immagine_

</summary>

![Table_with_record](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Table_with_record.png)

</details>

A questo punto, l'operatore può scegliere se aggiungere un nuovo utente (seguendo le istruzioni precedenti) oppure eseguire le altre tre operazioni riportate dall'interfaccia.

<details>
<summary>

_Guarda l'immagine_

</summary>

![Buttons](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Buttons.png)

</details>

Per queste ultime operazioni, è necessario inserire nel campo apposito il nome dell'utente bersaglio (reperibile dalla tabella al centro).<br>

##### ⚠️ Avvertenze

- Non si può abilitare un utente che è stato disabilitato perché è stata superata la propria data di fine servizio.
- Per rigenerare un utente, è necessario eliminarlo e aggiungerlo nuovamente con le date aggiornate.

Una volta terminate le operazioni, l'applicazione non deve essere chiusa. Questo permette al secondo thread del programma di controllare, una volta al giorno, lo stato degli utenti. Nel caso in cui l'applicazione venisse chiusa, il controllo automatico non sarà eseguito, ma finché il computer rimane acceso, la VPN continuerà a funzionare.

##### Avvio successivo al primo

Se l'applicazione viene chiusa dopo il primo avvio e successivamente riaperta, l'operatore troverà lo stato dell'applicazione identico a com'era prima della chiusura, consentendo di operare normalmente.

</details>

<details>
  <summary>

  ### _E._ Discussione della tecnologia
    
  </summary>

  <details>
  <summary>

  #### Librerie utilizzate nel progetto
    
  </summary>

- `package:flutter/material.dart` -> Libreria di default, **Non necessita di commento**
- `dart:async` -> Libreria per la gestione dei thread, **Non necessita di commento**
- `dart:isolate` -> Libreria per la gestione dei thread, **Non necessita di commento**
- `dart:io` -> Libreria per interagire con i file di sistema, **Non necessita di commento**
- `package:process_run/shell.dart` -> Libreria per interagire con la shell <br> <details> <summary> **Commento** </summary>

	##### Librerie disponibili (in alternatova)

	- `dart:io` con i comandi:
 		- Process.start
   		- Process.run <br><br>
        **Esempio** <br>
	
        ```dart
        import 'dart:io';

		void main() async {
		  var result = await Process.run('ls', ['-l']);
		  print(result.stdout);
		}
        ```
        - `package:process_runner/process_runner.dart` <br><br>
	**Esempio** <br>
 	```dart
  	import 'package:process_runner/process_runner.dart';

	Future<void> main() async {
	  ProcessRunner processRunner = ProcessRunner();
	  ProcessRunnerResult result = await processRunner.runProcess(['ls']);
	
	  print('stdout: ${result.stdout}');
	  print('stderr: ${result.stderr}');
	}
  	```
	Tra le tre alternative possibili, è stata scelta la libreria `shell.dart` poichè è la libreria più stabile per linux per lanciare i comandi da terminale

  </details>
- `dart:ffi` -> Libreria per allocare la memoria, utilizzata per allocare il thread, **Non necessita di commento**
  
</details>
<details>
  <summary>
	  
  #### I widget rilevanti utilizzati
  
  </summary>

<details>
<summary>

##### `main.dart`

</summary>

- **MaterialApp**  
  **Descrizione:**  
  Un widget che avvolge l’intera applicazione e fornisce la configurazione di base per il Material Design, inclusi tema, routing e localizzazione.

- **Scaffold**  
  **Descrizione:**  
  Fornisce una struttura base di layout per le app Material Design. Include aree per AppBar, Drawer, Body, FloatingActionButton, BottomNavigationBar, ecc.

- **SafeArea**  
  **Descrizione:**  
  Inserisce il proprio child in un’area sicura del display, evitando le aree di notifica, notch o bordi curvi del dispositivo.

- **Column**  
  **Descrizione:**  
  Dispone i widget figli in una colonna verticale.

- **Row**  
  **Descrizione:**  
  Dispone i widget figli in una riga orizzontale.

- **SizedBox**  
  **Descrizione:**  
  Un widget con dimensioni fisse specificate, utile per spaziature o per forzare una certa dimensione.

- **VerticalDivider**  
  **Descrizione:**  
  Disegna una linea verticale, tipicamente usata per separare visivamente contenuti in una Row.

- **Text**  
  **Descrizione:**  
  Visualizza una stringa di testo con uno stile singolo.

- **Container**  
  **Descrizione:**  
  Un widget versatile per layout, decorazioni, padding, margini e restrizioni di dimensione.

- **TextFormField**  
  **Descrizione:**  
  Un campo di input di testo che integra la gestione delle validazioni e dei form.

- **InputDecoration**, **OutlineInputBorder**, **BorderSide**  
  **Descrizione:**  
  Widget di configurazione per la personalizzazione dell’aspetto dei campi di input, come bordi, colori, hint ecc.

- **TextButton**  
  **Descrizione:**  
  Un pulsante testuale che attiva una funzione quando viene premuto.

- **ButtonStyle**, **MaterialStateProperty**  
  **Descrizione:**  
  Permettono di definire lo stile e il comportamento dei pulsanti in base agli stati (pressed, hovered, ecc.).

- **Divider**  
  **Descrizione:**  
  Disegna una linea orizzontale, utile per separare visivamente sezioni verticali.

- **Expanded**  
  **Descrizione:**  
  Un widget che espande un child di una Row, Column o Flex per occupare lo spazio disponibile.

- **SingleChildScrollView**  
  **Descrizione:**  
  Permette lo scrolling del suo child se lo spazio è insufficiente, supportando sia lo scroll verticale che orizzontale.

- **DataTable**  
  **Descrizione:**  
  Visualizza dati in una tabella con righe e colonne, supportando ordinamento e scrolling.

- **DataColumn**, **DataRow**  
  **Descrizione:**  
  Rappresentano colonne e righe di una DataTable.

- **GestureDetector**  
  **Descrizione:**  
  Cattura e gestisce i gesti dell’utente (tap, drag, ecc.) sul widget child.

</details>

<details>
<summary>

##### `Database.dart`
 
</summary>

- **DataRow**  
  **Descrizione:**  
  Rappresenta una singola riga all’interno di una DataTable, composta da una serie di celle (DataCell).

- **DataCell**  
  **Descrizione:**  
  Una cella che contiene un widget (tipicamente un Text) da visualizzare in una riga della DataTable.

- **Text**  
  **Descrizione:**  
  Visualizza una stringa di testo con uno stile singolo.

</details>

<details>
<summary>

##### `Mediator.dart`

</summary>

- **DataRow**  
  **Descrizione:**  
  Rappresenta una singola riga all’interno di una `DataTable`. Ogni `DataRow` contiene una lista di celle (`DataCell`) che visualizzano dati tabellari. È utilizzato per strutturare informazioni in formato tabellare, come ad esempio elenchi di utenti, prodotti o risultati.

</details>
  
</details>

<details>
<summary>

#### Gestione dello stato 
 
</summary>

##### Utilizzo delle librerie `Provider` e `Riverpod`

Il progetto non possiede una complessità tale da giustificare l'uso delle librerie Provider e Riverpod a livello di interfaccia grafica, dal momento che gli unici elementi (stateless) presenti sono: scritte, pulsanti, campi di testo e, al centro, una tabella.

</details>

<details>
  <summary>

#### La costruzione del database

Per salvare le informazioni degli utenti, l'applicazione utilizza una classe chiamata "Database" che salva i dati in un "dizionario". Questo dizionario viene serializzato e deserializzato per consentire il salvataggio delle informazioni sul disco.

##### Struttura logica del dizionario

```mermaid
---
title: Logic structure of dictionary
---
classDiagram

Dictionary <|-- User

class Dictionary {
  key: Name
  Value: User
}

class User {
  String name
  Date startDate
  Date endDate
  Boolean isEnabled 
}
```

Il parametro `name` si ripete in questa struttura poiché è sia una chiave del dizionario sia un attributo memorizzato all'interno della classe `User`. Questa scelta è stata fatta per semplificare il processo di serializzazione dato che la chiave del dizionario è anche la chiave su "PIVPN", questa soluzione permette di tenere aggregati i dati di due "dastabase".

##### Processo di serializzazione

La serializzazione viene effettuata scrivendo su file una riga per ogni utente, strutturata nel seguente modo:

```
_key_ _name_ _startDate_ _endDate_ _isEnabled_
```

Per distinguere i vari parametri durante la lettura, la riga viene convertita in una lista utilizzando lo spazio come delimitatore. A ogni posizione degli elementi nella lista corrisponde un valore utile. Poiché la conversione dei parametri `startDate` e `endDate` in stringa include anche l'orario, la stringa risultante assume il seguente formato:

```
Rombo Rombo 2025-10-01 00:00:00 2025-10-21 00:00:00 true
```

I valori utili, quindi, sono indicati dalle seguenti posizioni:

```
[0] [1] [2] [4] [6]
```

L'ultimo aggiornamento dell'applicazione prevede che, a ogni operazione eseguita dall'utente, lo stato del database venga immediatamente scritto sul disco.
  
</details>

<details>
  <summary>

  #### Gestione della interazione con la shell
    
  </summary>
Siccome "PIVPN" richiede l'utilizzo della riga di comando per essere amministrata, la sfida è stata quella di fare in modo che l'applicazione potesse eseguire comandi da terminale, con il problema aggiuntivo che questi comandi necessitano di privilegi "sudo".  
Secondo la documentazione di "Dart", per ottenere questo risultato sarebbe sufficiente utilizzare la sintassi per lanciare comandi da terminale senza particolari privilegi, disabilitando a livello di sistema la necessità di eseguirli come "sudo".  
Tuttavia, considerando la diffusione del software, non si è voluto seguire questa strada poiché molto macchinosa. Si è preferito invece sviluppare una soluzione personalizzata.  
Il paradigma scelto prevede che l'applicazione richiami degli script (precedentemente impostati come eseguibili) in formato `.sh`, i quali a loro volta richiedono i privilegi "sudo".

##### Sviluppo degli script

Per funzionare correttamente, tutti gli script necessitano di un file `password.sh`, che deve essere creato dall'utente al momento dell'installazione dell'applicazione.  
Esempio del file:

```shell
#!/bin/bash
PASSWORD="your_sudo_password"
```

Una volta creato il file, la guida d'installazione dell'applicazione prevede l'esecuzione di uno script che rende eseguibili tutti gli script necessari per il corretto funzionamento dell'applicazione. Di seguito è riportato un esempio dello script:

```shell
#!/bin/bash

# Elenco degli script da rendere eseguibili
scripts=(
  "addUser.sh"
  "disableUser.sh"
  "enableUser.sh"
  "listUsers.sh"
  "removeUser.sh"
  "update.sh"
)

# Ciclo per rendere eseguibili i file
for script in "${scripts[@]}"; do
  if [ -f "$script" ]; then
    chmod +x "$script"
    echo "Reso $script eseguibile."
  else
    echo "Il file $script non esiste."
  fi
done
```

Questo script, dato un elenco di file nella stessa cartella, verifica l'esistenza di ciascun file e successivamente ne modifica le proprietà per renderli eseguibili.

##### Esempio di uno script eseguito dall'applicazione

Ecco un esempio di script utilizzato dall'applicazione:

```shell
#!/bin/bash

source ./password.sh

# Controlla se è stato fornito un parametro
if [ -z "$1" ]; then
  echo "Uso: $0 <parametro>"
  exit 1
fi

# Usa il parametro
param=$1
echo ${PASSWORD} | sudo -S pivpn -a -n $param

gnome-terminal -- bash -c "echo $param | sudo -S pivpn -qr; exec bash"

# Verifica se il comando è stato eseguito correttamente
if [ $? -eq 0 ]; then
  echo "Comando eseguito con successo."
else
  echo "Comando fallito."
  exit 1
fi
```

Questo script ha la funzione di aggiungere un utente alla VPN. Il suo funzionamento può essere spiegato suddividendolo in tre parti:  
1. **Controllo dell'argomento**: verifica se l'applicazione ha passato un argomento; in caso contrario, esce con un messaggio di errore.  
2. **Esecuzione del comando**: se l'argomento è presente, lo script lancia il comando per aggiungere l'utente alla VPN, seguito dal comando per aprire la finestra con il QR code necessario per il collegamento.  
3. **Verifica del risultato**: controlla se il comando è stato eseguito correttamente, restituendo un messaggio di successo o di errore. Il risultato viene riportato tramite un `echo`, che sarà raccolto dalla funzione di "Dart" utilizzata per eseguire i comandi da terminale.
  
</details>

<details>
  <summary>

  #### La gestione del thread 
    
  </summary>

  Nell'applicazione viene lanciato un thread separato rispetto al thread principale, in modo da eseguire una parte di codice che, finché l'applicazione rimane aperta, esegue un ciclo "while true" con una pausa di circa 24 ore. Questo thread controlla giornalmente lo stato di tutti gli utenti registrati dall'operatore. Nel caso in cui per un utente sia stata superata la data di fine servizio, quest'ultimo viene automaticamente disabilitato.

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
		// Campo per il lavoro
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
			mediator.GetAllUsers().forEach((value) {
				if (value.isEnabled && DateTime.now().isAfter(value.endDate)) {
					value.isEnabled = false;
					isSomethingChanged = true;
				}
			});
			// Salva il database solo se necessario
			if (isSomethingChanged) {
				mediator.SaveDatabase();
			}
			sendPort.send('update'); // Invia un messaggio di aggiornamento all'isolato principale
			isSomethingChanged = false;
			await Future.delayed(Duration(seconds: 86400)); // Ritardo di 24 ore
		}
		print('Thread fermato.');
	}
}
```

Per il controllo del thread, oltre all'utilizzo di una variabile di stato, viene usato un sistema di messaggi inviati alla "porta del thread".  
Quando il thread viene avviato, viene effettuata una chiamata di sistema per metterlo in esecuzione (prima di questo punto il thread è già allocato logicamente ma non è attivo), e successivamente viene aggiornato lo stato dei messaggi. Lo stesso processo viene eseguito al momento dell'interruzione del thread (che rimane comunque allocato in memoria, in attesa di essere riavviato).  
Durante l'esecuzione, il thread segue le istruzioni contenute nella funzione `_threadEntry()`. Dopo aver verificato lo stato del thread, avvia un ciclo "while true" che controlla lo stato degli utenti e, se necessario, li disabilita.

##### Variabili del thread

```dart
// Variabili per la gestione del thread
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

Queste funzioni vengono utilizzate dalla classe principale `main` per gestire il thread durante il flusso dell'applicazione. In questo caso specifico, l'applicazione avvia il thread dopo aver ripristinato lo stato della memoria e lo interrompe poco prima di chiudersi, a seguito del comando corrispondente ricevuto dall'operatore.

##### Dove il thread viene avviato

```dart
void initState() {
	super.initState();
	WidgetsBinding.instance.addObserver(this);
	_startThread(); //<------------------------------- Avvia il thread per gestire gli utenti
	load_database();
}
```

##### Dove il thread viene terminato

```dart
void _onWindowClose() {
	_stopThread();
	//mediator.SaveDatabase(); //<------------------------------- Ferma the thread
}
```
  
</details>
  
</details>
  
</details>

<details>
  <summary>

  ## 👉 In english
    
  </summary>

<details>
  <summary>

  ### _A._ Name and student ID number
    
  </summary>

  - Francesco Rombaldoni
  - Matricola: 330130
  
</details>

<details>
<summary>

### _B._ Project Title

</summary>

- The project title is: **PIVPN**

</details>

<details>
  <summary>

  ### _C._ Short overview of the project idea and main features of the application 
    
  </summary>

  - The project idea is to develop a [Flutter](https://flutter.dev/) application to simplify interaction with the [PIVPN](https://www.pivpn.io/) "VPN", as currently, it can only be managed through the terminal. The application also introduces new functionalities, such as the automatic disabling of a user.
  - The application allows interaction with [PIVPN](https://www.pivpn.io/) through a user interface, enabling the creation, deletion, enabling, and disabling of users. It also allows linking each user to a "start-date" and an "end-date," automatically disabling users whose access period has expired.
    <br>
    The application features a central table where the operator can view the status of all users.
  
</details>

<details>
  <summary>

  ### _D._ User experience overview
    
  </summary>

#### First Launch

After setting the environment (following the guide on the project's main page), it is possible to launch the application. At this point, the operator can only add a new user. To perform this operation, the three input fields at the top of the application must be completed.

<details>
<summary>
	
_View the image_

</summary>

![Fields](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Fields.png)

</details><br>

The name can be any string, while the dates must be in American format (year-month-day).<br>

##### ⚠️ Warnings 

- To create an always-enabled user, it is necessary to set the "end-date" field to a very distant date (e.g., 2050-01-01).
- The "end-date" field must contain a date that is always later than the current date of the user's insertion.
- It is not possible to add two users with the same name.

After filling in the fields, the operator must click on the "Add User" button to add the user to the "VPN."

<details>
<summary>
	
_View the image_

</summary>

![Add_User](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Add_user.png)

</details>

At this point, a new window will open on the screen containing a QR code that must be shared with the user who wants to access the "VPN."

<details>
<summary>

_View the image_

</summary>

![qr-code](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/qr-code.png)

</details>

Every time the operator performs an operation, the changes will be saved in memory to ensure consistency between the application and the "VPN."  
As can be observed, the table in the middle of the application now has a new entry.

<details>
<summary>
	
_View the image_

</summary>

![Table_with_record](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Table_with_record.png)

</details>

Now the operator can choose to add a new user (following the instructions above) or perform the remaining operations displayed by the interface.

<details>
<summary>
	
_View the image_

</summary>

![Buttons](https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Buttons.png)

</details>

For these last operations, the operator must fill in the user name field (as shown in the table) to proceed.

##### ⚠️ Warnings 

- It is not possible to enable a user that has been disabled because their "end-date" has passed.
- To restore a user, they must be deleted and re-added with updated dates.

When the operator has finished their operations, the application must remain open to allow a second thread within the application to check the user status daily. If the application is closed, the "VPN" will continue to work as long as the computer remains on.

#### Subsequent Launch After the First

After the first launch, if the application is closed and reopened, it will restore the last memory state before closing, allowing normal operation.
  
</details>

<details>
  <summary>

  ### _E._ Technology Discussion
    
  </summary>

  <details>
  <summary>

  #### Libraries Used in the Project
    
  </summary>

- `package:flutter/material.dart` -> Default library, **No comment required**
- `dart:async` -> Library for thread management, **No comment required**
- `dart:isolate` -> Library for thread management, **No comment required**
- `dart:io` -> Library for interacting with system files, **No comment required**
- `package:process_run/shell.dart` -> Library for interacting with the shell <br> <details> <summary> **Commento** </summary>

  ##### Available Libraries (alternatives)

  - `dart:io` with the commands:
      - Process.start
      - Process.run <br><br>
        **Example** <br>
      
        ```dart
        import 'dart:io';

        void main() async {
	  var result = await Process.run('ls', ['-l']);
	  print(result.stdout);
        }
        ```
  - `package:process_runner/process_runner.dart` <br><br>
    **Example** <br>
    ```dart
    import 'package:process_runner/process_runner.dart';

    Future<void> main() async {
      ProcessRunner processRunner = ProcessRunner();
      ProcessRunnerResult result = await processRunner.runProcess(['ls']);

      print('stdout: ${result.stdout}');
      print('stderr: ${result.stderr}');
    }
  ```
  
  Among the three possible alternatives, the `shell.dart` library was chosen because it is the most stable library on Linux for executing terminal commands.

</details>
  
- `dart:ffi` -> Library for memory allocation, used to allocate the thread, **No comment required**
  
</details>

<details>
  <summary>
	  
  #### Relevant widgets used
  
  </summary>

<details>
<summary>

##### `main.dart`

</summary>

- **MaterialApp**  
  **Description:**  
  A widget that wraps the entire application and provides the basic configuration for Material Design, including theme, routing, and localization.

- **Scaffold**  
  **Description:**  
  Provides a basic layout structure for Material Design apps. Includes areas for AppBar, Drawer, Body, FloatingActionButton, BottomNavigationBar, etc.

- **SafeArea**  
  **Description:**  
  Inserts its child into a safe area of the display, avoiding notification areas, notches, or curved device edges.

- **Column**  
  **Description:**  
  Arranges child widgets in a vertical column.

- **Row**  
  **Description:**  
  Arranges child widgets in a horizontal row.

- **SizedBox**  
  **Description:**  
  A widget with specified fixed dimensions, useful for spacing or to enforce a certain size.

- **VerticalDivider**  
  **Description:**  
  Draws a vertical line, typically used to visually separate content in a Row.

- **Text**  
  **Description:**  
  Displays a single-style string of text.

- **Container**  
  **Description:**  
  A versatile widget for layout, decoration, padding, margins, and size constraints.

- **TextFormField**  
  **Description:**  
  A text input field that integrates validation and form management.

- **InputDecoration**, **OutlineInputBorder**, **BorderSide**  
  **Description:**  
  Configuration widgets for customizing the appearance of input fields, such as borders, colors, hints, etc.

- **TextButton**  
  **Description:**  
  A text button that triggers a function when pressed.

- **ButtonStyle**, **MaterialStateProperty**  
  **Description:**  
  Allow you to define the style and behavior of buttons based on their states (pressed, hovered, etc.).

- **Divider**  
  **Description:**  
  Draws a horizontal line, useful for visually separating vertical sections.

- **Expanded**  
  **Description:**  
  A widget that expands a child of a Row, Column, or Flex to fill the available space.

- **SingleChildScrollView**  
  **Description:**  
  Allows its child to scroll if there is insufficient space, supporting both vertical and horizontal scroll.

- **DataTable**  
  **Description:**  
  Displays data in a table with rows and columns, supporting sorting and scrolling.

- **DataColumn**, **DataRow**  
  **Description:**  
  Represent the columns and rows of a DataTable.

- **GestureDetector**  
  **Description:**  
  Captures and handles user gestures (tap, drag, etc.) on the child widget.

</details>

<details>
<summary>

##### `Database.dart`
 
</summary>

- **DataRow**  
  **Description:**  
  Represents a single row within a DataTable, composed of a series of cells (DataCell).

- **DataCell**  
  **Description:**  
  A cell that contains a widget (typically a Text) to display in a row of the DataTable.

- **Text**  
  **Description:**  
  Displays a single-style string of text.

</details>

<details>
<summary>

##### `Mediator.dart`

</summary>

- **DataRow**  
  **Description:**  
  Represents a single row within a `DataTable`. Each `DataRow` contains a list of cells (`DataCell`) that display tabular data. Used to structure information in tabular format, such as lists of users, products, or results.

</details>
  
</details>

<details>
<summary>

#### State management 
 
</summary>

##### Use of `Provider` and `Riverpod` libraries

The project does not have enough complexity to justify the use of the Provider and Riverpod libraries at the user interface level, since the only (stateless) elements present are: labels, buttons, text fields, and, in the center, a table.

</details>

<details>
  <summary>

  #### The database building
    
  </summary>

To save user information, the application uses a class named "Database" that stores it in a "dictionary." The dictionary is serialized and deserialized to save and load the information from the disk.

##### Dictionary structure

```mermaid
---
title: Logical structure of the dictionary
---
classDiagram

Dictionary <|-- User

class Dictionary {
  key: Name
  Value: User
}

class User {
  String name
  Date startDate
  Date endDate
  Boolean isEnabled 
}
```

The "name" parameter is duplicated in this structure to simplify the serialization process. Specifically, the "name" parameter appears inside the user information and also as the key of the dictionary. This is because the dictionary key also serves as a key for "PIVPN," allowing the information to be aggregated.

##### Serialization process 

The serialization process involves writing lines like the following into a file for every user:

```
_key_ _name_ _startDate_ _endDate_ _isEnabled_
```

To separate the parameters during file reading, each line is converted into a list using spaces as delimiters, so every piece of information has a fixed position in memory. The conversion of `start-date` and `end-date` to a string also includes the time, which is why the saved lines are in this format:

```
Rombo Rombo 2025-10-01 00:00:00 2025-10-21 00:00:00 true
```

The required values are located in the following positions:

```
[0] [1] [2] [4] [6]
```

The latest application update introduced a feature that ensures the memory status is saved to disk after every operator action.
  
</details>

<details>
  <summary>

  #### Shell interaction
    
  </summary>
"PIVPN" requires the terminal to be administered, but in this case, the commands must operate with "sudo" privileges. The challenge was to find a way to send these terminal commands.   
The "Dart" documentation suggests using the basic instructions to launch terminal commands and, if the commands require "sudo" privileges, to modify the system configuration to disable the "sudo" requirement.   
Considering the distribution of this software, I decided to develop an alternative solution because the suggested approach in "Dart" is too complex.  
The paradigm developed involves defining scripts for every necessary command. These scripts will be launched by the application as normal commands, and it will be the scripts themselves that execute the "PIVPN" commands with "sudo" privileges.

##### Script Development

To work correctly, every script requires a file called `password.sh`, which contains the sudo password. The creation of this file is explained in the application's guide on the main page.  
Example of the file: 

```shell
#!/bin/bash
PASSWORD="your_sudo_password"
```

After this step, the procedure requires executing a script that changes the execute permissions of all scripts inside the same directory.  
Example of the script: 

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

# Loop to make the files executable
for script in "${scripts[@]}"; do
  if [ -f "$script" ]; then
    chmod +x "$script"
    echo "Made $script executable."
  else
    echo "The file $script does not exist."
  fi
done
```

In this case, given a list of scripts in the same folder, it verifies the existence of the files and changes their execute permissions.

##### Example of a file actually executed by the application

Example of the file:

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

# Verify if the command was executed successfully
if [ $? -eq 0 ]; then
  echo "Command executed successfully."
else
  echo "Command failed."
  exit 1
fi
```

This script adds a new user to the "VPN." It can be explained by dividing the code into three parts:
1. **Argument Checking**: Verifies if the application has passed an argument; otherwise, it returns an error message.
2. **Command Execution**: If the argument is passed, the script launches the command to add a user to the "VPN," followed by the command to open a new window with the QR code for the VPN connection.
3. **Status Check**: Checks if the command was executed correctly and performs an "echo" of the status, which will be intercepted by the "Dart" function used to call the script.
  
</details>

<details>
  <summary>

  #### Thread managing
    
  </summary>

When the application starts, a thread (separate from the main thread) is launched to perform a "while true" loop with a 24-hour pause. As long as the application is running, the thread operates. This thread checks the status of all users daily, automatically disabling those whose service time has expired.

##### The thread class

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
		// Field for the work
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
			mediator.GetAllUsers().forEach((value) {
				if (value.isEnabled && DateTime.now().isAfter(value.endDate)) {
					value.isEnabled = false;
					isSomethingChanged = true;
				}
			});
			// Save the database only if necessary
			if (isSomethingChanged) {
				mediator.SaveDatabase();
			}
			sendPort.send('update'); // Send an update message to the main isolate
			isSomethingChanged = false;
			await Future.delayed(Duration(seconds: 86400)); // 24-hour delay
		}
		print('Thread stopped.');
	}
}
```

The thread is managed using a status variable and by sending messages to the "thread port."  
When the thread needs to start, a system call is performed to execute it (at this point, the thread is already in memory but not yet active in the system), and the message status is updated.  
The same process is performed when the thread needs to stop (the thread will remain in memory, waiting to be restarted).  
During its execution, the thread performs the actions inside the `_threadEntry()` function. After checking the thread's status, it starts a "while true" loop that checks the users' statuses and, if necessary, disables users whose connection time has expired.

##### Thread variables 

```dart
// Variables for thread management
final ThreadManager _threadManager = ThreadManager();
bool _isThreadRunning = false;
```

##### Functions to manage the thread

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

These functions are used inside the main class to manage the thread during the application's flow.  
In this case, the thread is started during the application's launch and is terminated when the application closes.

##### Where the thread is called 

```dart
void initState() {
	super.initState();
	WidgetsBinding.instance.addObserver(this);
	_startThread(); //<------------------------------- Start the thread to manage users
	load_database();
}
```

##### Where the thread is terminated

```dart
void _onWindowClose() {
	_stopThread(); //<------------------------------- Stop the thread
}
```
  
</details>
  
</details>

</details>
