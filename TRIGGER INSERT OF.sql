ALTER TRIGGER NowyMecz
on RANKING
INSTEAD OF INSERT
AS 
BEGIN
 DECLARE @pkt_gosp INT
 DECLARE @pkt_gosc INT
 SELECT @pkt_gosp=gosp_pkt
 from mecze
 join inserted on
 inserted.nazwa_klubu=mecze.gospodarze
 SELECT @pkt_gosc=goscie_pkt
 from mecze
 join inserted on
 inserted.nazwa_klubu=mecze.goscie

 if(not(
 (@pkt_gosc=3 and @pkt_gosp=0) or 
 (@pkt_gosc=1 and @pkt_gosp=1) or 
 (@pkt_gosc=0 and @pkt_gosp=3) ))
 BEGIN
 RAISERROR('Punkty w meczu sa blednie przyznane',16,1)
 return
 END
 
 INSERT INTO mecze (gosp_pkt,goscie_pkt)
 SELECT @pkt_gosp,@pkt_gosc
 from inserted

END
