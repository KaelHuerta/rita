 INSERT INTO alfie.alfie (
	SELECT 
	    uniquecarrier
	   ,tailnum
	   ,flightdate
	   ,extract(year FROM flightdate) AS year
	   ,extract(month FROM flightdate) AS month
	   ,origin
	   ,dest
	   ,first_value(flightdate) over (
	   		partition by
	   	   	    uniquecarrier
	   	       ,tailnum
		    ORDER BY flightdate
		) AS first
	   ,last_value(flightdate) over (
			partition by
			    uniquecarrier
			   ,tailnum
		    ORDER BY flightdate
		) AS last
	   ,lag(dest) over (
		    partition by
		        uniquecarrier
		       ,flightdate
		       ,tailnum
		       ,origin
		       ,dest
		    ORDER BY flightdate
		       ,deptime rows between current row AND 1 following
		) AS lag
	   ,deptime
	   ,avg(coalesce(arrdelay, 0)) over (
		    partition by
		        uniquecarrier
		       ,tailnum
		       ,origin
		       ,dest
		       ,extract(month FROM flightdate)
		       ,extract(year FROM flightdate)
		) AS delaymonth
	   ,avg(coalesce(arrdelay, 0)) over (
		    partition by
		        uniquecarrier
		       ,tailnum
		       ,origin
		       ,dest
		       ,extract(year FROM flightdate)
		) AS delayyear
	   ,sum(distance) over (
		    partition by
		        uniquecarrier
		       ,extract(year FROM flightdate)
		) AS kmcarrier
	   ,sum(distance) over (
		    partition by
		        uniquecarrier
		       ,tailnum
		       ,extract(year FROM flightdate)
		) AS kmtail
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
	   ,sum(coalesce(airtime, 0)) over (
	   	    partition by
	   	        uniquecarrier
	   	       ,tailnum
	   	       ,extract(year FROM flightdate)
	   	) AS flytime
	   ,sum(1) over (
	   	    partition by
	   	        uniquecarrier
	   	       ,extract(year FROM flightdate)
	   	    ) AS numflights
	   ,sum(1) over (
	   	    partition by
	   	        uniquecarrier
	   	       ,extract(year FROM flightdate)
	   	    ) AS flightscarrier
	   ,sum(1) over (
	   	    partition by
	   	        uniquecarrier
	   	       ,tailnum
	   	       ,extract(year FROM flightdate)
	   	    ) AS flightstail
	   ,sum(case when arrdelay > 0 then 1 else 0 end) over (
	   	    partition by
	   	        uniquecarrier
	   	       ,extract(year FROM flightdate)
	   	) as numdelayscarrier
	   ,sum(case when arrdelay > 0 then 1 else 0 end) over (
	   	    partition by
	   	        uniquecarrier
	   	       ,tailnum
	   	       ,extract(year FROM flightdate)
	   	) as delaystail
	FROM clean.rita
	WHERE flightdate >=  DATE (:v1 || '-01-01')
      AND flightdate < DATE ((:v1+1) ||'-01-01')
      AND uniquecarrier IS NOT NULL
	);