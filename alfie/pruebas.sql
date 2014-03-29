explain 	    uniquecarrier
	   ,tailnum
--	   ,flightdate
	   ,extract(year FROM flightdate) AS year
	   ,extract(mont FROM flightdate) AS month
	   ,origin
	   ,dest
	   ,first_value(flightdate) over (
	   		partition by
	   	   	    uniquecarrie
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
		       ,tailnum
		    ORDER BY flightdate
		       ,deptime rows between current row AND 1 following
		) AS lag
	   ,deptime
	   ,avg(coalesce(arrdelay, 0)) over (
		    partition by
		        uniquecarrier
		       ,tailnum
		       ,extract(month FROM flightdate)
		       ,extract(year FROM flightdate)
		) AS delay
	   ,sum(distance) over (
		    partition by
		        uniquecarrier
		       ,extract(year FROM flightdate)
		) as km_carrier
	   ,ntile(20) over (
	   	    partition by
	   	        extract(year FROM flightdate)
	   	    ORDER BY distance
	   	) AS qdist
	   ,ntile(20) over (
	   	    partition by
	   	        extract(year FROM flightdate)
	   	    ORDER BY airtime
	   	) as qtime
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
	   	    ) AS flights
	   ,sum(case when arrdelay > 0 then 1 else 0 end) over (
	   	    partition by
	   	        uniquecarrier
	   	       ,extract(year FROM flightdate)
	   	) as num_delays
	FROM clean.rita
	WHERE flightdate >=  DATE (:v1 || '-01-01')
      AND flightdate <= DATE (:v1 ||'-12-31')
      AND uniquecarrier IS NOT NULL
