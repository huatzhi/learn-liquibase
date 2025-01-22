INSERT INTO schema2.payment_transactions (order_id, amount, payment_method, status)
SELECT 
  (data->>'order_id')::bigint as order_id,
  (data->>'amount')::decimal as amount,
  data->>'payment_method' as payment_method,
  data->>'status' as status
FROM json_array_elements(
  (SELECT pg_read_file('data/payment-transactions.json')::json)
) as data;