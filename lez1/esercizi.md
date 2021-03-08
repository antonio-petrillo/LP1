1. Dipende dal caso, se ad esempio:
   
   * e' un software di analisi numerica conviene non catturare l'eccezione
     rendendo piu' facile la scoperta del bug/errore logico nel programma (oppure passi ai complessi).
   * e' un software che emula una calcolatrice si puo' catturare cosicche'
     il software non scoppi, inoltre si puo informare l'utente che ha sbagliato 
     ad inserire l'input.

2. Conviene catturare l'eccezione, cosi invece di chiudere il software si informa l'utente di inserire nuovi fogli e riprovare.
   In altre parole si puo' implementare, in modo semplice e <u>**naturale**</u> una strategia di recovery (eccetto il caso in cui possiedi un Samsung M2070, in quel caso ci vuole solo un po' di fuoco).

3. Conviene non catturare, un caso simile non sempre porta ad un errore (vedi ad esempio un qualunque metodo equals() costruito da un ide), nel caso non sia desiderato come comportamento ha ancora piu' senso dato chefa emergere prima il bug.

4. ~~Meglio catturare, non fare nulla e riprendere l'esecuzione del codice.
   Se ho un metodo che deve solo chiudere un file, ma il file di input e' gia' chiuso, si ha come risultato, come detto anche prima, che il metodo non fa nulla.
   Con un approccio del genere si puo' astrarre un po' il procedimento di chiusura di un file, svolgendo tutte le operazioni di chiusura
   in un unico metodo, liberando il programmatore dall'onere di controllare se il file e' gia' chiuso in altre parti del software.~~
   Il problema e': "**perche' sto lavorando su un file gia' chiuso?**"
   Un caso del genere si potrebbe avere se ho sbagliato ad aprire un file, o se chiamo due volte il metodo di chiusura, entrambi casi che implicano errori in altre parti del codice, quindi direi come risposta definitiva: **Meglio non catturare l'eccezione**.

5. Meglio non catturare, data la premessa si sta usando un metodo che accede ad un campo privato, quindi in precedenza vi e' stato un errore (nella logica) non rilevato.
   Usare una strategia di recovery e' (IMHO ovviamente) sbagliato dato che non si sa cosa ha causato l'errore in precedenza, ed inoltre puo' causare 
   comportamenti poco prevedibili.
