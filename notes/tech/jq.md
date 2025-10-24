JQ queries



Rules for projectors:
1. Curl the projector cluster with /projections
2. Then use prefix keys to locate msgs
3. Replace ‘|’ with %7C.    Browser parses by default

Ex:
curl https://axonsfspackprodtm-e.dev.target.com/projections/2022-06-08%7C2190%7C75510944 | jq '[.inputs[].shipment_id]'


POT late Shipments
curl https://axonopusfmopendetailsbylocprojector-b.dev.target.com/projections/3 | jq '.inputs[] | select(.pick_due_ts < .pick_completed_ts and .picked_on_time_units == 0 and .pick_completed_date == "2023-08-09")'


Grab fields from query
————————
curl https://axonsfssfmstoreglobalapi.prod.target.com/fulfillment/v1/sfm | jq '.[].rsdt_detail |[.location_id,.open_pick_units,.open_pack_units]|join(",") '

Using [and, or] in jq:
————————-
curl https://axonsfssfmlateunitsbylocprojector-d.prod.target.com/projections/1115 | jq '.inputs[] | select(.open_pick_units > 0 or .open_pack_units > 0) | select(.requested_ship_date < "2024-01-12")'


Opu sfm late orders jq:
————————-
Curl https://axonopusfmlateunitsprojector-e.prod.target.com/projections/1063 | jq '.inputs[] | select(.driveup_open_pick_units > 0 ) | select(.pick_due_date = "2024-03-29")'





curl https://axonopusfmopendetailsbylocprojector-a.prod.target.com/projections/1356 | jq '.inputs[] | select(.open_pick_units > 0 and .pick_due_date == "2024-04-30")’



Curl https://axonopusfmlateunitsprojector-a.prod.target.com/projections/1356 | jq '.inputs[] | select(.open_pick_units > 0 and .pick_due_date == "2024-04-30")'