# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Queries_25
(
query_name varchar(30), 
result varchar(50), 
position int, rating int
);

Truncate table Queries_25;
insert into Queries_25 (query_name, result, position, rating) values ('Dog', 'Golden Retriever', '1', '5');
insert into Queries_25 (query_name, result, position, rating) values ('Dog', 'German Shepherd', '2', '5');
insert into Queries_25 (query_name, result, position, rating) values ('Dog', 'Mule', '200', '1');
insert into Queries_25 (query_name, result, position, rating) values ('Cat', 'Shirazi', '5', '2');
insert into Queries_25 (query_name, result, position, rating) values ('Cat', 'Siamese', '3', '3');
insert into Queries_25 (query_name, result, position, rating) values ('Cat', 'Sphynx', '7', '4');

/*
We define query quality as:
The average of the ratio between query rating and its position.
We also define poor query percentage as:
The percentage of all queries with rating less than 3.
Write an SQL query to find each query_name, the quality and poor_query_percentage.
Both quality and poor_query_percentage should be rounded to 2 decimal places.

Input: 
Queries table:
+------------+-------------------+----------+--------+
| query_name | result            | position | rating |
+------------+-------------------+----------+--------+
| Dog        | Golden Retriever  | 1        | 5      |
| Dog        | German Shepherd   | 2        | 5      |
| Dog        | Mule              | 200      | 1      |
| Cat        | Shirazi           | 5        | 2      |
| Cat        | Siamese           | 3        | 3      |
| Cat        | Sphynx            | 7        | 4      |
+------------+-------------------+----------+--------+
Output: 
+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |
+------------+---------+-----------------------+
Explanation: 
Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33

Cat queries quality equals ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
Cat queries poor_ query_percentage is (1 / 3) * 100 = 33.33
*/

SELECT query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(SUM(
      CASE 
      WHEN rating < 3 THEN 1 ELSE 0 
      END)/ COUNT(*)*100,2) AS poor_query_percentage
FROM Queries_25
GROUP BY query_name;