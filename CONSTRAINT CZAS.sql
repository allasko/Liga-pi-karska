
alter table kartki
ADD constraint czasKartka
check (minuta_meczu >= '00:00' and minuta_meczu <= '01:30')

alter table bramki
ADD constraint czasBramka
check (minuta_meczu >= '00:00' and minuta_meczu <= '01:30')


alter table rzuty_wolne
ADD constraint czasWolny
check (minuta_meczu >= '00:00' and minuta_meczu <= '01:30')




