SELECT SUM(c.Population * (cl.Percentage / 100.0)) AS SpanishSpeakers
FROM countries c
JOIN countries_languages cl ON c.Code = cl.CountryCode
WHERE c.Region LIKE '%Europe%'
AND c.Population > 50000000
AND cl.Language = 'Spanish';
