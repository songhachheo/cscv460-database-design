-- Table 1
-- Customer (CustomerID, Name, Street, City, State, Zipcode)
create table Customer (
    CustomerID  integer not null constraint customer_pk primary key,
    Name varchar2(20) not null,
    Street varchar2(20) not null,
    City varchar2(20) not null,
    State varchar2(2) not null,
    Zipcode integer not null
);
/
--Table 2
--Film (FilmID, Title, RentalPrice, Kind)
create table Film (
    FilmID integer not null constraint film_pk primary key,
    Title varchar2(20) not null,
    RentalPrice varchar2(20) not null,
    Kind varchar2(20) not null
);
/

--Table 3
--Reserved (CustomerID, FilmID, ResDate)
create table Reserved (
    CustomerID integer not null,
    FilmID integer not null,
    ResDate varchar2(20) not null
);
/