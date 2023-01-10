create or replace function accounting.days_to(_date date) returns integer
    language plpgsql
as
$$
/* CREATED ON 2023-01-9, Mon, 14:48:45 */
DECLARE
    _response INT;
    _day INT;
    _month int;
    _year int;
    _current_year int;
BEGIN
    _year = date_part('year', _date);
    _month = date_part('month', _date);
    _day = date_part('day', _date);
    _current_year = date_part('year', current_date);
    IF (SELECT make_date(_current_year, _month,_day) - current_date) < 0
    THEN SELECT make_date(_current_year +1 , _month,_day) - current_date as daysto into _response;
    ELSE SELECT make_date(_current_year, _month,_day) - current_date as daysto into _response;
    END IF;

    RETURN _response;
END
$$;

alter function accounting.days_to(date) owner to neuroplane;