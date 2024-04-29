

CREATE TABLE t_date_time (
	A_time time,
	A_date date,
	A_smalldatetime smalldatetime,
	A_datetime datetime,
	A_datetime2 datetime2,
	A_datetimeoffset datetimeoffset
	)

	SELECT GETDATE(),
		DATENAME(DW, GETDATE()),
		DATEPART(NANOSECOND, GETDATE()),
		DAY(GETDATE()),
		MONTH(GETDATE()),
		YEAR(GETDATE()),
		DATEPART(WEEK, GETDATE())
SELECT GETDATE(),
		EOMONTH(GETDATE())

SELECT *, DATEDIFF(DAY, order_date, shipped_date) AS DATE_DIFF FROM sale.orders
WHERE DATEDIFF(DAY, order_date, shipped_date) > 2

SELECT UPPER(LEFT('clarusway', 1)) + LOWER(RIGHT('clarusway', LEN('clarusway')-1))