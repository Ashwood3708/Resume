Opu SFM Scripts

Db: sfm

shipmentline data for shipment id
--------------------------------------------------------
select s.location_id ,s.fulfillment_type_id ,s.shipment_status_code_id,sl.item_category, s.received_ts,s.pick_due_ts ,sl.last_update_ts ,sl.*
from shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id
where s.shipment_id = 1813347266
and go2.is_perf = false
and (s.external_sub_type is null or s.external_sub_type != 'Starbucks')
--and sl.item_category = 'PAPER_BAG'
--and sl.item_category in ('frozen','perishable','refrigerated')


count shipments and sum active units
--------------------------------------------------------
SELECT s.location_id,Sum(sl.quantity),count(distinct s.shipment_id )
FROM shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id           
WHERE  s.received_ts::DATE > (CURRENT_DATE - 7)
AND ( NOT sl.tcin = '47750281' )
and go2.is_perf = false
AND s.fulfillment_type_id IN ( 1 )
AND s.fulfillment_sub_type_id IN ( 1, 2 )
AND sl.item_category IN ( 'frozen', 'refrigerated', 'perishable' )
AND s.shipment_status_code_id < 5
and s.location_id = 1003
GROUP  BY s.location_id

count shipments and sum active units by item category
--------------------------------------------------------
SELECT s.location_id,sl.item_category,Sum(sl.quantity) as units,Now() AS refresh_ts
from shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id           
WHERE  EXTRACT(DAY FROM s.received_ts) > EXTRACT(DAY FROM Now()) - 7
AND ( NOT sl.tcin = '47750281' )
and go2.is_perf = false
AND s.fulfillment_type_id IN ( 1 )
AND s.fulfillment_sub_type_id IN ( 1, 2 )
AND sl.item_category IN ( 'frozen', 'refrigerated', 'perishable' )
and (s.external_sub_type is null or s.external_sub_type != 'Starbucks')
AND s.shipment_status_code_id < 5
and s.location_id = 1409
GROUP  BY s.location_id,
sl.item_category
ORDER  by s.location_id,
sl.item_category



get all open shipment id
--------------------------------------------------------       
select distinct (s.shipment_id), Sum (sl.quantity)as quantity,sum(sl.quantity_to_pick)as to_pick,sum(sl.quantity_picked) as picked, s.shipment_status_code_id,sl.last_update_ts ::Date,s.pick_due_ts::Date  
from shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id           
WHERE  s.received_ts::DATE > (CURRENT_DATE - 7)
AND ( NOT sl.tcin = '47750281' )
and go2.is_perf = false
AND s.fulfillment_type_id IN ( 1 )
AND s.fulfillment_sub_type_id IN ( 1, 2 )
--AND sl.item_category IN ( 'frozen', 'refrigerated', 'perishable' )
and (s.external_sub_type is null or s.external_sub_type != 'Starbucks')
AND s.shipment_status_code_id < 4
and s.location_id = 901
group by s.shipment_id,sl.last_update_ts::DATE,s.pick_due_ts::Date


total open units
SELECT s.location_id,Sum(sl.quantity_to_pick) AS open_units
from shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id
WHERE  Extract(day FROM s.received_ts) > Extract(day FROM Now()) - 7
AND ( NOT sl.tcin = '47750281' )
and go2.is_perf = false
AND s.fulfillment_type_id IN ( 1 )
AND s.fulfillment_sub_type_id IN ( 1, 2 )
--AND sl.item_category in ( 'frozen', 'refrigerated', 'perishable' )
and (s.external_sub_type is null or s.external_sub_type != 'Starbucks')
AND s.shipment_status_code_id < 4
AND s.location_id = 2090
GROUP  BY s.location_id

#  total open units by item category
--------------------------------------------------------  
SELECT s.location_id,sl.item_category, Sum(sl.quantity_to_pick) AS open_units
from shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id
WHERE  Extract(day FROM s.received_ts) > Extract(day FROM Now()) - 7
AND ( NOT sl.tcin = '47750281' )
and go2.is_perf = false
AND s.fulfillment_type_id IN ( 1 )
AND s.fulfillment_sub_type_id IN ( 1, 2 )
--AND sl.item_category in ( 'frozen', 'refrigerated', 'perishable' )
and (s.external_sub_type is null or s.external_sub_type != 'Starbucks')
AND s.shipment_status_code_id < 4
AND s.location_id = 1328
GROUP  BY s.location_id,sl.item_category
ORDER  BY s.location_id,sl.item_category

total picked units
--------------------------------------------------------
SELECT s.pick_due_ts ::DATE,sum(sl.quantity_to_pick) AS picked_units
from shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id
WHERE s.pick_due_ts::DATE = (CURRENT_DATE)
AND ( NOT sl.tcin = '47750281' )
and go2.is_perf = false
AND s.fulfillment_type_id IN ( 1 )
AND s.fulfillment_sub_type_id IN ( 1, 2 )
AND s.shipment_status_code_id >= 4
--AND s.shipment_status_code_id != 6
AND s.location_id = 2090
--and sl.item_category is null  
--and sl.item_category not in ( 'frozen', 'refrigerated', 'perishable')
--and sl.item_category in ( 'frozen', 'refrigerated', 'perishable')
and (s.external_sub_type is null or s.external_sub_type != 'Starbucks')
GROUP  BY s.pick_due_ts ::Date



total picked units by item category
--------------------------------------------------------
SELECT s.received_ts::DATE,sum(sl.quantity_to_pick) AS picked_units,sl.item_category
from shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id
WHERE  s.received_ts::DATE = (CURRENT_DATE)
AND ( NOT sl.tcin = '47750281' )
AND s.fulfillment_type_id IN ( 1 )
AND s.fulfillment_sub_type_id IN ( 1, 2 )
and go2.is_perf = false
AND s.shipment_status_code_id >= 4
--AND s.shipment_status_code_id = 6
AND s.location_id = 2090
--and sl.item_category is null  
--and sl.item_category not in ( 'frozen', 'refrigerated', 'perishable')
--and sl.item_category in ( 'frozen', 'refrigerated', 'perishable')
and (s.external_sub_type is null or s.external_sub_type != 'Starbucks')
GROUP  BY s.received_ts ::Date,sl.item_category


total completed shipments
--------------------------------------------------------
SELECT s.received_ts::DATE,count(distinct sl.shipment_id),sl.shipment_id ,s.shipment_status_code_id  
from shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id
WHERE  s.received_ts::DATE = (CURRENT_DATE)
AND ( NOT sl.tcin = '47750281' )
and go2.is_perf = false
AND s.fulfillment_type_id IN ( 1 )
AND s.fulfillment_sub_type_id IN ( 1, 2 )
AND s.shipment_status_code_id in (5,8)
AND s.location_id = 3
and (s.external_sub_type is null or s.external_sub_type != 'Starbucks')
GROUP  BY s.received_ts ::Date,sl.shipment_id ,s.shipment_status_code_id

late units
--------------------------------------------------------       
select s.location_id ,sum(sl.quantity_to_pick)as to_pick
from shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id           
WHERE ( NOT sl.tcin = '47750281' )
and go2.is_perf = false
AND s.fulfillment_type_id IN ( 1 )
--AND sl.item_category IN ( 'frozen', 'refrigerated', 'perishable' )
AND s.shipment_status_code_id < 4
and s.pick_due_ts < Now()  at Time zone 'America/Chicago'
and s.location_id = 301
group by s.location_id

late units by item category
--------------------------------------------------------       
select s.location_id ,sum(sl.quantity_to_pick)as to_pick, sl.item_category
from shipment s
join shipment_line sl on s.shipment_id = sl.shipment_id
join guest_order go2  on go2.guest_order_id  = s.guest_order_id           
WHERE ( NOT sl.tcin = '47750281' )
and go2.is_perf = false
AND s.fulfillment_type_id IN ( 1 )
AND s.shipment_status_code_id < 4
and s.pick_due_ts < Now()  
and s.location_id = 301
group by s.location_id ,sl.item_category

late units by shipment
--------------------------------------------------------   
select sum(sl.quantity),s.shipment_id  
from shipment s  
inner join shipment_line sl on sl.shipment_id =s.shipment_id
where s.shipment_status_code_id <4
and s.fulfillment_type_id=1  
and location_id=867
and sl.item_category in ( 'frozen', 'refrigerated', 'perishable' )
and not sl.tcin ='47750281'
and s.pick_due_ts < now()
group  by s.shipment_id 
