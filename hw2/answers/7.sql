-- first section obtains max playtime for each category, only considering games that have designers
-- the we obtain designers for games that match category and maxplaytime of the previous set
with categoriesAndMaxplaytime (c_id, max_pt) as ( select gc.c_id, max(g.maxplaytime) from gamecat as gc, games as g, desgame as dg where gc.g_id = g.g_id and g.g_id=dg.g_id group by gc.c_id)
select distinct d.designer, c.category, campt.max_pt as max from games as g, categoriesAndMaxplaytime as campt, gamecat as gc, categories as c, desgame as dg, designers as d where g.g_id=gc.g_id and gc.c_id = c.c_id and gc.c_id = campt.c_id and g.maxplaytime=campt.max_pt and g.g_id = dg.g_id and dg.des_id = d.des_id order by c.category desc;