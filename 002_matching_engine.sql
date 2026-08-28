-- Migration 002: Queue Polling Index & Status Triggers
CREATE INDEX idx_match_queue_search 
ON public.anonymous_match_queue (prompt_id, status, created_at);

-- Set automated expiration rule for unmatched queue entries
ALTER TABLE public.anonymous_match_queue 
ADD CONSTRAINT check_queue_status 
CHECK (status IN ('queued', 'matched', 'expired'));
