INSERT INTO clean.paso (
    SELECT
        uniquecarrier
       ,tailnum
       ,flightdate
       ,deptime
       ,origin
       ,dest
       ,lag(dest) over (
		    partition by
		        uniquecarrier
		       ,tailnum
		       ,origin
		       ,dest
		    ORDER BY flightdate, deptime
		    rows between current row and 1 following
		) AS lag
       ,ntile(20) over (
       	    partition by
       	        extract(year FROM flightdate)
       	    ORDER BY distance
       	) AS qdist
       ,ntile(20) over (
       	    partition by
       	        extract(year FROM flightdate)
       	    ORDER BY airtime
       	) AS qtime
	FROM clean.rita
	WHERE flightdate >  DATE (:v1 || '-01-01')
      AND flightdate <= DATE ((:v1+1) ||'-01-01')
	);