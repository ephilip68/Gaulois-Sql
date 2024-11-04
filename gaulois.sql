/**** Exercice 1 ****/
SELECT nom_lieu FROM lieu
WHERE nom_lieu LIKE "%um";

/**** Exercice 2 ****/
SELECT COUNT(nom_personnage), nom_lieu 
FROM personnage p, lieu l
WHERE p.id_lieu = l.id_lieu
GROUP BY nom_lieu
ORDER BY nom_lieu DESC;

/**** Exercice 3 ****/
SELECT nom_personnage, nom_specialite, adresse_personnage, nom_lieu
FROM lieu l, personnage p, specialite s
WHERE l.id_lieu = p.id_lieu
AND s.id_specialite = p.id_specialite
ORDER BY nom_lieu, nom_personnage; 

/**** Exercice 4 ****/
SELECT COUNT(nom_personnage), nom_specialite 
FROM personnage p, specialite s
WHERE p.id_specialite = s.id_specialite
GROUP BY nom_specialite
ORDER BY COUNT(nom_personnage) DESC;

/**** Exercice 5 ****/
SELECT nom_bataille
FROM bataille b, lieu l
WHERE b.id_lieu = l.id_lieu
ORDER BY date_bataille DESC;

/**** Exercice 6 ****/
SELECT nom_potion, SUM(cout_ingredient) AS total
FROM potion p, ingredient i, composer c
WHERE p.id_potion = c.id_potion
AND i.id_ingredient = c.id_ingredient
GROUP BY p.nom_potion
ORDER BY total DESC;

/**** Exercice 7 ****/
SELECT nom_ingredient, cout_ingredient, qte, nom_potion
FROM ingredient i, potion p, composer c
WHERE i.id_ingredient = c.id_ingredient
AND p.id_potion = c.id_potion
AND nom_potion = "Santé";

/**** Exercice 8 ****/
SELECT nom_personnage, nom_bataille, MAX(qte) AS total_casque
FROM personnage p, bataille b, prendre_casque pc
WHERE p.id_personnage = pc.id_personnage
AND b.id_bataille = pc.id_bataille
AND nom_bataille = "Bataille du village gaulois"
GROUP BY nom_personnage
ORDER BY total_casque DESC;

/**** Exercice 9 ****/
SELECT nom_personnage, SUM(dose_boire) AS total_boire
FROM personnage p, boire b
WHERE p.id_personnage = b.id_personnage
GROUP BY nom_personnage
ORDER BY total_boire DESC;

/**** Exercice 10 ****/
SELECT nom_bataille, SUM(qte) AS total_casque
FROM bataille b, prendre_casque p
WHERE b.id_bataille = p.id_bataille
GROUP BY nom_bataille 
HAVING SUM(qte) >= ALL (SELECT SUM(qte)     
FROM bataille b, prendre_casque p    
WHERE b.id_bataille = p.id_bataille     
GROUP BY b.nom_bataille );

/**** Exercice 11 ****/
SELECT nom_type_casque, COUNT(c.id_type_casque) AS nb, SUM(cout_casque)
FROM type_casque t, casque c
WHERE t.id_type_casque = c.id_type_casque
GROUP BY nom_type_casque
ORDER BY nb DESC;

/**** Exercice 12 ****/
SELECT nom_potion, nom_ingredient
FROM potion p, ingredient i, composer c
WHERE p.id_potion = c.id_potion
AND i.id_ingredient = c.id_ingredient
AND nom_ingredient = "Poisson frais";

/**** Exercice 13 ****/
SELECT nom_lieu, COUNT(nom_personnage) AS total
FROM lieu l, personnage p
WHERE l.id_lieu = p.id_lieu
AND nom_lieu != "Village gaulois"
GROUP BY nom_lieu
HAVING total >= ALL(SELECT COUNT(nom_personnage)
FROM lieu l, personnage p
WHERE l.id_lieu = p.id_lieu
AND nom_lieu != "Village gaulois"
GROUP BY nom_lieu);

/**** Exercice 14 ****/
SELECT p.nom_personnage, p.id_personnage
FROM personnage p
WHERE p.id_personnage NOT IN (SELECT p.id_personnage
FROM personnage p, boire b
WHERE p.id_personnage=b.id_personnage)

/**** Exercice 15 ****/
SELECT nom_personnage
FROM personnage p 
WHERE p.id_personnage NOT IN (SELECT id_personnage
FROM autoriser_boire , potion 
WHERE potion.id_potion = autoriser_boire.id_potion
and potion.nom_potion = "Magique")



/**** Exercice A ****/

