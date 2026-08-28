  supabase/migrations/
 001_anonymous_queue.sql
-- Migration 001: Anonymous Queue & Matching Schema
CREATE TABLE public.anonymous_match_queue (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    prompt_id UUID NOT NULL,
    response_id UUID NOT NULL,
    response_embedding vector(1536),
    status VARCHAR(20) DEFAULT 'queued' CHECK (status IN ('queued', 'matched', 'expired')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, prompt_id)
);

CREATE TABLE public.anonymous_matches (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    prompt_id UUID NOT NULL,
    user_a_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    user_b_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active', 'revealed', 'unmatched')),
    created_at TIMESTAMPTZ DEFAULT NOW()
);
