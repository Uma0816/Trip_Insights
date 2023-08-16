
/* To find whether the product applied affects the Adjustment_amt */
SELECT 
	 P.id AS Product_Id
	,AD.applied
	,T.fare_type
	,T.service_type
	,T.tap_on_date
	,COUNT(T.trip_id) AS No_Of_Transactions
	,ROUND(AD.adjustment_amount,2) AS Adjustment_Amt
	,T.trip_completion
FROM dbo.adjustments AS AD
JOIN dbo.products AS P
	ON AD.product_id = P.id
JOIN dbo.trips AS T
	ON AD.trip_id = T.trip_id
GROUP BY 
	 AD.adjustment_amount
	,P.id, AD.applied
	,T.fare_type
	,T.service_type
	,T.tap_on_date
	,T.trip_completion
ORDER BY AD.adjustment_amount DESC;