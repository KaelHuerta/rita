--\o '/home/kaelinho/out.csv'
select :v1 || '-01-01';



psql -d rita -t -A -F"," -v v1='2001' -c "select now() as ahora, extract(year from now()) as year;" > /home/kaelinho/output.csv