
-- liczba bramek strzelonych przez zawodnik�w ka�dego klubu
select count(*) as liczbabramek, nazwa_klubu from bramki join mecze on bramki.meczID=mecze.meczID
join kluby on  (mecze.gospodarze=kluby.klubID or mecze.goscie=kluby.klubID) group by nazwa_klubu


--suma punk�w zdobyta w sezonie przez ka�dy klub 
select sum(goscie_pkt) + sum(gosp_pkt) as punkty, nazwa_klubu 
from mecze m join  kluby k on (m.gospodarze=klubID or m.goscie=k.klubID) 
group by nazwa_klubu 
order by  punkty desc

--nazwiska, imiona i nazwy klub�w zawodnik�w, kt�rzy zdobyli czerwone kartki
select nazwisko, imie, nazwa_klubu from zawodnicy, kartki, kluby 
where zawodnicy.zawodnikID=kartki.zawodnikID and kartki.kolor='czerwona' and zawodnicy.klubID=kluby.klubID

--nazwiska, imiona i nazwy klub�w zawodnik�w, kt�rzy zdobyli ��te kartki
select nazwisko, imie, nazwa_klubu from zawodnicy, kartki, kluby 
where zawodnicy.zawodnikID=kartki.zawodnikID and kartki.kolor='��ta' and zawodnicy.klubID=kluby.klubID

--lista druzyn w kolejnosci od najwiekszej ilosci rzutow wolnych
select count(*) as liczbarzutow, nazwa_klubu from rzuty_wolne, kluby, zawodnicy
where rzuty_wolne.zawodnikID=zawodnicy.zawodnikID and zawodnicy.klubID=kluby.klubID
group by nazwa_klubu order by liczbarzutow desc

--wy�wietlenie wszytskich rzut�w wolnych dla danego klubu
select wolnyID, nazwa_klubu, nazwisko from rzuty_wolne, zawodnicy, kluby 
where rzuty_wolne.zawodnikID=zawodnicy.zawodnikID and zawodnicy.klubID=kluby.klubID 
order by nazwa_klubu


-- wykazanie, �e nie ma takiego s�dziego, �e mego miejsce zamieszkania pokrywa si� z miastem klubu, kt�rego mecz w�a�nie s�dziuje
select nazwisko, meczID from mecze, sedziowie, kluby, adresy where mecze.sedziaID=sedziowie.sedziaID 
and (mecze.gospodarze=kluby.klubID or mecze.goscie=kluby.klubID) and kluby.adresID=adresy.adresID
 and sedziowie.miasto=adresy.miasto
..

