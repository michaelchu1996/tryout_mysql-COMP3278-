SELECT b.bookID, b.name
FROM books b, PurchaseDetail P
WHERE P.cID = 1 AND P.bookID = b.bookID
ORDER BY b.bookID DESC;


SELECT C.cID
FROM Customers C
WHERE C.cID NOT IN(
    SELECT DISTINCT P.cID
    FROM PurchaseDetail P
)
ORDER BY C.cID DESC;

SELECT bookID, name
FROM books
WHERE Price IS NULL
ORDER BY bookID DESC;

SELECT DISTINCT C.cID, C.Nationality
FROM Customers C, PurchaseDetail P, books b
WHERE b.PublishedIN = "China" AND P.bookID = b.bookID AND P.cID = C.cID
ORDER BY C.cID;

SELECT P.cID
FROM books b, PurchaseDetail P
WHERE P.bookID = 1 AND P.cID IN(
    SELECT P.cID
    FROM PurchaseDetail P
    WHERE P.bookID = 3
)
ORDER BY P.cID DESC;

SELECT P.cID, COUNT(P.bookID) as "DistinctBookCount"
FROM PurchaseDetail P
GROUP BY P.cID
HAVING COUNT(P.bookID)>1
ORDER BY P.cID DESC;


SELECT C.cID, COUNT(P.bookID) as "DistinctBookCount"
FROM Customers C LEFT OUTER JOIN PurchaseDetail P ON P.cID = C.cID
GROUP BY P.cID
ORDER BY C.cID DESC;

SELECT b.bookID, b.name
FROM books b
WHERE b.PublishedIN = "USA" AND b.bookID NOT IN (
    SELECT P.bookID
    FROM PurchaseDetail P
    WHERE P.cID = 1
)
ORDER BY b.bookID DESC;


SELECT P2.cID, SUM(P2.quantity)
FROM PurchaseDetail P2, books b2
WHERE b2.PublishedIN = "CHINA" AND b2.bookID = P2.bookID 
GROUP BY P2.cID
HAVING SUM(P2.quantity) >= ALL(
        SELECT SUM(P.quantity)
        FROM PurchaseDetail P
        WHERE P.bookID IN(
            SELECT b.bookID
            FROM books b
            WHERE b.PublishedIN = "China"
        )
        GROUP BY P.cID
)


SELECT P2.cID, SUM(P2.quantity)
FROM PurchaseDetail P2, books b2
WHERE b2.PublishedIN = "CHINA" AND b2.bookID = P2.bookID 
GROUP BY P2.cID
HAVING SUM(P2.quantity) >= (
        SELECT SUM(P.quantity)
        FROM PurchaseDetail P
        WHERE P.bookID IN(
            SELECT b.bookID
            FROM books b
            WHERE b.PublishedIN = "China"
        )
        GROUP BY P.cID
);
    SELECT P.cID as cid, SUM(P.quantity) as "TEST"
    FROM PurchaseDetail P, books b
    WHERE P.bookID = b.bookID AND b.PublishedIN = "China"
    GROUP BY P.cID




SELECT P2.cID, SUM(P2.quantity)
FROM PurchaseDetail P2, books b2
WHERE b2.PublishedIN = "China" AND b2.bookID = P2.bookID 
GROUP BY P2.cID
HAVING SUM(P2.quantity) >= (
    SELECT MAX(temp.test)
    FROM(
        SELECT COUNT(P.quantity) as test
        FROM PurchaseDetail P
        WHERE P.bookID IN(
            SELECT b.bookID
            FROM books b
            WHERE b.PublishedIN = "China"
        )
        GROUP BY P.cID
        )temp
)
ORDER BY P2.cID DESC;

SELECT b.bookID, b.name
FROM books b, PurchaseDetail P2
WHERE P2.bookID = b.bookID
GROUP BY P2.bookID
HAVING SUM(P2.quantity) >=(
    SELECT MAX(temp.xd)
    FROM(
        SELECT SUM(P.quantity) as xd
        FROM PurchaseDetail P
        GROUP BY P.bookID
    )temp
)

SELECT b.bID, COUNT(R.mID)
FROM books b LEFT OUTER JOIN Reservation R ON b2.bID = R.bID
WHERE b.bID = R.bID AND b.location = "main library" AND b.category = "comic"
GROUP BY R.bID


        