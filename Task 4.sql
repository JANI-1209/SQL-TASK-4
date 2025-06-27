USE librarydb;

SELECT 
    (SELECT COUNT(*) FROM Students) AS TotalStudents,
    (SELECT COUNT(*) FROM Books) AS TotalBooks,
    (SELECT COUNT(*) FROM Authors) AS TotalAuthors,
    (SELECT COUNT(*) FROM Categories) AS TotalCategories;

SELECT A.Name AS Author, COUNT(B.BookID) AS BookCount
FROM Authors A
LEFT JOIN Books B ON A.AuthorID = B.AuthorID
GROUP BY A.Name;

SELECT S.Name AS Student, COUNT(BB.BookID) AS BorrowedBooks
FROM Students S
JOIN BorrowedBooks BB ON S.StudentID = BB.StudentID
GROUP BY S.Name;

SELECT
    COUNT(CASE WHEN ReturnDate IS NOT NULL THEN 1 END) AS Returned,
    COUNT(CASE WHEN ReturnDate IS NULL THEN 1 END) AS NotReturned
FROM BorrowedBooks;

SELECT AVG(BorrowedCount) AS AvgBooksPerStudent
FROM (
    SELECT StudentID, COUNT(*) AS BorrowedCount
    FROM BorrowedBooks
    GROUP BY StudentID
) AS Sub;