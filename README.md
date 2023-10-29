
### Creating a database
```
   CREATE DATABASE JobOffersManagementSystem;
```

### DML section
Let's have some examples how you can use existing database to CRUD operations. <br>

I want to get to know only first names of the candidates
```
   SELECT first_name, last_name from candidates;
```

I want to see all the open positions from particular employer (Pracodawca):

<br>

```
   SELECT NazwaStanowiska from Szczegóły oferty
   WHERE IdFirmy=IdPracodawcy;
```

I want to get all the records from Szczegóły Oferty z nazwą stanowiska kończącą się na "er"
<br>
```
   SELECT NazwaStanowiska from Szczegóły oferty
   WHERE NazwaStanowiska LIKE '%er';
```

I want to get all candidates from województwo mazowieckie
Poszukuję specjalistów tlyklo w tym województwie z pracą hybrydową lub stacjonarną