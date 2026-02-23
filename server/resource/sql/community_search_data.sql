-- 热门搜索词测试数据
-- created_at 使用 Unix 时间戳
-- 模拟不同时间段的搜索记录，用于验证时间衰减加权算法

DO $$
DECLARE
  now_ts bigint := EXTRACT(EPOCH FROM NOW())::bigint;
BEGIN
  -- GoFrame（7天内多次搜索，权重最高）
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('GoFrame', 1, now_ts - 1*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('GoFrame', 2, now_ts - 2*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('GoFrame', 0, now_ts - 3*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('GoFrame', 3, now_ts - 5*86400);

  -- Vue3（7天内搜索）
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('Vue3', 1, now_ts - 1*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('Vue3', 0, now_ts - 4*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('Vue3', 2, now_ts - 6*86400);

  -- 部署（7天内 + 30天内混合）
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('部署', 1, now_ts - 2*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('部署', 0, now_ts - 15*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('部署', 2, now_ts - 20*86400);

  -- PostgreSQL（30天内）
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('PostgreSQL', 0, now_ts - 10*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('PostgreSQL', 1, now_ts - 12*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('PostgreSQL', 3, now_ts - 25*86400);

  -- 验证码（30天内少量）
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('验证码', 0, now_ts - 8*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('验证码', 2, now_ts - 18*86400);

  -- 权限控制（较早，权重低）
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('权限控制', 1, now_ts - 45*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('权限控制', 0, now_ts - 60*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('权限控制', 2, now_ts - 70*86400);

  -- Tailwind（7天内少量）
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('Tailwind', 0, now_ts - 3*86400);

  -- 登录（7天内）
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('登录', 1, now_ts - 1*86400);
  INSERT INTO xy_community_search_log (keyword, member_id, created_at) VALUES ('登录', 0, now_ts - 2*86400);
END $$;
