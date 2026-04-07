CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(50)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE IssueRecords (
    issue_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

INSERT INTO Books VALUES (1, 'The Great Gatsby'), (2, '1984'), (3, 'To Kill a Mockingbird');
INSERT INTO Members VALUES (101, 'Alice'), (102, 'Bob'), (103, 'Charlie');

INSERT INTO IssueRecords VALUES (1001, 1, 101);
INSERT INTO IssueRecords VALUES (1002, 2, 102);
INSERT INTO IssueRecords VALUES (1003, 3, 103);

SELECT m.name, b.title
FROM IssueRecords ir
JOIN Members m ON ir.member_id = m.member_id
JOIN Books b ON ir.book_id = b.book_id
WHERE m.name = 'Alice';

SELECT b.title, m.name
FROM IssueRecords ir
JOIN Books b ON ir.book_id = b.book_id
JOIN Members m ON ir.member_id = m.member_id
WHERE b.title = '1984';

SELECT b.title, COUNT(ir.issue_id) AS times_issued
FROM Books b
LEFT JOIN IssueRecords ir ON b.book_id = ir.book_id
GROUP BY b.title;
