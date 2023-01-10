create function date_ru(_date date) returns text
    language plpgsql
as
$$
/* CREATED ON 2023-01-9, Mon, 14:48:45 */
DECLARE
    _response TEXT;
    _day INT;
    _month int;
    _year int;
BEGIN
    _year = date_part('year', _date);
    _month = date_part('month', _date);
    _day = date_part('day', _date);
    SELECT _day || '.' || _month || '.' || _year as daysto into _response;

    RETURN _response;
END
$$;

alter function date_ru(date) owner to neuroplane;

