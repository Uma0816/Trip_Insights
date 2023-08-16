/* To find the Adjustment_Amt based on the Product */
SELECT 
	 COUNT(DISTINCT(P.id)) AS Product_Id
	,COUNT(T.trip_id) AS No_Of_Transactions
	,SUM(ROUND(AD.adjustment_amount,2)) AS Adjustment_Amt
FROM dbo.adjustments AS AD
JOIN dbo.products AS P
	ON AD.product_id = P.id
JOIN dbo.trips AS T
	ON AD.trip_id = T.trip_id
GROUP BY 
	AD.adjustment_amount
ORDER BY 
	 No_Of_Transactions
	,AD.adjustment_amount DESC
