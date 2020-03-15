PRO dnsvar_tauqgenrad, d, name, snaps, swap, var, $
    var_title=var_title, var_range=var_range, var_log=var_log, $
    info=info
    IF KEYWORD_SET(info) THEN BEGIN
       message, 'Characteristic time of the genrad losses: tau_qgenrad (s)',/info
       RETURN
    ENDIF ELSE BEGIN
       IF n_params() LT 5 THEN BEGIN
          message,'dnsvar_tauqgenrad, d, name, snaps, swap, var' $
                 +'var_title=var_title, var_range=var_range, var_log=var_log',/info
          RETURN
       ENDIF
       UNITS, units
       var=d->getvar('qgenrad',snaps,swap=swap)
       e=d->getvar('e',snaps,swap=swap) 
       var=ABS(e/(var + 1d-30))*units.ut
       var_title=TEXTOIDL('\tau_{qgenrad} (s)')
       var_range=[1d-1, 1.d3]
       var_log=1
    ENDELSE
END