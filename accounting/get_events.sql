create or replace function accounting.get_events(params json, _user bigint) returns json
    language plpgsql
as
$$
/* CREATED ON 2023-01-13, Fri, 12:38:8 */
DECLARE
    _response JSON;
    _user_id bigint;
BEGIN
    _user_id = requireint(params, 'userid');
    SELECT json_agg(a) INTO _response FROM (
        SELECT 'ВСЁ ЗАЕБЦА' as callback
    ) AS a;

    RETURN coalesce(_response,'[]');
END
$$;

alter function accounting.get_events(json, bigint) owner to neuroplane;