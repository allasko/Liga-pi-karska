CREATE VIEW RANKING
AS
select sum(goscie_pkt) + sum(gosp_pkt) as punkty, nazwa_klubu 
from mecze m join  kluby k on (m.gospodarze=klubID or m.goscie=k.klubID) 
group by nazwa_klubu 



