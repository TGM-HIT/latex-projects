\subsection{App-Version}
Es werden die Funktionen beschrieben, welche die App-Version des Produktes erfüllen soll. Diese werden grundsätzliche in Frontend und Backend unterteilt.
\subsubsection{Backend erstellen}
Das Backend umfasst alle Funktionen, welche vom Benutzer nicht gesehen werden können. Diese bearbeitet den Datentransfer, Datenaufbereitung und die Datensicherheit.
\begin{indentE}\mbox{}
	\paragraph{/LF2110/ Verbindung aufbauen}\mbox{}\\
	Es wird die Verbindung mit dem ausgewählten Empfänger aufgebaut. Dieser Verbindungsaufbau besteht aus einem verschlüsselten Handshake, mit welche die Systemdaten des Empfängers und Senders ausgetauscht werden. Wenn Empfänger und Sender den selben Verschlüsselungsschlüssel gewählt haben, sit der Handshake erfolgreich und der Transfer kann beginnen.
	\paragraph{/LF2130/ Daten transferieren}\mbox{}\\
	Die Daten werden in kleinen Paketen versandt, um die Datensicherheit zu garantieren. Dabei haben diese eine einheitliche Größe und es werden unterschiedliche viele je nach Datengröße versandt. Dabei sollen der Empfänger und der Sender um den Fortschritt der Übertragung aufgeklärt werden.
	\paragraph{/LF2140/ Daten komprimieren}\mbox{}\\
	Die Daten werden vor dem Versand verlustlos komprimiert, um die Datenmenge zu verkleinern. Die dabei gewählt Komprimierungsart, darf vom Auftragnehmer ausgewählt werden.
	\paragraph{/LF2150/ Datentransfer verschlüsseln}\mbox{}\\
	Der Datentransfer wird mit einem Verschlüsselungsschlüssel verschlüsselt, um die Datensicherheit zu erhöhen. Diese wird dann vom Empfänger wieder entschlüsselt. Die dafür benutzte Verschlüsselungsart, kann vom Auftraggeber ausgewählt werden.
	\paragraph{/LF2160/ Benutzereinstellungen integrieren}\mbox{}\\
	Die vom Benutzer ausgewählten Benutzereinstellungen müssen in das Backend integrierte werden, um den Nutzen aus diesen Werten zu ziehen.
\end{indentE}
\subsubsection{Frontend erstellen}
Zu dem Frontend des Produktes gehören alle Elemente, auf welche der Benutzer Einsicht hat und mit denen er interagieren kann. Diese sind besonders für die Benutzbarkeit des Produkt wichtig, da diese die wichtigste Produktqualität ist.
\begin{indentE}\mbox{}
	\paragraph{/LF2210/ Datei auswählen}\mbox{}\\
	Der Benutzer wählt eine Datei aus, welche er verschicken möchte. Hierbei soll eine voreilige Kalkulation durchgeführt werden, welche die Dauer der Übertragung schätzt.
	\paragraph{/LF2220/ Empfänger auswählen}\mbox{}\\
	Es werden dem Benutzer die möglichen Empfänger angezeigt und ausgwählt oder er kann den Namen des Empfängers eingeben, um den Empfänger zu bestimmen.
	\paragraph{/LF2230/ Verschlüsselungsschlüssel eingeben}\mbox{}\\
	Wenn kein Standard-Schlüssel ausgewählt ist, muss der Sender diesen bevor dem Verbindungsaufbau eingeben. Dieser muss dann dem Empfänger mitgeteilt werden und dieser muss den selben auch eingeben, um den Datentransfer zu ermöglichen.
	\paragraph{/LF2240/ Datei speichern}\mbox{}\\
	Der Empfänger soll nach dem empfangen der Datei auswählen können, ob diese im Standard-Speicherort gespeichert wird, oder in einem besonderen. Wenn der Besondere ausgewählt worden ist, soll ihm ein Benutzerinterface gezeigt werden, indem er den Speicherort auswählen.
	\paragraph{/LF2250/ Benutzereinstellungen hinzufügen}\mbox{}\\
	Der Benutzer kann einige Fix-Einstellungen auf seinem Produkt tätigen. Darunter zählt die Möglichkeit, den Namen zu ändern, welche de restlichen Nutzern angezeigt wird, die Verschlüsselung zu aktivieren oder deaktivieren, einen Standardschlüssel auszuwählen und einen Standard-Speicherort auszuwählen. Dabei sollen die eingegebenen Daten auf ihre Korrektheit überprüft werden.
	\paragraph{/LF2260/ Appinterface designen}\mbox{}\\
	Es muss ein Interface für das Smartphone entworfen werden. Dazu gehören Mockups und Prototypen. Diese müssen vor deren Implementierung vom Auftraggeber bestätigt werden.
	\paragraph{/LF2270/ Appinterface implementieren}\mbox{}\\
	Das Appinterface muss nach der Bestätigung des Auftraggeber implementiert werden. 
	\paragraph{/LF2050/ Frontend und Backend verbinden}\mbox{}\\
	Es muss ein Verbindung zwischen dem Frontend und Backend erstellt werden, welche die Aufforderungen verarbeitet und zum Backend weiterleitet. Diese Verbindung, soll dem Benutzer entweder mitteilen, wie lange die Verarbeitung noch dauert oder bei kürzeren das wiederholte Aufrufen von Aufforderungen verhindern.
\end{indentE}