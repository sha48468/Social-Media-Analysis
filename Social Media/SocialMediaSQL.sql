use SocialMediaDB;

CREATE TABLE DummyData (
    Age INT,
    Gender NVARCHAR(50),
    Time_Spent INT,
    Platform NVARCHAR(50),
    Interests NVARCHAR(50),
    Location NVARCHAR(100),
    Demographics NVARCHAR(50),
    Profession NVARCHAR(100),
    Income INT,
    InDebt BIT,
    IsHomeOwner BIT,
    Owns_Car BIT
);

SELECT * FROM DummyData;

-- סיכום זמן ממוצע שמשתמשים מבלים ברשתות חברתיות לפי פלטפורמה
SELECT platform, AVG(time_spent) AS avg_time_spent
FROM DummyData
GROUP BY platform
ORDER BY avg_time_spent DESC;

-- זיהוי הקשר בין הכנסה לבין זמן שימוש
SELECT 
    CASE 
        WHEN income < 15000 THEN 'Low Income'
        WHEN income BETWEEN 15000 AND 30000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    AVG(time_spent) AS avg_time_spent
FROM DummyData
GROUP BY 
    CASE 
        WHEN income < 15000 THEN 'Low Income'
        WHEN income BETWEEN 15000 AND 30000 THEN 'Medium Income'
        ELSE 'High Income'
    END
ORDER BY avg_time_spent DESC;

--מציאת המקצועות שבהם אנשים מבלים הכי הרבה זמן ברשתות חברתיות
SELECT TOP 5 profession, AVG(time_spent) AS avg_time_spent
FROM DummyData
GROUP BY profession
ORDER BY avg_time_spent DESC;

--פילוח דמוגרפי - כמה משתמשים מכל מיקום
SELECT location, COUNT(*) AS user_count
FROM DummyData
GROUP BY location
ORDER BY user_count DESC;

-- ניתוח התנהגות משתמשים לפי גיל
SELECT 
    CASE 
        WHEN age < 18 THEN 'Teenagers'
        WHEN age BETWEEN 18 AND 30 THEN 'Young Adults'
        WHEN age BETWEEN 31 AND 50 THEN 'Adults'
        ELSE 'Seniors'
    END AS age_group,
    AVG(time_spent) AS avg_time_spent
FROM DummyData
GROUP BY 
    CASE 
        WHEN age < 18 THEN 'Teenagers'
        WHEN age BETWEEN 18 AND 30 THEN 'Young Adults'
        WHEN age BETWEEN 31 AND 50 THEN 'Adults'
        ELSE 'Seniors'
    END
ORDER BY avg_time_spent DESC;

--חיפוש משתמשים שחורגים מהממוצע
SELECT * FROM DummyData
WHERE time_spent > (SELECT AVG(time_spent) FROM DummyData)
ORDER BY time_spent DESC;

--דירוג המקצועות לפי ממוצע הזמן המושקע במדיה חברתית
SELECT 
    profession,
    AVG(time_spent) AS avg_time_spent,
    RANK() OVER (ORDER BY AVG(time_spent) DESC) AS Rank_Position,
    DENSE_RANK() OVER (ORDER BY AVG(time_spent) DESC) AS Dense_Rank_Position
FROM DummyData
GROUP BY profession;

--הצגת המשתמשים שבילו הכי הרבה זמן בכל פלטפורמה
SELECT platform, time_spent,
       ROW_NUMBER() OVER (PARTITION BY platform ORDER BY time_spent DESC) AS RowNum
FROM DummyData;

--הצגת כמה זמן בממוצע המשתמשים מבלים במדיה החברתית לפי פלטפורמה בעזרת pivot 
SELECT * FROM (
    SELECT platform, time_spent
    FROM DummyData
) src
PIVOT (
    AVG(time_spent) 
    FOR platform IN ([Facebook], [Instagram], [YouTube])
) AS PivotTable;

--כמה זמן בממוצע כל מין מבלה במדיה החברתית
SELECT gender, AVG(time_spent) AS avg_time_spent
FROM DummyData
GROUP BY gender
ORDER BY avg_time_spent DESC;

--כמה משתמשים מכל מין יש בכל פלטפורמה
SELECT platform, gender, COUNT(*) AS user_count
FROM DummyData
GROUP BY platform, gender
ORDER BY platform, user_count DESC;

--מציאת המין עם ההכנסה הכי גבוהה והזמן הגבוה ביותר ברשתות
SELECT gender, AVG(income) AS avg_income, AVG(time_spent) AS avg_time_spent
FROM DummyData
GROUP BY gender
ORDER BY avg_income DESC;

--איזה מהמינים מחזיקים יותר בתים ומכוניות
SELECT gender, 
       COUNT(CASE WHEN Owns_Car = 'TRUE' THEN 1 END) AS car_owners,
       COUNT(CASE WHEN isHomeOwner = 'TRUE' THEN 1 END) AS home_owners
FROM DummyData
GROUP BY gender;

--איזה מין צובר יותר חובות
SELECT gender, COUNT(*) AS users_in_debt
FROM DummyData
WHERE inDebt = 'TRUE'
GROUP BY gender
ORDER BY users_in_debt DESC;
