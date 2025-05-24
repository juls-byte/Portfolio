-- Выведите название страны, где находится город «Salzburg»
SELECT Countries.name AS country_name
FROM Countries JOIN Regions
ON Countries.id=Regions.countryid
JOIN Cities
ON Regions.id=Cities.regionid
WHERE Cities.name = 'Salzburg'
