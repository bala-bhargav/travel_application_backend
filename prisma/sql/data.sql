SELECT id FROM search WHERE arrival = 'Hyderabad' OR stops @> ARRAY['srpt'];
